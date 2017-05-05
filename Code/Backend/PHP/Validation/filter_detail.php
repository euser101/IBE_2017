<?php
      

    require "config.php";
	try {  
    	$hName = unserialize($_GET["hName"]);
		$sql = "SELECT Name_Hotel, Preis, Sterne, Bewertung, Bild FROM tbl_hotel, tbl_ort, tbl_bild WHERE Name_Hotel='$hName' and FK_Ort = PK_Ort";
          
     
        $stmt = $connect->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();
        

        	
        //Displaying the result as a table if result isnt empty
        /*if (empty($result)) {
          $errMsg = "No Results were found. Please check your input.";      
          echo $errMsg;   
        }else{
          	$row = 0;
            for ($col = 0; $col < 4; $col++) {
              echo "<li>".$result[$row][$col]."</li>";
            
            } echo "</ul>";
            
          

        }*/
        $x = array_values($result)[0];
        $x = (int)$x;
        if (empty($result)) {
          $errMsg = "No Results were found. Please check your input.";      
          echo $errMsg;   
        }else{
          for ($row = 0; $row < $x; $row++) {
            echo "<p><b>Row number $row</b></p>";
            echo "<img src='".$result[$row][4]."'>";
            echo "<ul>";
            for ($col = 0; $col < 4; $col++) {
              echo "<li>".$result[$row][$col]."</li>";
            
}            echo "</ul>";
          }
        }






    }
catch(PDOException $error) {  
  $errMsg = $error->getMessage();  
}  
?>