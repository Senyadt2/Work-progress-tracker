<?php 
require "Database.php";
class crud {
    private $con;
    public function __construct() {
        $db = new Database();
        $this->con = $db->getConnection();
    }
    //select 
    //updateOne, updateAll
    //delete
    public function insert($table, $item_arr) {
        $statment = "insert into " . $table;
        $cols = "(";
        $vals = "values(";
        foreach($item_arr as $k => $v) {
            $cols .= $k . ",";
            $vals .= "'" . $v . "',";
        }
        $cols = rtrim($cols, ",");
        $vals = rtrim($vals, ",");
        $cols .= ")";
        $vals .= ")";
        $query = $statment . $cols . $vals;
        $ret = mysqli_query($this->con, $query);
    }

    // public function select($table, $item_arr) {
    //     $statment = "select * from " . $table;
    //     $where = "where ";
    //     $i = 0;
    //     foreach($item_arr as $k => $v) 
    //     {
    //      if($i > 0) 
    //      {
    //         $where .= " and ";
    //      }
    //         $where .= $k . " = '" . $v . "'";
    //          $i++;
    //     }
    //     $query = $statment . $where;
    //     $ret = mysqli_query($this->con, $query);
    //     return $ret;
    // }

 public function getUsers($table){
        $sql = "select * from ".$table;
        $stmt = mysqli_query($this->con,$sql);
        if($stmt->num_rows > 0){

            while($row = $stmt->fetch_assoc())
            {
                $data[] = $row;
            }
            return $data;
        } 
        else{
            return 0;
        }
    }

    // public function delete($table){
    //     $id = $_GET['id'];
    //     $sql = "delete from ".$table." where id = ".$id;
    //     $stmt = mysqli_query($this->con,$sql);
    // }

}