<?php
  require "config.php";
  session_start();
try {  
      //HTTP doc timeout fix
      header("Cache-Control: max-age=600");
      if(isset($_POST["search"])) {
        //Declaring vars
          $sortBy="";
        $landHotelOrt = $_POST["reise_z"];
        $preis = $_POST["range_p"];
        $anr = $_POST["anreise"];
        $abr = $_POST["abreise"];
        if(isset($_POST["sortByP"])){
            $sortP = $_POST["sortByP"];
            $sortBy = "order by Preis";
        }
        if(isset($_POST["sortByS"])){
           $sortS = $_POST["sortByS"];
           $sortBy = "order by Sterne desc";
        }
        if(isset($_POST["sortByB"])){
          $sortB = $_POST["sortByB"];
          $sortBy = "order by Bewertung desc";
        }
               
        //Filtering out the Query to get dynamic SQL
        if( isset($landHotelOrt) || isset($preis) || isset($anr) || isset($abr) || isset($zimmer) || isset($erw) || isset($kin) ){ 
          
          $rowName = array();
          $tbl_name = array();
          $cond = array();

          //Building the query 
          if (isset($landHotelOrt)) {
            $rowName[] = "Bild, Name_Hotel, Sterne, Bewertung, Preis";
            $tbl_name[] = "tbl_Hotel, tbl_ort, tbl_land, tbl_bild";
            $cond[] = "(Name_Hotel LIKE '%$landHotelOrt%' OR Name_Land LIKE '%$landHotelOrt%' OR Name_Ort LIKE '%$landHotelOrt%') AND PK_Ort = FK_Ort AND FK_Land = PK_Land AND PK_Hotel = FK_Hotel";
          }
          if (isset($preis) && $preis > 0) { 

            if (isset($landHotelOrt)) { // || isset($preis) || isset($zimmer)
              //$rowName[] = ", Preis";
              $cond[] =" AND Preis <= $preis";
            }else{
             // $rowName[] = "Preis"; 
              $tbl_name[] = "tbl_hotel";
              $cond[] = "Preis <= $preis";
            }
          }
          if (isset($zimmer)) {
            
            if (isset($preis)) {
              $tbl_name[] = "";
            }else{

              if (isset($landHotelOrt)) {
                $tbl_name[] = ", tbl_hotel";
              }else{
                $tbl_name[] = "tbl_hotel";
              }             
            }           

            if ($zimmer > 0) {      
            if (isset($landHotelOrt) || isset($Preis) && $zimmer > 0) {
              $rowName[] = ", Anzahl_Verfuegbar";
              $cond[] = "AND Anzahl_Verfuegbar = $zimmer"; //Invalid AND?

              if (isset($preis)) {
                $tbl_name[] = "";
              }else{
                if (isset($landHotelOrt)) {
                  $tbl_name[] = ", tbl_hotel";
                }else{
                  $tbl_name[] = "tbl_hotel";
                }              
              } 
    
            }else{
              $rowName[] = "Anzahl_Verfuegbar";

              if (isset($preis) && $preis > 0 ) {
                $tbl_name[] = "";
                $cond[] = " AND Anzahl_Verfuegbar = $zimmer";
              }else{

                if (isset($landHotelOrt) || isset($zimmer) ) {
                  $tbl_name[] = ", tbl_hotel";
                  $cond[] = " OR Anzahl_Verfuegbar = $zimmer";
                }else{
                  

                    if (isset($landHotelOrt)) {
                      $tbl_name[] = ", tbl_hotel";
                    }else{
                      $tbl_name[] = "tbl_hotel";
                    }
                    $cond[] = "Anzahl_Verfuegbar = $zimmer";
                    
                } 


              } 

            }

           }

        }
            

        $final_row = implode(" ", $rowName);
        $final_tbl = implode(" ", $tbl_name);
        $final_con = implode(" ", $cond);     
        

         if (isset($preis) && $preis > 0) { 
            $count_preis = " AND Preis <= $preis";
         }else{        
            $count_preis = "";
         }

        $countSQL = "SELECT count(PK_Hotel) FROM tbl_land, tbl_ort, tbl_hotel WHERE pk_ort = fk_ort and pk_land = fk_land and (Name_Land LIKE '%$landHotelOrt%' OR Name_Ort LIKE '%$landHotelOrt%' OR Name_Hotel LIKE '%$landHotelOrt%') $count_preis;";
        $mainSQL = "SELECT $final_row FROM $final_tbl WHERE $final_con GROUP BY Name_Hotel $sortBy;";
        
        //PDO Sql queries     
        $stmt0 = $connect->prepare($countSQL);
        $stmt1 = $connect->prepare($mainSQL);

        $stmt0->execute();
        $stmt1->execute();

        $result0 = $stmt0->fetchAll();
        $result1 = $stmt1->fetchAll();

        $count = $result0[0][0]; //How many results match?
        $realVal = count($result1); //Count results
        
        $errBtn = "<span class='closebtn'>&times;</span>";

        $startHTML = " <!doctype html>
            <html lang='de'>
              <head>
                <meta charset='utf-8'>
                <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                 <link href='CSS/stylesheet.css' rel='stylesheet'>
                <link href='CSS/stylesheet.css' rel='stylesheet'>
               <script src='JS/copyright_update.js'></script>
               <script src='JS/sort.js'></script>
               <link href='stylesheet.css' rel='stylesheet'>
                <title>Suche</title>

                <!--<link rel='import' href='navbar.html'>-->


              </head>
              <body>
              
              
                <ul class='topnav' id='myTopnav'>
            <li><img style ='padding-top: 10px; ' class='logo' src='img/Logo.png' alt='home'/></li>
            <li><a style ='padding-top: 15px; padding-bottom: 15px;' href='#home'>Home</a></li>
			<li><a style ='padding-top: 15px; padding-bottom: 15px;' href='HTML/Top10.html'>Top 10</a></li>
			<li><a style ='padding-top: 15px; padding-bottom: 15px;' href='HTML/AGB.html'>AGB</a></li>
			<li><a style ='padding-top: 15px; padding-bottom: 15px;' href='HTML/#Hilfe.html'>Hilfe</a></li>
			<li><a style ='padding-top: 15px; padding-bottom: 15px;' href='HTML/#Konto.html'>Konto</a></li>
			<li class='icon'>
			<a href='javascript:void(0);' onclick='myFunction()'>&#9776;</a>
			</li>
		</ul>
              <script>
                    /* Toggle between adding and removing the 'responsive' class to topnav when the user clicks on the icon */
                    function myFunction() {
                      var x = document.getElementById('myTopnav');
                      if (x.className === 'topnav') {
                          x.className += ' responsive';
                      } else {
                          x.className = 'topnav';
                      }
                  }  
                   function updateTextInput(val) {
          document.getElementById('textInput').value=val; 
        }
                    function updateRangeInput(val) {
          document.getElementById('RangePreis').value=val; 
        }
               </script>
            <style>
            /* Remove margins and padding from the list, and add a black background color */
            ul.topnav {
                list-style-type: none;
                margin: 0;
                padding: 2px;
                overflow: hidden;
                background-color: #D8D8D8;
            }
            /* Float the list items side by side */
            ul.topnav li {float: left;}
            /* Style the links inside the list items */
            ul.topnav li a {
                display: inline-block;
                color: #2E2E2E;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                transition: 0.3s;
                font-size: 23px;
              font-family: Arial;
              font-style: italic;
            }
            /* Change background color of links on hover */
            ul.topnav li a:hover {background-color: #77AFE1; color:#000000; }
            /* Hide the list item that contains the link that should open and close the topnav on small screens */
            ul.topnav li.icon {display: none;}
            /* When the screen is less than 680 pixels wide, hide all list items, except for the first one ('Home'). Show the list item that contains the link to open and close the topnav (li.icon) */
            @media screen and (max-width:680px) {
              ul.topnav li:not(:first-child) {display: none;}
              ul.topnav li.icon {
                float: right;
                display: inline-block;
              }
            }
            /* The 'responsive' class is added to the topnav with JavaScript when the user clicks on the icon. This class makes the topnav look good on small screens */
            @media screen and (max-width:680px) {
              ul.topnav.responsive {position: relative;}
              ul.topnav.responsive li.icon {
                position: absolute;
                right: 0;
                top: 0;
              }
              ul.topnav.responsive li {
                float: none;
                display: inline;
              }
              ul.topnav.responsive li a {
                display: block;
                text-align: left;
              }
            }
            /*Styling alert button*/
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
                opacity: 1;
                transition: opacity 0.6s;
                margin-bottom: 15px;
            }

            .alert.success {background-color: #4CAF50;}
            .alert.info {background-color: #2196F3;}
            .alert.warning {background-color: #ff9800;}

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }
          
          </style>
              
            <div id='main_image'>
            <div id='mask'>
              <!--Eingabe Reiseziel-->
    <form method='post' class='AuswahlFelder'action='input_filter.php'>
	<!--Eingabe Reiseziel-->
	Reiseziel<br>
	<input type='text' name='reise_z' placeholder='Land, Hotelname'>
	<br>
	
	<!--Preis angabe-->
	Preis<br>
	<input name='range_p' id='RangePreis' type='range' min='0' max='500' step='10' onchange='updateTextInput(this.value);' /> 
    <input type='text' id='textInput' value='' size='1' onchange='updateRangeInput(this.value);'>
    <br>
    <br>
	<!--An- und Abreise-->
	<label for='gebdat'>
    Anreise<br> 
    <input type='date' id='gebdat' name='anreise'>
	</label>
	<br>
	
	<label for='gebdat'>
    Abreise<br> 
    <input type='date' id='gebdat' name='abreise'>
	</label>
	<br>
	
		

	<br>
    Sortieren nach: <br>
  <input type='radio' name='sortByP' value='Preis' class='sort'>Preis<br>
  <input type='radio' name='sortByS' value='Sterne'class='sort'> Sterne<br>
  <input type='radio' name='sortByB' value='Bewertung'class='sort'> Bewertung
  <br>
	<!--Knopf Suche-->
	<button class='buttonSuche' name='search' style='vertical-align:middle'><span>Suche </span></button>

</form>
</div>
</div>
";
        $endHTML = "<footer>
            <article>
            &copy <script>refreshCopyright();</script> IBE_2017 
            <br>
            Website is under construction <br>Change Language | <a href='help.html'>Help</a>
            </article>
          </footer>
          <style>
          /*Styling the footer*/
          footer {
            position: scroll;
            display: block;
            right: 0;
            left: 0;
            bottom: 0;
            text-align: center;
            background-color: #1D4D77;
            padding: 2.5%;
            width: 100%;
            margin-top: 5%;

          }
          /*End of footerstyle*/
          </style>
          </html>";

          //Displaying the result as a table if result isnt empty
          if ($realVal == 0){// | empty($result2) | empty($result3)
            $errMsg = "Please check your input.";            
           
          //Start HTML
          echo $startHTML;

            //Format error message
            echo "<div class='alert'>";

              echo "<strong>No Results were found! </strong> $errMsg";
              echo "</div>";   

            

          //End HTML
          echo $endHTML;
          }else{

              if ($count > 0) {
                $i = 1;
              }else{
                $i=0;
              }
            $row = 0;
            $path = "img/hotels/";
          
          //Start HTML
          echo $startHTML;

              
            //Format count of found query
            if (isset($landHotelOrt)) {
              echo "<div class='alert success'>";
              echo "<strong>$count</strong>";
              if ($count > 1) {
                echo " Resultate für: ".$landHotelOrt."";
              }else{
                echo " Resultat für: ".$landHotelOrt."";
              } 
              echo "</div>";   
              echo "<br>"; 
              echo "<br>"; 
            }
    
            for ($i; $i <= $count; $i++) { 
                          //echo "<img src='".$result1[$row][0]."'>";
                          echo "<div id='ListeHotel'>";
                            echo "<div class='Hotel'>";
                            echo "<img class='bild_liste' src='".$path.$result1[$row][0]."'>";       
                            echo "<h2>".$result1[$row][1]."</h2>";
                            echo "<p>".$result1[$row][2]." Sterne</p>";  

                           if ($result1[$row][3] > 1) {
                              echo "<p>".$result1[$row][3]." Bewertungen</p>";
                            }else{
                              echo "<p>".$result1[$row][3]." Bewertung</p>";
                            }
                            
                            echo "<p class='price'>".$result1[$row][4]." CHF</p>";

                          $hname = serialize($result1[$row][1]);
                            echo "<form method='post' action='filter_detail.php?hName=$hname' name='adv_search'><input type='submit' name='hotelname' value='Mehr Infos'></form>";   
                          echo "</div>";
                          //Getting the hotelname and saving it to the url for next query
                                  
                        $row++;
                        echo "</div>";
              }         
    
          //End HTML
          echo $endHTML;

        }
    
      }
      else{
          $errMsg = "Please input something to search for.";
      } 
    }
  }
catch(PDOException $error) {  
  $errMsg = $error->getMessage();  
}
?>