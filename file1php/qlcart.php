<?php
if (!isset($_SESSION)) session_start();
include 'connect.php';
$tam= isset($_SESSION['cart'])?$_SESSION['cart']:[];
$action= isset($_GET['action'])?$_GET['action']:'';
if ($action=='them')
{
	$id= isset($_GET['id'])?$_GET['id']:'';
	$soluong = 1;
	if ($id!='')
	{
		if (isset($tam[$id]))
			$tam[$id] += $soluong;
		else 
			$tam[$id]= $soluong;
	}
}

if ($action=='xoa')
{
	$id= isset($_GET['id'])?$_GET['id']:'';
	unset($tam[$id]);
	
}
if ($action=='huy')
{
	$tam=[];
}
$_SESSION['cart']= $tam;
header('location:cart.php');