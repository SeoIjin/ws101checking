<?php
// api_get_requests.php
header('Content-Type: application/json');
header('Cache-Control: no-store, no-cache, must-revalidate');

$host = 'localhost';
$user = 'root';        // change if your MySQL user is different
$pass = '';            // your MySQL password
$dbname = 'users';     // database name from your dump

$conn = new mysqli($host, $user, $pass, $dbname);

// Check connection
if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed']);
    exit;
}

// Fetch requests and their latest status updates if needed
$sql = "
    SELECT 
        r.id,
        r.ticket_id,
        r.fullname AS name,
        r.requesttype AS type,
        IFNULL(NULLIF(r.priority, ''), 'Medium') AS priority,
        r.status,
        DATE_FORMAT(r.submitted_at, '%b %d, %Y %h:%i %p') AS submitted
    FROM requests AS r
    ORDER BY r.submitted_at DESC
";

$result = $conn->query($sql);

if (!$result) {
    http_response_code(500);
    echo json_encode(['error' => 'Query failed']);
    exit;
}

$requests = [];
while ($row = $result->fetch_assoc()) {
    // Normalize status for frontend filters
    $status = strtolower($row['status']);
    switch ($status) {
        case 'pending':
            $row['status'] = 'Under Review';
            break;
        case 'under review':
            $row['status'] = 'Under Review';
            break;
        case 'in progress':
            $row['status'] = 'In Progress';
            break;
        case 'ready':
            $row['status'] = 'Ready';
            break;
        case 'completed':
            $row['status'] = 'Completed';
            break;
        default:
            $row['status'] = ucfirst($status);
            break;
    }

    $requests[] = $row;
}

echo json_encode($requests);
$conn->close();
