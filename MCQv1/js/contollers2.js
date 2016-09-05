/* For: elearnmarkets.com
   Subject: MCQ Quiz in javascript.
   Test: test #3
   Author: Ayan Chandra
   version: 0
*/

/* scripts starts here */

angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})


.controller('QuizCtrl', function($scope/*,$http,$stateParams*/) {
		/*$scope.glossary_id=$stateParams.id;
		$scope.NumberOfQuestions=10;
		$scope.totalNoOfQuestions=$scope.NumberOfQuestions;
		var url="http://www.elearnmarkets.com/glossary_words/get_random_words/"+$scope.totalNoOfQuestions+'/'+$scope.glossary_id;
		//$scope.game_url="/ILT4/#/app/guesstheword/"+$scope.glossary_id;
		//var url="http://www.elearnmarkets.com/glossary_words/get_words/"+$scope.glossary_id;
		*/
	$scope.questions=JSON.parse(glossary);
	var length = $scope.questions.length;
	console.log(length);
	
	/*rand for choosing the random index */
	$scope.rand= Math.floor( Math.random() * length);
	var q = $scope.questions[$scope.rand];

	
	$scope.question=$scope.questions[$scope.rand].statement;

	/* Global variables to be considered
	this is okey to go
	*/
	$scope.totalNoOfQuestions=10;
	$scope.noOfQuestionsAttempted=0;
	$scope.isQuestionInProgress=true;
	$scope.score=0;
	$scope.isAnswerFound= false;
	$scope.isGameOver=false;
	$scope.isGameOpen=false;
	
	$scope.enterGame= function(){
		$scope.isGameOpen=true;
	}
	
	/* Available options to be displayed*/
	$scope.availableOptions=[];
	
	/*to make arrangement 
	for 
	the 
	availableOptions 
	array
	
	
	*/
	
	//$scope.trackAnswerObjectArray=[];
	$scope.trackAnswerObject= null;
	
	$scope.loadQuestion= function(){
		$scope.noOfQuestionsAttempted=$scope.noOfQuestionsAttempted+1;
		//$scope.trackAnswerObjectArray.push($scope.trackAnswerObject);
		//need to make this effective using the attempt
		
		console.log($scope.trackAnswerObjectArray);
		if($scope.noOfQuestionsAttempted===$scope.totalNoOfQuestions){
				$scope.endGame();
				return;
			}
		
		$scope.showStatement=true;
		$scope.isQuestionInProgress=true;
		$scope.availableOptions=[];
		
		var N=$scope.questions.length;
		$scope.rand= ($scope.rand+4)%N;
		var newindex=$scope.rand;
		$scope.question=$scope.questions[newindex].meaning;
		
		/*to make arrangement 
			for 
			the 
			availableOptions 
			array
	
	
		*/
	};

	//need to modify
	$scope.optionAttempted= function(optionObject){
	    $scope.isQuestionInProgress = false;
	    for (var i = 0; i < $scope.availableOptions.length; i++){
	        $scope.availableOptions[i].isAttempted = false;
			}
		optionObject.isAttempted=true;
		$scope.trackAnswerObject=optionObject;
		if(optionObject.isCorrect===true){
			$scope.isAnswerFound=true;
		}	
	};
	
	//need to modify the calculateScore
	$scope.calculateScore = function(){
		for(var i=0;i<$scope.trackAnswerObjectArray.length;i++){
			if($scope.trackAnswerObjectArray[i].isCorrect===true){
				$scope.score=$scope.score + 1;
			}
		}
	};
	
	//this does not need modification.
	$scope.endGame= function(){
		$scope.isGameOver=true;
		$scope.calculateScore();
	};
	console.log('McqCtrl');
	
});

/* script ends here  */