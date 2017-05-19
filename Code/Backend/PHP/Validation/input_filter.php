<?php
  require "config.php";
  session_start();
try {  
      if(isset($_POST["search"])) /*TODO:
      //Make sure that html slider defaults values to 0 or not specified (Advanced Filter)
      Adjust the multidimensional array, so that only hotels that match to a specific country get listed and not all of them*/

      //TODO: Sanitize user input, restrict to couple of characters, fix results and empty info
      //FIX Directory structure
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

          //Building the query 
          if (isset($landHotelOrt)) {
            $rowName[] = "Bild, Name_Hotel, Sterne, Bewertung";
            $tbl_name[] = "tbl_Hotel, tbl_ort, tbl_land, tbl_bild";
            $cond[] = "(Name_Hotel LIKE '%$landHotelOrt%' OR Name_Land LIKE '%$landHotelOrt%' OR Name_Ort LIKE '%$landHotelOrt%') AND PK_Ort = FK_Ort AND FK_Land = PK_Land AND PK_Hotel = FK_Hotel";

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

              if (isset($preis) && $preis > 0 ) {
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
                         
        $countSQL = "SELECT count(PK_Hotel) FROM tbl_land, tbl_ort, tbl_hotel WHERE pk_ort = fk_ort and pk_land = fk_land and (Name_Land LIKE '%$landHotelOrt%' OR Name_Ort LIKE '%$landHotelOrt%' OR Name_Hotel LIKE '%$landHotelOrt%');";
        $mainSQL = "SELECT $final_row FROM $final_tbl WHERE $final_con;";

        
        $stmt0 = $connect->prepare($countSQL);
        $stmt1 = $connect->prepare($mainSQL);

        $stmt0->execute();
        $stmt1->execute();



        $result0 = $stmt0->fetchAll();
        $result1 = $stmt1->fetchAll();

        $count = $result0[0][0];//How many results match?

        $realVal = count($result1);

        //echo "Query: " .$mainSQL;
        //echo "<br>";
        //echo "Anz Erg: " .count($result1);
        //var_dump($result1);

          //Displaying the result as a table if result isnt empty
          if ($realVal == 0){// | empty($result2) | empty($result3)
            $errMsg = "No Results were found. Please check your input.";      
            echo $errMsg;   
          }else{

            if ($count > 1) {
              $i = 1;
            }else{
              $i=0;
            }
          $row = 0;
          for ($i; $i <= $count; $i++) { 

            echo "<img src='".$result1[$row][0]."'>";
            echo "<ul>";
            for ($col = 1; $col <= 3; $col++) {
                echo "<li>".$result1[$row][$col]."</li>";
            }
            echo "</ul>";
            //Getting the hotelname and saving it to the url for next query
            $hname = serialize($result1[$row][1]);
            echo "<form method='post' action='filter_detail.php?hName=$hname' name='adv_search'><input type='submit' name='hotelname' value='More Information'></form>";           
          $row++;
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