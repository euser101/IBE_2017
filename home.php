<!doctype html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="../CSS/frontend_style.css">
 	 <script src="copyright_update.js"></script>

    <title>Home</title>

    <!--<link rel="import" href="navbar.html">-->


  </head>
  <body>
  	<?php include "../HTML/navbar.html"; ?>
<div id="main_image">
<div id="mask">
	<!--Eingabe Reiseziel-->
	<form action="#.php">
	Reiseziel<br>
	<input type="text" name="Reiseziel" value="Land, Hotelname">
	</form>
	
	<!--Preis angabe-->
	Preis<br>
	<input id="slider1" type="range" min="100" max="500" step="10" />
	
	<!--An- und Abreise-->
	<form action="#.php">
	Anreise<br>
	<input type="text" name="Anzeise" value="TT.MM.JJJJ">
	</form>
	<form action="#.php">
	Abreise<br>
	<input type="text" name="Abreise" value="TT.MM.JJJJ">
	</form>
	
	<!--Anzahl Zimmer-->
	<form action="#.php">
	Zimmer<br>
	<select name="zimmer">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9+">9+</option>
	</select>
	</form>
	<form action="#.php">
	
	<!--Anzahl Erwachsene-->
	Erwachsene<br>
	<select name="erwachsene">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
	</select>
	</form>
	
	<!--Anzahl Kinder-->
	<form action="#.php">
	Kinder(0-17)<br>
	<select name="zimmer">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
	</select>
	</form>
	
	<!--Knopf Suche-->
	<button type="button" id="search" name="search">Suchen</button>
</div>
</div>
	<!--Including the footer-->
	<?php include "../HTML/footer.html"; ?>
  </body>
</html>