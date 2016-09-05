/* Author: Ayan Chandra
   For: elearnmarkets.com
   Subject: Disable copy in javascript.
   Test: test #1
   version: 0
*/

/* scripts starts here */

/* clearing the clipboard */

function clearData(){
			window.clipboardData.setData('text','') 
		}
		function cldata(){
			if(clipboardData){
				clipboardData.clearData();
			}
		}
setInterval("cldata();", 1000);

/*  script ends here. */