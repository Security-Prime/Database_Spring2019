<?php
class DbUtil{
	public static $loginUser = "ja7ad"; 
	public static $loginPass = "Arakiddingme29135!";
	public static $host = "mysql.cs.virginia.edu"; // DB Host
	public static $schema = "ja7ad_project"; // DB Schema
	
	public static function loginConnection(){
		$db = new mysqli(DbUtil::$host, DbUtil::$loginUser, DbUtil::$loginPass, DbUtil::$schema);
	
		if($db->connect_errno){
			echo("Could not connect to db");
			$db->close();
			exit();
		}
		
		return $db;
	}
	
}
?>

