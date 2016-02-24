
<?php

class dbConnect extends DatabaseConnect {

  /** Constructor with Default DB Values */
  function __construct() {
    include_once 'config.php';
    include_once 'functions.php';
    parent::__construct(HOST, USER, PASSWORD, DATABASE);
  }


  /* Add Custom Project Database Queries/Actions */
  function loginCredentials($username,$password) {
    $userData = trim($username);
    $passwordData = encrypt($password);
    $sql = 'SELECT id, name, password
            FROM '. TBL_USER .'
            WHERE name= "'.$userData.'" AND password="'.$passwordData.'"';
    return $this->queryString($sql, true);
  }

  function getWorkoutList() {
    $sql = 'SELECT id, groupingId, name, `order` AS orderId
            FROM '. TBL_WORKOUT_LIST .'
            WHERE hide=0';
    return $this->queryString($sql, true);
  }

  function getWorkoutDataHistory($userId) {
    $sql = 'SELECT *
            FROM dataCollectionHistory
            WHERE userId=' . $userId;
    return $this->queryString($sql, true);
  }


  function getWorkoutData($listId, $userId) {
    // Old Query Need to filter dataCollection by userid
    $sql = 'SELECT * FROM workoutFormAndData AS w
            WHERE w.workoutListId ='.$listId ;

    // Updated Query
    $sql = 'SELECT w.id AS id,w.workoutListId AS workoutListId,
    w.workoutId AS workoutId,w.listName AS listName,
    w.workoutName AS workoutName,w.setNum AS setNum,w.reps AS reps,
    w.help AS help,w.listOrder AS listOrder,w.workoutOrder AS workoutOrder,
    d.userId AS userId,d.workout_workoutListId AS workout_workoutListId,
    d.reps AS prevReps,d.amount AS prevAmount,d.dateTime AS dateTime
    FROM workoutForm w
    LEFT JOIN (
      SELECT d1.id AS dataId,d1.userId AS userId,
      d1.workout_workoutListId AS workout_workoutListId,
      d1.reps AS reps,d1.amount AS amount,d1.dateTime AS dateTime
      FROM DataCollection d1
      WHERE d1.userId = ' . $userId . ' AND (d1.dateTime = (
                                SELECT max(d2.dateTime)
                                FROM DataCollection d2
                                WHERE (d2.workout_workoutListId = d1.workout_workoutListId
                                        AND d2.userId = ' . $userId . '))
                                )
    )
    AS d on w.id = d.workout_workoutListId
    WHERE w.workoutListId =' . $listId ;

    return $this->queryString($sql, true);
  }

}


/*************************************************************
* Database Connection - Do not modify -
* Modify Child Class Above
*
*************************************************************/
class DatabaseConnect {
  private $db;

  /** To Gran access to another user in Database - Run SQL:
  * grant all on myDB.* to 'userName'@localhost identified by "pswrd";
  */
  function __construct($host,$user,$password,$database) {
    $this->db = $this->connectToDB($host,$user,$password,$database); // Return db Object
  }

  function select() {
    return 'Not yet implemented';
  }

  function delete() {
    return 'Not yet implemented';
  }

  /**
  * Update records from key(column) => value Array
  * Useful for Form key value Post/Get Operations
  * $condition - WHERE CLAUSE
  */
  function update($keyValueArray, $table, $condition) {

    $keyValueArray = $this->sanitize_array($keyValueArray);
    $sqlSet = '';
    foreach($keyValueArray as $column => $value)
    $sqlSet .= $column . "= '" . $value . "',";

    $query = "UPDATE ".$table . "
    SET ". rtrim($sqlSet, ',')
    . $condition;

    $result = $this->db->query($query);
    if (!$result) {
      die("Update failed: " . $this->db->error);
      return false;
    }
    return true;
  }

  /**
  * Insert one record at a time from key => value Array
  * Useful for Form key value Post/Get Operations
  */
  function insert($keyValueArray, $table) {
    $keyValueArray = $this->sanitize_array($keyValueArray);
    $columns = array_keys($keyValueArray);
    $query = "INSERT INTO ".$table."(". implode(',', $columns) .")
    VALUES('".implode("','", $keyValueArray)."')";

    $result = $this->db->query($query);
    if (!$result) {
      die("Insertion failed: " . $this->db->error);
      return false;
    }
    return true;
  }


  function queryString($sqlQuery, $showOutput) {
    $result = $this->db->query($sqlQuery);
    $output = "";

    if (!$result) {
      $output = "Query failed: " . $this->db->error ;
    } else if ($showOutput)  {
      $output = array();
      while ($recordArray = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $output[] = $recordArray;
      }
      mysqli_free_result($result);
    }

    return $output;
  }

  function connectToDB($host, $user, $password, $database) {
    $db_connection = new mysqli($host, $user, $password, $database);
    if ($db_connection->connect_error) {
      die($db_connection->connect_error);
    }
    return $db_connection;
  }

  function sanitize_array($keyValueArray) {
    foreach ($keyValueArray as $key => $value) {
      $keyValueArray[$key] = $this->sanitize_string($value);
    }
    return $keyValueArray;
  }

  function sanitize_string($string) {
    if (get_magic_quotes_gpc())  $string = stripslashes($string);
    return htmlentities($this->db->real_escape_string($string));
  }

  function close() {
    $this->db->close();
  }

}

?>
