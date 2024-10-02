<?php
// Connection details
$db_username = 'PH';  // Replace with your actual Oracle username
$db_password = 'MySuperPassword2024';  // Replace with your actual Oracle password
$db_connection_string = 'oracle-db:1521/FREEPDB1';  // Format: host:port/ServiceName or SID
$db_host = 'oracle-db';  // This should match the service name in your Docker Compose file
$db_port = '1521';
$db_service = 'MYPDB';  // This should match the PDB name you specified in ORACLE_PDB

// Construct the connection string
$db_connection_string = "//$db_host:$db_port/$db_service";

// Connect to the Oracle Database
$conn = oci_connect($db_username, $db_password, $db_connection_string);

if (!$conn) {
    $e = oci_error();
    echo "Erreur de connexion : " . htmlentities($e['message'], ENT_QUOTES);
    echo "<br>Code: " . htmlentities($e['code'], ENT_QUOTES);
    echo "<br>SQL: " . htmlentities($e['sqltext'], ENT_QUOTES);
} else {
    echo "Connexion réussie à Oracle!";
    oci_close($conn);
}
