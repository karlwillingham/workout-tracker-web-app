<?php
include_once 'dbConnect.php';

// Connect to DB and Decode Form Post Data
$db = new dbConnect();
$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$workoutListId = $request->workoutListId;
$userId = $request->userId;
$workoutArray = $db->getWorkoutData($workoutListId, $userId);
echo json_encode($workoutArray);

?>
