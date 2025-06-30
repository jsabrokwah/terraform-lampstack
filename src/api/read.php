<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once './config/Database.php';

$database = new Database();
$db = $database->connect();

$query = "SELECT * FROM todos";
$stmt = $db->prepare($query);
$stmt->execute();

$todos = array();

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $todos[] = $row;
}

echo json_encode($todos);
