<?php
class ZPOSDB extends ZConfig{
	public $add_sql;
	public $update_sql;
	public $delete_sql;
	public $select_sql;
	public $Search_sql;
	public $retrieve_sql;
	public $error;
	
	public function __construct()
	{
		mysql_connect($this->db_host, $this->db_user, $this->db_password) || die('無法與資料庫建立連結');
		mysql_select_db($this->db_database) || die('無法選擇資料庫：'.$this->db_database);
		mysql_query("SET NAMES utf8;"); 
		mysql_query("SET CHARACTER_SET_CLIENT=utf8;"); 
		mysql_query("SET CHARACTER_SET_RESULTS=utf8;"); 					
	}
	public function __destruct()
	{
	
	}
	
	public function Add()
	{
		//$this->setSQL();
		return mysql_query($this->add_sql);
	}
	 
	public function Insert()
	{
		return mysql_query($this->sqltext);
	}	 
	 
	public function Update()
	{
		//$this->setSQL();
		$sql = ($this->sqltext) ? $this->sqltext : $this->update_sql;
		return mysql_query($sql );
    }
	
	public function Delete()
	{
		//$this->setSQL();
		$sql = ($this->sqltext) ? $this->sqltext : $this->delete_sql;
		return mysql_query($sql);
	}
	
	public function Search()
	{
		//$this->setSQL();	
		$rs = array();
		$result = mysql_query($this->Search_sql);
		//echo $this->Search_sql;
		if($result){
			while($row = mysql_fetch_row($result)){
				array_push($rs, $row);
			}
			return $rs;
			mysql_free_result($result);
		}else{
			return false;
		}		
	}
	public function Search_assoc()
	{
		//$this->setSQL();
		return $this->recordset($this->Search_sql);
	}

	public function Select()
	{
		//$this->setSQL();
		return $this->recordset($this->select_sql);
	}
	
	public function dataCount()
	{
		//$this->setSQL();
		$result = mysql_query($this->select_sql_count);
		return mysql_result($result,0);
		mysql_free_result($result);
	}
	
	public function recordset($sql)
	{
		$rs = array();
		$result = mysql_query($sql);
		if($result){
			while($record = mysql_fetch_assoc($result)){
				array_push($rs, $record);
			}
			return $rs;
			mysql_free_result($result);
		}else{
			return false;
		}
	}

   public function Retrieve()
   {
      $rs = array();
      //	$this->setSQL();
      return $this-> recordset($this->retrieve_sql);
   }
}


?>