<?php
	require "config.php";
	session_start();
try {  
  

      if(isset($_POST["search"]))
      {
        $preis = $_POST["range_p"];
        //$ort = $_POST["Ort"];
        $land = $_POST["reise_z"];
        //$hName = $_POST["Hotelname"];
       

        if(!isset($preis, $ort, $land, $hName)){ //Dynamic SQL

           if (isset($land)) {

              $sqlFrom[] = " tbl_land";
              $sqlSelect[] = " Name_Land";
              $sql[] = " Name_Land = '$land' ";
              
            }
           if (isset($hName)) {

              $sqlFrom[] = " tbl_hotel";
              $sqlSelect[] = " Name_Hotel";
              $sql[] = " Name_Hotel = '$hName' ";
            }
            if (isset($ort)) {

              $sqlFrom[] = " tbl_ort";
              $sql[] = " Name_ort = '$ort' ";
            }
            if (isset($preis)) {

              $sqlForm[] = " tbl_zimmer";
              $sqlSelect[] = " Preis";
              $sql[] = " Preis = '$preis' ";
            }
          //Final Query
        if (!empty($sql)) {

            if($sqlSelect > 1){
              $sqlSelect = implode(", ", $sqlSelect);
              //FIX: Last element doesnt need a comma
            }
            if($sqlFrom > 1){
              $sqlFrom = implode(", ", $sqlFrom);
            }

            //Converting the arrays to string so the query can use it
            /*serialize($sqlSelect);
            serialize($sqlFrom);*/

            //FIX THIS
            //$query = "SELECT $sqlSelect FROM $sqlFrom WHERE Name_Land = Schweiz";
            $query = "SELECT * FROM `tbl_land` WHERE Name_Land = Schweiz";

            /*
            $query = "SELECT $sqlSelect FROM $sqlFrom 'WHERE ' . implode(' AND ', $sql)";*/

            $stmt = $connect->prepare($query);//QUERY mit OR/LIKE
                    $stmt->execute();

            
            foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
              print_r($row);

            }
          }
        }

      }
      else{
          $errMsg = "Please input something to search for.";
      } 
    }
catch(PDOException $error) {  
  $errMsg = $error->getMessage();  
}  
        /*
        if(!isset($preis, $ort, $land, $hName){//Dynamic SQL
            unset($sql);
            //http://stackoverflow.com/questions/15794179/create-a-dynamic-mysql-query-using-php-variables
            //example query: User inputs land and ort, SELECT $preis, $ort FROM tbl_Land, tbl_ort

            if (isset($hName)) {
              $sqlFrom[] = " tbl_hotel";
              $sqlSelect[] = " Name_Hotel";
              $sql[] = " Name_Hotel = '$hName' ";
            }
            if (isset($ort)) {
              $sqlFrom[] = " tbl_ort";
              $sql[] = " Name_ort = '$ort' ";
            }
            if (isset($preis)) {
              $sqlForm[] = " tbl_zimmer";
              $sqlSelect[] = " Preis";
              $sql[] = " Preis = '$preis' ";
            }
            if (isset($Land)) {
              $sqlFrom[] = " tbl_land";
              $sqlSelect[] = " Name_Land";
              $sql[] = " Name_Land = '$land' ";
            }
            

            //Final Query
            if (!empty($sql)) {
              if($sqlSelect > 1){
                $sqlSelect = implode(", ", $sqlSelect);
                //FIX: Last element doesnt need a comma
              }
              if($sqlFrom > 1){
                $sqlFrom = implode(", ", $sqlFrom);
              }
              $query = "SELECT $sqlSelect FROM $sqlFrom 'WHERE ' . implode(' AND ', $sql)";
              $stmt = $connect->prepare($query);//QUERY mit OR/LIKE
                      $stmt->execute();

            foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
              print_r($row);
            }
          }
            
        }  
  
        } 
      }*/
      

?>