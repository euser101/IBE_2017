<?php   
  require "config.php";
	try {
    //http timeout fix
    header("Cache-Control: max-age=600");
    $hName = unserialize($_GET["hName"]);
		$sql = "SELECT Name_Hotel, Preis, Sterne, Bewertung, Beschreibung, Bild, Location FROM tbl_hotel, tbl_ort, tbl_bild WHERE Name_Hotel='$hName' AND FK_Hotel = PK_Hotel";
    
    


        $stmt = $connect->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();

        $x = array_values($result)[0];
        $x = (int)$x;
        if (empty($result)) {
          $errMsg = "No Results were found. Please check your input.";      
          echo $errMsg;   
        }else{

          //<?php include('HTML/navbar.html'); 
          $footer = "footer.html";
          $navbar = "navbar.html";
          $hdr = "<?php include('HTML/$navbar');?>";

          $hdr2 = "include('HTML/$navbar');";
          $ftr = "<?php include('HTML/$footer');?>";

          $html1 = "
          <!DOCTYPE html>
          <html>
          <head>
              <meta charset='utf-8'>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
              <link rel='stylesheet' href='CSS/frontend_style.css'>
              <link href='CSS/stylesheet.css' rel='stylesheet'>
            <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
          </head>
          <body id='start'>          
          ";
          echo $html1;
          include('HTML/navbar.html');
          echo $sql;
          $html2 = "

          ";


          $slide1 = "path";

          /*<div class="slideshow-container">

          <div class="mySlides fade">
            <div class="numbertext">1 / 3</div>
            <img src="../img/Schweiz/BaurauLac/Hotel1_Bild1_ch.jpg" style="width:100%">
            <div class="text">Caption Text</div>
          </div>

          <div class="mySlides fade">
            <div class="numbertext">2 / 3</div>
            <img src="../img/Schweiz/BaurauLac/Hotel1_Bild2_ch.jpg" style="width:100%">
            <div class="text">Caption Two</div>
          </div>

          <div class="mySlides fade">
            <div class="numbertext">3 / 3</div>
            <img src="../img/Schweiz/BaurauLac/Hotel1_Bild3_ch.jpg" style="width:100%">
            <div class="text">Caption Three</div>
          </div>

          <a class="prev" onclick="plusSlides(-1)">?</a>
          <a class="next" onclick="plusSlides(1)">?</a>

          </div>*/

          //Preparing pics for slideshow



          $path = "img/hotels/";
          for ($row = 0; $row < $x; $row++) {
            //echo "<p><b>Row number $row</b></p>";
            echo "<img src='".$path.$result[$row][5]."'>";

            echo "<iframe id='Top10map' src='".$result[$row][6]."'frameborder='0 style='border:0' allowfullscreen target='_blank'></iframe>";
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