<?php
// PHP Proxy to forward requests to app_ec2_instance API

// The private IP of the app_ec2_instance API server
$apiServer = getenv('APP_INSTANCE_PRIVATE_IP') ?: 'APP_INSTANCE_PRIVATE_IP_PLACEHOLDER';

// Get the request method and URI
$method = $_SERVER['REQUEST_METHOD'];
$requestUri = $_SERVER['REQUEST_URI'];

// Extract the path after /api/proxy.php
$path = substr($requestUri, strpos($requestUri, '/proxy.php') + strlen('/proxy.php'));

// Build the target URL to forward the request to
$targetUrl = "http://$apiServer/api" . $path;

// Initialize cURL
$ch = curl_init();

// Set cURL options based on method
switch ($method) {
    case 'GET':
        if (!empty($_SERVER['QUERY_STRING'])) {
            $targetUrl .= '?' . $_SERVER['QUERY_STRING'];
        }
        curl_setopt($ch, CURLOPT_HTTPGET, true);
        break;
    case 'POST':
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, file_get_contents('php://input'));
        break;
    case 'DELETE':
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');
        curl_setopt($ch, CURLOPT_POSTFIELDS, file_get_contents('php://input'));
        break;
    default:
        // Other methods can be added as needed
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($ch, CURLOPT_POSTFIELDS, file_get_contents('php://input'));
        break;
}

// Forward headers from the original request
$headers = [];
foreach (getallheaders() as $name => $value) {
    if (strtolower($name) !== 'host') { // Skip Host header
        $headers[] = "$name: $value";
    }
}
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

// Set URL and return transfer
curl_setopt($ch, CURLOPT_URL, $targetUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute the request
$response = curl_exec($ch);

// Forward response headers
$header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
$content_type = curl_getinfo($ch, CURLINFO_CONTENT_TYPE);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

if ($content_type) {
    header("Content-Type: $content_type");
}
http_response_code($http_code);

curl_close($ch);

// Output the response
echo $response;
?>
