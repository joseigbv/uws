<?php if ($_SERVER[REMOTE_ADDR] == '127.0.0.1')
	move_uploaded_file($_FILES['file']['tmp_name'], '/tmp/' . basename($_FILES['file']['name']));
?>
