<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

include_once './config/Database.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

if (isset($data->task)) {
    $task = $data->task;

    $query = "INSERT INTO todos (task) VALUES (:task)";
    $stmt = $db->prepare($query);
    $stmt->bindParam(":task", $task);

    if ($stmt->execute()) {
        echo json_encode(array("message" => "Todo created successfully."));
    } else {
        echo json_encode(array("message" => "Failed to create todo."));
    }
} else {
    echo json_encode(array("message" => "No data received."));
}
