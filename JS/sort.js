
var sortPrice = document.getElementsByClassName('price');

//Save values in array
var values = [];
for (var i = 0; i < sortPrice.length; i++) {
    values.push(sortPrice[i].value);
}

document.write(values);

function srtPrice(){
	alert($sortPrice);
	$sortPrice.sort();
}

function srtReview(){

}

function srtName(){
	$sortPrice.reverse();
}