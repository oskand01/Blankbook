/**
 * 
 */

"use strict";


document.getElementById("btn").addEventListener("click", ()=> {
	document.getElementById("msg-form").style.display ="block";
	document.getElementById("btn").style.display = "none";
	document.body.scrollTop = 0; // For Safari
  	document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
})


document.getElementById("btn-close").addEventListener("click", ()=> {
	document.getElementById("message").value = "";
	document.getElementById("msg-form").style.display ="none";
	document.getElementById("btn").style.display = "block";
	
})

function setBtnValue() {

	if(document.getElementById("style").getAttribute("href") == "/Blankbook/css/style.css") {
		document.getElementById("theme").value = "DARK MODE"
} else if(document.getElementById("style").getAttribute("href") == "/Blankbook/css/dark-style.css") {
	document.getElementById("theme").value = "LIGHT MODE"
}
}

setBtnValue();