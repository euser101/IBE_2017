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
            $cond[] = "Name_Land REGEXP '$landHotelOrt|$landHotelOrt' OR Name_Ort REGEXP '$landHotelOrt|$landHotelOrt' OR Name_Hotel REGEXP '$landHotelOrt|$landHotelOrt'";         
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
          $sql = "SELECT $final_row FROM $final_tbl WHERE $final_con;";
        
          $stmt = $connect->prepare($sql);
          $stmt->execute();

        $result = $stmt->fetchAll();
        

        //Displaying the result as a table if result isnt empty
        
        if (empty($result)) {
          $errMsg = "No Results were found. Please check your input.";      
          echo $errMsg;   
        }else{
          for ($row = 0; $row < 4; $row++) {
            echo "<p><b>Row number $row</b></p>";
            echo "<ul>";
            for ($col = 0; $col < 3; $col++) {
              echo "<li>".$result[$row][$col]."</li>";
            }
            echo "</ul>";
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