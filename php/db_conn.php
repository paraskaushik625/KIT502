<?php
//Define variable towhere the database file is
$dbFile = '/var/www/html/parask1/phpliteadmin/db/WWC2024.db';

try {
    $db = new PDO("sqlite:$dbFile");
    //set the PDO error mode to exception
    $db -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}

?>