<?php 
if (!isset($_SESSION))
session_start(); 
 
isset($_SESSION['username']);
unset($_SESSION['username']); // xóa session login

header('location: index.php');