<?php
include('db_conn.php');

// Get paper details from POST request
$paperType = $_POST['paperType'];
$title = $_POST['title'];
$abstract = $_POST['abstract'];

// Insert new paper details into the database
$query = "INSERT INTO papers (userID, paper_type, accepted, title, abstract) VALUES ('$userID', '$paperType', 'False', '$title', '$abstract')";
$db->exec($query);
?>
