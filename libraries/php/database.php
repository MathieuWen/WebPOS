<?php
class ZDatabase {
	protected $mysqli;
	protected $CONFIG;
	public $showerror = true;

	function Zerror($txt){
		if($this->showerror){
			printf("<p style=\"color:red;\">%s</p>", htmlspecialchars($txt));
		}
	}
	
	function __construct()
	{
		$root = str_replace('libraries'.DIRECTORY_SEPARATOR.'php','', dirname(__FILE__));
		require_once $root.'configuration.php';
		$this -> CONFIG = new ZConfig();
		
		$this->mysqli  = new mysqli($this -> CONFIG->db_host, $this -> CONFIG->db_user, $this -> CONFIG->db_password, $this -> CONFIG->db_database);
		$this -> mysqli->set_charset("utf8");
		if(mysqli_connect_errno()){
			self::Zerror("Link DB error ".mysqli_connect_error());
			$this->mysqli = false;
			die();
		}
		
      self::execute("SET NAMES utf8;");
      self::execute("SET CHARACTER_SET_CLIENT=utf8;");
      self::execute("SET CHARACTER_SET_RESULTS=utf8;");
	}

	function __destruct()
	{
      self::close();
	}

	public function Zquery($sql)
	{
		if($result = $this->mysqli->query($sql)){
			$rs = array();
			if($result->num_rows){
				while($record = $result->fetch_assoc()){
					array_push($rs, $record);
				}
				return $rs;
				unset($rs);
			}else{
				return false;
			}
		}else{
			self::Zerror($this->mysqli->error);
			return false;
		}
	}
	
	public function ZquerySingle($sql)
	{
		if($result = $this->mysqli->query($sql)){
			if($record = $result->fetch_array()){
				//$result->close();
				return $record[0];
			}else{
				return -1;
			}
		}else{
         self::Zerror($this->mysqli->error);
         return false;
		}		
	}
	public function execute($sql)
	{
		if($result = $this->mysqli->query($sql)){
			return true;
		}else{
			self::Zerror($this->mysqli->error);
			return false;
		}
	}
   
   public function close()
   {
		if($this->mysqli){
			$this->mysqli->close();
		}
		unset($this->CONFIG);
		unset($this->mysqli);   
   }
}



?>