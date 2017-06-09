<?php   
  require "config.php";
  try {
    //http timeout fix
    header("Cache-Control: max-age=600");
    $hName = unserialize($_GET["hName"]);
    $sql = "SELECT Name_Hotel, Preis, Sterne, Bewertung, Beschreibung, Bild, Location FROM tbl_hotel, tbl_ort, tbl_bild WHERE Name_Hotel='$hName' AND FK_Hotel = PK_Hotel AND PK_Ort = FK_Ort";
    
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
              <script src='JS/copyright_update.js'></script>
              <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
          </head>
          <body id='start'>         
          ";
          echo $html1;
          include('HTML/navbar.html');
          echo "<br>";
          echo "<br>";
          echo "<div id='ListeHotel'>";
          $path = "img/hotels/";

          echo "<div class='HotelName'</div>";

          echo "<div style='text-align: center'</div>";
          echo "<h3>".$result[0][0]."</h3>";
          $starNumber = implode(array($result[0][2]));

            if ($starNumber < 5) {
              for($y=1;$y<=$starNumber;$y++) {
                    echo '<img src="img/stars/star_full.png" style="width:3%;"/>';
                }
                if (strpos($starNumber,'.')) {
                    echo '<img src="img/stars/star_full.png" style="width:3%;"/>';
                    $y++;
                }
                while ($y<=5){
                    echo '<img src="img/stars/star_part.png" style="width:3%;"/>';
                    $y++;
                }

          }
          echo "</div>";
          echo "<br>";
          echo "</div>";

          /*
          Slideshow
          */
          
          echo "<div class='slideshow-container'</div>";
          for ($i=0; $i < 3; $i++) {      
            echo "<div class='mySlides fade'>";
              echo "<div class='numbertext'>$i / 2</div>";
              echo "<img src='".$path.$result[$i][5]."' style='width:100%'>";
              echo "<div class='text'>".$result[0][0]."</div>";
            echo "</div>";

          }  

          $html2 = "
            <a class='prev' onclick='plusSlides(-1)'>?</a>
            <a class='next' onclick='plusSlides(1)'>?</a>

            </div>
            <br>

            <div style='text-align:center'>
              <span class='dot' onclick='currentSlide(1)'></span> 
              <span class='dot' onclick='currentSlide(2)'></span> 
              <span class='dot' onclick='currentSlide(3)'></span> 
            </div>
            <script> 

            </script>
            <script src='JS/Bewertungen.js'></script>
            <script src='JS/Hotelfeed.js'></script>

            </br>

            <div id='flip'>Für Beschreibung und Bewertungen &#x2192; klicken</div>

            <div id='panel'>
            <p>";
            $html3 = "
            Baur au Lac heißt Booking.com-Gäste seit 14. Dez. 2009 willkommen.</br>
            </br>";
            $html4 = "(Durchschnittliche Bewertung)
             
              </br>
              </br>
               Eigene Bewetung abgeben: <style= 'color:white'>
              </p>
              </div>
          ";   
          
          echo $html2;
          echo $result[0][4];
          echo $html3;
         //echo $result[0][3];

          $starNumber = implode(array($result[0][3]));
            if ($starNumber < 5) {
              for($y=1;$y<=$starNumber;$y++) {
                    echo '<img src="img/stars/star_full.png" style="width:3%;"/>';
                }
                if (strpos($starNumber,'.')) {
                    echo '<img src="img/stars/star_full.png" style="width:3%;"/>';
                    $y++;
                }
                while ($y<=5){
                    echo '<img src="img/stars/star_part.png" style="width:3%;"/>';
                    $y++;
                }

          }
          echo $html4;
    }

}
catch(PDOException $error) {  
  $errMsg = $error->getMessage();  
}  
?>