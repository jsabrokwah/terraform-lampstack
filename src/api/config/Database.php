<?php
class Database {
    private $host = "DB_HOST_PLACEHOLDER";
    private $db_name = "DB_NAME_PLACEHOLDER";
    private $username = "DB_USER_PLACEHOLDER";
    private $password = "DB_PASS_PLACEHOLDER";
    public $conn;

    public function connect() {
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $e) {
            echo "Connection error: " . $e->getMessage();
        }

        return $this->conn;
    }
}
?>
