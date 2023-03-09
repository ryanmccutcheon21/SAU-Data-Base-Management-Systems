<html>
<body>

<?php
$value1 = $_POST["id"];
$value2 = $_POST["name"];
$value3 = $_POST["dept_name"];
$value4 = $_POST["tot_cred"];
echo $value1;
echo "  ";
echo $value2;
echo " ";
echo $value3;
echo "  ";
echo $value4;

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "universitydb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
else{
	echo "<br/>connected to database successfully<br/>";
}

$sql = "insert into student (id, name, dept_name, tot_cred) values ('$value1', '$value2', '$value3', '$value4')";
if ($conn->query($sql) === TRUE) {
    echo "<br>Inserted successfully<br>";
} else {
    echo "<br>Error creating table: " . $conn->error;
}
$conn->close();
?>

</body>
</html>