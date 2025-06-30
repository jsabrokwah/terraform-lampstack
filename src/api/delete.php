<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json");

include_once './config/Database.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

if (isset($data->id)) {
    $id = $data->id;

    $query = "DELETE FROM todos WHERE id = :id";
    $stmt = $db->prepare($query);
    $stmt->bindParam(":id", $id);

    if ($stmt->execute()) {
        echo json_encode(array("message" => "Todo deleted successfully."));
    } else {
        echo json_encode(array("message" => "Failed to delete todo."));
    }
} else {
    echo json_encode(array("message" => "No ID received."));
}
