<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

include_once './config/Database.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

if (isset($data->id) && isset($data->task)) {
    $id = $data->id;
    $task = $data->task;

    $query = "UPDATE todos SET task = :task WHERE id = :id";
    $stmt = $db->prepare($query);
    $stmt->bindParam(":id", $id);
    $stmt->bindParam(":task", $task);

    if ($stmt->execute()) {
        echo json_encode(array("message" => "Todo updated successfully."));
    } else {
        echo json_encode(array("message" => "Failed to update todo."));
    }
} else {
    echo json_encode(array("message" => "Missing data."));
}
