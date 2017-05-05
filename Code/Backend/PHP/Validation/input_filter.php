<?php
  require "config.php";
  session_start();
try {  
      if(isset($_POST["search"])) /*TODO:
      //Make sure that html slider defaults values to 0 or not specified (Advanced Filter)
      Adjust the multidimensional array, so that only hotels that match to a specific country get listed and not all of them*/
      {
        //Declaring vars
        $landHotelOrt = $_POST["reise_z"];
        $preis = $_POST["range_p"];
        $anr = $_POST["anreise"];
        $abr = $_POST["abreise"];
        $zimmer = $_POST["zimmer"];
        $erw = $_POST["erwachsene"];
        $kin = $_POST["kinder"];
        //Filtering out the Query to get dynamic SQL
        if( isset($landHotelOrt) || isset($preis) || isset($anr) || isset($abr) || isset($zimmer) || isset($erw) || isset($kin) ){ 
          
          $rowName = array();
          $tbl_name = array();
          $cond = array();

          //Building the query w regex
          if (isset($landHotelOrt)) {
            $rowName[] = "Name_Land, Name_Ort, Name_Hotel";
            $tbl_name[] = "tbl_land, tbl_ort, tbl_hotel";// FIX WHITESPACE tbl_hotel , tbl_zimmer
            $cond[] = "pk_ort = fk_ort and pk_land = fk_land and (Name_Land = '$landHotelOrt' OR Name_Ort = '$landHotelOrt' OR Name_Hotel = '$landHotelOrt')";         
          }
          if (isset($preis) && $preis > 0) { 

            if (isset($landHotelOrt)) { // || isset($preis) || isset($zimmer)
              $rowName[] = ", Preis";
              $tbl_name[] = ", tbl_zimmer";
              $cond[] =" AND Preis <= $preis";

            }else{
              $rowName[] = "Preis"; 
              $tbl_name[] = "tbl_zimmer";
              $cond[] = "Preis <= $preis";
            }

          }
          if (isset($zimmer)) {
            
            if (isset($preis)) {
              $tbl_name[] = "";
            }else{

              if (isset($landHotelOrt)) {
                $tbl_name[] = ", tbl_zimmer";
              }else{
                $tbl_name[] = "tbl_zimmer";
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
                  $tbl_name[] = ", tbl_zimmer";
                }else{
                  $tbl_name[] = "tbl_zimmer";
                }
                
              } 
    
            }else{
              $rowName[] = "Anzahl_Verfuegbar";

              if (isset($preis) && $preis > 0 ) {// WHY Name_Land = 'as' OR Name_Ort = 'as' OR Name_Hotel = 'as' AND Preis <= 500 , Anzahl_Verfuegbar = 1
                $tbl_name[] = "";
                $cond[] = " AND Anzahl_Verfuegbar = $zimmer";
              }else{

                if (isset($landHotelOrt) || isset($zimmer) ) {
                  $tbl_name[] = ", tbl_zimmer";
                  $cond[] = " OR Anzahl_Verfuegbar = $zimmer";
                }else{
                  

                    if (isset($landHotelOrt)) {
                      $tbl_name[] = ", tbl_zimmer";
                    }else{
                      $tbl_name[] = "tbl_zimmer";
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
          
          //echo $final_con;

          //Joining the final query
          $sql = "SELECT count(Pk_hotel), $final_row FROM $final_tbl WHERE $final_con;";
          
          $stmt = $connect->prepare($sql);

          $sql2 = "SELECT count(Pk_hotel) FROM $final_tbl WHERE $final_con;";
          
          $stmt2 = $connect->prepare($sql2);

          $sql3 = "SELECT Name_Hotel, Preis, Sterne, Bewertung, Bild FROM tbl_bild, $final_tbl WHERE $final_con;";
          
          echo $sql3;
          
          $stmt3 = $connect->prepare($sql3);

          $stmt->execute();
          $stmt2->execute();
          $stmt3->execute();

        $result = $stmt->fetchAll();
        $result2 = $stmt2->fetchAll();
        $result3 = $stmt3->fetchAll();
        $x = array_values($result2)[0];
        $x = (int)$x;


        //Displaying the result as a table if result isnt empty
        if (empty($result)) {
          $errMsg = "No Results were found. Please check your input.";      
          echo $errMsg;   
        }else{
          for ($row = 0; $row < $x; $row++) {
            //echo "<p><b>Row number $row</b></p>";
            echo "<img src='".$result3[$row][4]."'>";
            echo "<ul>";
            for ($col = 0; $col < 4; $col++) {
              echo "<li>".$result3[$row][$col]."</li>";
            
            } echo "</ul>";
            //$hname = explode("&", $result3[$row][0]);

            //Getting the hotelname and saving it to the url for next query
            $hname = serialize($result3[$row][0]);
            echo "<form method='post' action='filter_detail.php?hName=$hname' name='adv_search'><input type='submit' name='hotelname' value='More Information'></form>";
          }
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