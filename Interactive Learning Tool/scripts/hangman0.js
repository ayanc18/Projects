/* Author: Ayan Chandra
   For: elearnmarkets.com
   Subject: Basic game implementation in javascript.
   Test: test #4
   version: 0
*/

/*  Script starts here. */

/* Parsing a JSON file.*/
var myText=JSON.parse(glossary);

/* creating a random index.*/
var rand=Math.floor(Math.random()*myText.length);
document.getElementById("question").innerHTML=myText[rand].meaning;
var w =myText[rand].word;

//var spaceless= w.split();
var spaceCount=0;
var space=[];

/* Taking the single characters of the word in an array other than whitespace */
var ans=[];

var j=0;

//var w= spaceless[m];
for(var i=0;i < w.length;i++) {
		/*if(w.charAt(i) == ' '){
		spaceCount++;
		}else{ */
			ans[/*j*/i]=w.charAt(i);
			//j++;
		//}		
}

/*check 1   */
console.log(ans);
 
var lsnode = ans;
var finalLength=lsnode.length;
var node = new Array(finalLength);

var count = 0;

/* every letter in the word is symbolized by an underscore in the guessfield */

for (var i = 0; i < node.length; i++){
		if(ans[i] === " ") {
			node[i] = " ";
			}
		else {
		node[i] = "_ ";
		}
}

/*check 2*/
console.log(node);

/* prints the guessfield */


var printnode= function(){
	//    document.getElementById("writing").innerHTML=node;
	//var dashesHtml = "";
	for (var i = 0; i < node.length; i++){
		//var dashesHtml = dashesHtml + node[i]+"&nbsp;""
		var writing = document.getElementById("writing");
		if(node[i] != " "){
		var newtextw = document.createTextNode(node[i]);
		writing.appendChild(newtextw);
		}else{
			var newtextw = document.createTextNode('\u00A0\u00A0');
		writing.appendChild(newtextw);
		}
	} 
}

  var alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
        'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
        'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

/* prints the buttons dynamically */

var printbutton= function() {
    /* Create an input type dynamically. */
	for(var i=0; i < alphabet.length; i++){
		var guessbutton = document.getElementById("guessbutton");
		var newbutton = document.createElement("input"); 
			newbutton.type = "button";
			newbutton.value = alphabet[i];
			newbutton.name = alphabet[i] ;  
			newbutton.id=alphabet[i];
			newbutton.onclick =function (){
				automateGuess(this.value,this.id); 
			}	
		/* Append the element in page (in p).*/  
	guessbutton.appendChild(newbutton);
	}
}

/* reference to function to disable the id */
var disableButton=function(id){
	document.getElementById(id).disabled=true;
}



/* reference to function to change the color of the given id as per the input color  */
var changeColor= function(id,color){
	document.getElementById(id).style.background=color;
}

/*reference to functions to change the button from active to disabled state */
var changeCSS = function(id){
	disableButton(id);
	changeColor(id,"red");
}

var changeSuccessCSS = function(id){
	disableButton(id);
	changeColor(id,"lightgreen");
}

/* reference to function for showing alerts 
var showAlert= function(message, consoleM){
		bootbox.alert(message,function(){
		console.log(consoleM);
		});
}*
/

/* function to check if the letter x is in array or not */
function isInArray(temp, x){
	var flag1=false;
	for(var k=0;k<temp.length;k++){
		if(x===temp[k]){
			flag1=true;
		}
	}
	return flag1;
}

/* function to count the distinct letters in a word */
function countDistinct(array){
	var countD=0;
	var temp = [];
	for(var i=0;i<array.length;i++){
		if(isInArray(temp,array[i])!=true){
		  temp.push(array[i]);
		  countD++;
		}
	}
	return countD;
}

/* reference to function to initialize the progress bar */
var iniProgress= function(percent){
		$('.progress-bar').css('width', percent+'%');
}

/* function to vary the progress bar */
var showProgress= function(count,length){
	var res= Math.floor((1 - (count/length))*100);
	iniProgress(res);
}

/*showing the true answer  */
var showAnswer=function(){
	for (var i = 0; i < node.length; i++){
			node[i] = "_  ";
		}
			for (var i = 0; i < node.length-1; i++){
				var writing = document.getElementById("writing");
				writing.innerHTML=w; 
		}
}

/*checks if the the letter provided by the user matches one or more of the letters in the word */
var automateGuess= function(value,id){ 
	var character = value; // the letter provided by the user
	character = character.toUpperCase();
	for (var i = 0; i < finalLength; i++){
		if(lsnode[i] === character){
			node[i] = character + " ";
			var hit = true;
			changeSuccessCSS(id);
		}
	}
	if(hit!=true){
			changeCSS(id);
		}
	
	/*deletes the guessfield and replaces it with the new one */

	var writing = document.getElementById("writing");
	writing.innerHTML=""; 
	printnode();
	
	/* if a guessed letter is not in the word, the letter will be put on the "wrong letters"-list and hangman grows by changing the image source file by appending the 0,1,.. index in the name of the file*/
	
	if(!hit){
		//var wrongLetters = document.getElementById("wrongLetters");
		//var newtextw = document.createTextNode(" " + character);
		//wrongLetters.appendChild(newtextw); 
		count++;
		var l=countDistinct(ans);
		showProgress(count,6/*l*/);    
	}
	
	/*check if all letters are found */
	var flag = true;
	for (var i = 0; i < node.length; i++){
		if(node[i] === "_ "){
			flag = false;
		}
	}
/* check 3*/
console.log(flag);

	/* if all letters are found then throw pop-up and reload */
	if(flag){
		//alert("You won!");
		//showAlert("you won","win");
		var str="Congrats! Got back your Life.";
		strres=str.fontsize(5);
		document.getElementById("wrongLetters").innerHTML=strres;
		//document.getElementById("wrongLetters").innerHTML="You Won!";
		//document.getElementById("wrongLetters").style.font-size= '2.0em';
		showAnswer();
		iniProgress(100);
		disableButton("guessbutton");
		changeColor("newgame","lightgreen");
	}
	
	/* if you get all six wrong attempts, you lose */
	if(count === 6/*l*/){
		var str="Game Over!";
		strres=str.fontsize(5);
		document.getElementById("wrongLetters").innerHTML=strres;
		showAnswer();
		disableButton("guessbutton");
		changeColor("newgame","red");
	}
}
	

/* initialization to be done on-load */
var init = function(){
	printnode();
	printbutton();
	iniProgress(100);
}

window.onload = init;

/* script ends here. */