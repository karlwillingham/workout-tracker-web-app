<?php
include_once 'dbConnect.php';

// Insert Form Data
$db = new dbConnect();
$postData = $_POST;
$arr = $postData['workoutList'];
$userId = $postData['userId'];

foreach ($arr['id'] as $key => $val) {
  $rep = $arr['reps'][$key];
  $amount = $arr['amount'][$key];

  // Only insert if rep and Amount present
  if ($rep != null && $amount != null) {
    $keyValueArray = array(
      "userId" => $userId,
      "workout_workoutListId" => $key,
      "reps" => $rep,
      "amount" => $amount
    );

    $db->insert($keyValueArray, 'DataCollection');
  }

}

echo "1";
 ?>
