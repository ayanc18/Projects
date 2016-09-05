var app=angular.module('TestApp', []);
app.controller('TestCtrl',  ['$scope','$http','$timeout', function($scope,$http,$timeout){
		$scope.showTemplate=1;
		$scope.changeTemplate= function(){
			$scope.showTemplate=2;
		};
		
		$scope.hitIconBike= function(){
			$timeout($scope.changeTemplate,4000);
		};
		$scope.hitIconCar= function(){
			$timeout($scope.changeTemplate,4000);
		};			
	}]);