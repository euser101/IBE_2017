<?php
	require "config.php";
	session_start();
try  
 {  
  
      if(isset($_POST[""]))
      {  
        if(isset(($_POST[""])||isset($_POST[""])||isset($_POST[""]||isset($_POST[""])
        {//Dynamic MQSQL
            if ($_POST["Reiseziel"]) {
              $query0 = "tbl_Ort AND tbl_land WHERE Name_Ort = $var OR Name_Land = $var";
            }
            if ($_POST["Preis"]) {
              $query1 = "tbl_zimmer WHERE Preis < $var";
            }
            if ($_POST[""]) {
              
            }
            if ($_POST[""]) {
              
            }
            if ($_POST[""]) {
              
            }
        }  else{
          $errMsg = "Please input a value.";
        }
               
        //-- Defining variables/filters --//
		$uInput1 = $_POST[""];
		/*$uPreis = $_POST[""];*/
		extract(array_map("htmlspecialchars", $_POST), EXTR_OVERWRITE, "u_");
		$errMsg   

           
           if(empty($pw) || empty($usr))  
           {  
                $errMsg = "";          
           }  
           else  
           {  
           		//TODO: Check which form fields have values and go through conditions/queries accordingly
           		if ($uInput1 != "" ) {
           	        $stmt = $connect->prepare('SELECT Name_Hotel, Name_Land FROM tbl_hotel, tbl_land WHERE Name_Land = :nLand OR Name_Hotel = :nHotel');//QUERY mit OR/LIKE
                    $stmt->execute(array(
                 	  ':nLand' => $uInput1,
                 	  ':nHotel' => $uInput1,
                 	));
           		}elseif ($ != "") {//What if user inputs price AND hotelname?
           			
           		}elseif (condition) {
           			
           		}else{
           			$errMsg = "No results were found."
           		}

                    
           }  
      }  
 }  
 catch(PDOException $error)  
 {  
      $errmsg = $error->getMessage();  
 }  
 ?>  
?>