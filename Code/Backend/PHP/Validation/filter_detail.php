<?php
      

  require "config.php";
	try {  
    	$hName = unserialize($_GET["hName"]);
		$sql = "SELECT Name_Hotel, Preis, Sterne, Bewertung, Beschreibung, Bild, Location FROM tbl_hotel, tbl_ort, tbl_bild, tbl_zimmer WHERE Name_Hotel='$hName' AND FK_Hotel = PK_Hotel";
          
     
        $stmt = $connect->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        
        $x = array_values($result)[0];
        $x = (int)$x;
        if (empty($result)) {
          $errMsg = "No Results were found. Please check your input.";      
          echo $errMsg;   
        }else{
          for ($row = 0; $row < $x; $row++) {
            //echo "<p><b>Row number $row</b></p>";

            echo "<img src='".$result[$row][5]."'>";
            echo "<iframe id='Top10map' src='".$result[$row][6]."'frameborder='0 style='border:0' allowfullscreen></iframe>";
            echo "<ul>";
            
            for ($col = 0; $col < 5; $col++) {
              echo "<p>".$result[$row][$col]."</p>";
           	  echo "</ul>";

			 }

      $starNumber = implode(array($result[$row][2]));
      if ($starNumber < 5) {
        for($y=1;$y<=$starNumber;$y++) {
              echo '<img src="img/stars/star_full.png" style="width:5%;"/>';
          }
          if (strpos($starNumber,'.')) {
              echo '<img src="img/stars/star_full.png" style="width:5%;"/>';
              $y++;
          }
          while ($y<=5){
              echo '<img src="img/stars/star_part.png" style="width:5%;"/>';
              $y++;
          }
      }
			 



         }
       }






    }
catch(PDOException $error) {  
  $errMsg = $error->getMessage();  
}  
?>