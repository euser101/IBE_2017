<!doctype html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="stylesheet.css" rel="stylesheet">
 	 <script src="copyright_update.js"></script>
	
    <title>Home</title>

    <!--<link rel="import" href="navbar.html">-->


  </head>
  <body id="start">
  
	<ul class="topnav" id="myTopnav">
			<li><a href="#home">Home</a></li>
			<li><a href="#Top">Top 10</a></li>
			<li><a href="#AGB">AGB</a></li>
			<li><a href="#hilfe">Hilfe</a></li>
			<li><a href="#konto">Konto</a></li>
			<li class="icon">
			<a href="javascript:void(0);" onclick="myFunction()">&#9776;</a>
			</li>
		</ul>
	<script>
	/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
	function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
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
/* When the screen is less than 680 pixels wide, hide all list items, except for the first one ("Home"). Show the list item that contains the link to open and close the topnav (li.icon) */
@media screen and (max-width:680px) {
  ul.topnav li:not(:first-child) {display: none;}
  ul.topnav li.icon {
    float: right;
    display: inline-block;
  }
}
/* The "responsive" class is added to the topnav with JavaScript when the user clicks on the icon. This class makes the topnav look good on small screens */
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
	</style>
  
  
  
  	
<div id="main_image">
<div id="mask">
	<!--Eingabe Reiseziel-->
<form method="post" class="AuswahlFelder" action="input_filter.php">
	Reiseziel<br>
	<input type="text" name="reise_z" placeholder="Land, Hotelname">
	
	
	<!--Preis angabe-->
	
	Preis<br>
	<input name="range_p" id="RangePreis" type="range" min="0" max="500" step="10" />
	
	<!--An- und Abreise-->
	
	<label for="gebdat">
    Anreise<br> 
    <input type="date" id="gebdat" name="anreise">
	</label><br>
	
	
	
	<label for="gebdat">
    Abreise<br> 
    <input type="date" id="gebdat" name="abreise">
	</label>
	
	
	
	
	<!--Anzahl Zimmer-->
	
	Zimmer<br>
	<select name="zimmer">
		<option value="0">Not specified</option>
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

	
	<!--Anzahl Erwachsene-->
	Erwachsene<br>
	<select name="erwachsene">
		<option value="0">Not specified</option>
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

	
	<!--Anzahl Kinder-->

	Kinder(0-17)<br>
	<select name="kinder">
		<option value="0">Not specified</option>
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

	
	<!--Knopf Suche-->
	<button class="buttonSuche" name="search" style="vertical-align:middle"><span>Suche </span></button>
	
</div>
</div>
</form>
<div id="Vorschlaege">
	<div class="Vorschlaege">
		<img class="bild_vorschlag" src="Hotels/Frankreich/2 Villa Marie Saint Tropez/Hotel2_Bild3_fr.jpg" alt="home"/>
		<h2>Villa Marie Saint Tropez</h2>
		<p>5 Sterne</p>
		<p>4.5/5</p>
		<P>ab CHF180</p>
	</div>
	<div class="Vorschlaege">
		<img class="bild_vorschlag" src="Hotels/Schweiz/1 Baur au Lac/Hotel1_Bild4_ch.jpg" alt="home"/>
		<h2>Baur au Lac</h2>
		<p>5 Sterne</p>
		<p>5/5</p>
		<P>ab CHF180</p>
	</div>
	<div class="Vorschlaege">
		<img class="bild_vorschlag" src="Hotels/Spanien/3 Gran Vía Capital/Hotel3_Bild2_es.jpg" alt="home"/>
		<h2>Gran Vía Capital</h2>
		<p>4 Sterne</p>
		<p>4.6/5</p>
		<P>ab CHF180</p>
	</div>
</div>
	<!--Including the footer-->

  </body>
</html>