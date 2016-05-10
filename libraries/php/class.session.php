<?php
class Session extends ZConfig{
    private $_linkDB;
    private $sessid;
      /*
    function __construct(){

    }
  
    function __destruct(){
        self::destroy($this->sessid);
        self::close();
    }
    */
    public function open(){	 
        if($this->_linkDB = mysql_connect( $this->db_host, $this->db_user, $this->db_password)) {
            mysql_query("SET NAMES utf8;"); 
            mysql_query("SET CHARACTER_SET_CLIENT=utf8;"); 
            mysql_query("SET CHARACTER_SET_RESULTS=utf8;"); 
            return mysql_select_db($this->db_database, $this->_linkDB);
        }
        return false;
    }

    public function close(){
        return mysql_close($this->_linkDB);
    }

    public function read($sessid){
        if( empty($sessid) || !isset($sessid) ) return '';
            $sql = "SELECT `value` FROM `sessions` WHERE `sesskey` = '{$sessid}';";
            if ($result = mysql_query($sql, $this->_linkDB)) {
                if(mysql_num_rows($result)){
                    $record = mysql_fetch_assoc($result);
                    return $record['value'];
                }
            }
        return '';
    }

    public function write($sessid, $value){
        $this->sessid = mysql_real_escape_string($sessid);
		if( empty($value) || !isset($value) ) return false;
		$sql = sprintf("REPLACE INTO `sessions` VALUES('%s', '%s', '%s')",
							mysql_real_escape_string($sessid),
							(int)mysql_real_escape_string(time()),
							mysql_real_escape_string($value)
							);
							
        return mysql_query($sql, $this->_linkDB);
    }

    public function destroy($sessid){
        if(empty($sessid)){
            $sessid = $this->sessid;
        }
        $sql = sprintf("DELETE FROM `sessions` WHERE `sesskey` = '%s';", mysql_real_escape_string($sessid));
        return mysql_query($sql, $this->_linkDB);
    }

    /**
     * Garbage Collector
     * @param int life time (sec.)
     * @return bool
     * @see session.gc_divisor      100
     * @see session.gc_maxlifetime 1440
     * @see session.gc_probability    1
     * @usage execution rate 1/100
     *        (session.gc_probability/session.gc_divisor)
     */
    public function gc($maxlifetime){
        $sql = sprintf("DELETE FROM `sessions` WHERE `expiry` < '%s'",	time() - $maxlifetime);
        return mysql_query($sql, $this->_linkDB);
    }
}


ini_set('session.save_handler', 'user');
ini_set('session.gc_probability', 1);
ini_set("session.gc_divisor", 1);
ini_set("session.gc_maxlifetime", 3600*24);
ini_set("session.cookie_lifetime", 3600*24);

$session = new Session();
session_set_save_handler(	array($session, 'open'),	array($session, 'close'),array($session, 'read'),	array($session, 'write'),array($session, 'destroy'),	array($session, 'gc'));
session_start();

session_regenerate_id(true);
?>