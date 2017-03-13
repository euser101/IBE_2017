 <?php
require "config.php";
//Selecting Hotels/Places from the DB
$stmt = $connect->prepare("SELECT Name_Hotel, Name_Land FROM tbl_hotel, tbl_land, tbl_ort WHERE PK_Land = FK_Land AND PK_Ort = FK_Ort");
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

//TODO php printing out array multidimensional array as string without index
/*Muster
$age = array("Peter"=>"35", "Ben"=>"37", "Joe"=>"43");

foreach($age as $x => $x_value) {
    echo $x_value;
    echo "<br>";
}*/

//echo $data[1];
//var_dump(implode($data));
/*foreach( $data as $x => $x_value){
    echo $x_value;
    echo "<br>";
}*/
foreach($data as $key => $value) echo('$array['.$key.'] = '.$value);
/*
foreach ($data as $key => $val) {
   echo $val;
}*/
//print_r( array_values( $data ));
//echo print_r(array_values($data));
/*$data2 = var_dump($data);
echo $data2;*/

// Dynamically filled array with Hotelnames
      /*
$a[] = "Britannia"
;$a[] = "Schweiz";


// get the q parameter from URL
$q = $_REQUEST["q"];

$hint = "";

// lookup all hints from array if $q is different from ""
if ($q !== "") {
    $q = strtolower($q);
    $len=strlen($q);
    foreach($a as $name) {
        if (stristr($q, substr($name, 0, $len))) {
            if ($hint === "") {
                $hint = $name;
            } else {
                $hint .= ", $name";
            }
        }
    }
}

// Output "no suggestion" if no hint was found or output correct values
echo $hint === "" ? "no suggestion" : $hint;*/
?> 