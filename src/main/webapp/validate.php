<?php
header("Content-Type: application/json");

// Get form data
$name = trim($_POST['name'] ?? '');
$email = trim($_POST['email'] ?? '');
$password = trim($_POST['password'] ?? '');
$phone = trim($_POST['phone'] ?? '');

$errors = [];

// Name validation
if (empty($name)) {
    $errors[] = "Name cannot be empty";
} elseif (!preg_match("/^[a-zA-Z\s]+$/", $name)) {
    $errors[] = "Name can only contain letters and spaces";
}

// Email validation
if (empty($email)) {
    $errors[] = "Email cannot be empty";
} elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = "Invalid email format";
}

// Password validation
if (empty($password)) {
    $errors[] = "Password cannot be empty";
} elseif (strlen($password) < 6) {
    $errors[] = "Password must be at least 6 characters long";
}

// Phone validation
if (empty($phone)) {
    $errors[] = "Phone number cannot be empty";
} elseif (!preg_match("/^[0-9]{10}$/", $phone)) {
    $errors[] = "Phone must contain exactly 10 digits";
}

// Send result
if (count($errors) > 0) {
    echo json_encode(["status" => "error", "messages" => $errors]);
} else {
    echo json_encode(["status" => "success", "messages" => ["All inputs are valid ✅"]]);
}
?>
