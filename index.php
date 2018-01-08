<?php
SESSION_START();
include 'http://th1-speedvpn.sytes.net:81/UserOnline.php';
if(!$_SESSION['user']['username']){
	header("location: https://speedvpn.store");
}

?>
