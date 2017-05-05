<?php
      

    require "config.php";
	try {  
    	$hName = unserialize($_GET["hName"]);
		$sql = "SELECT Name_Hotel, Preis, Sterne, Bewertung, Bild, Location FROM tbl_hotel, tbl_ort, tbl_bild WHERE Name_Hotel='$hName' and FK_Ort = PK_Ort";
          
     
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
            echo "<img src='".$result[$row][4]."'>";
            echo "<iframe id='Top10map' src='".$result[$row][5]."'frameborder='0 style='border:0' allowfullscreen></iframe>";
            echo "<ul>";
            
            for ($col = 0; $col < 4; $col++) {
              echo "<li>".$result[$row][$col]."</li>";
           	  echo "</ul>";
			}


			//$starNumber = serialize($result[$row][1]);
			$starNumber = 50;

			 for($y=1;$y<=$starNumber;$y++) {
			        echo '<img src="star.png" style="width:5%;"/>';
			    }
			    if (strpos($starNumber,'.')) {
			        echo '<img src="star.png" style="width:5%;"/>';
			        $y++;
			    }
			    while ($y<=4) {
			        echo '<img src="emptystar.jpeg" style="width:5%;"/>';
			        $y++;
			    }



          }
        }






    }
catch(PDOException $error) {  
  $errMsg = $error->getMessage();  
}  
?>