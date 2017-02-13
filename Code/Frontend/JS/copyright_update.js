
//Updating the website footer
function refreshCopyright() {
	var year = document.write(new Date().getFullYear());
	document.getElementById("footer").innerHTML = year;
}

