var app = angular.module('brewApp', ['ui.bootstrap']);

app.controller('ModalInstanceCtrl', function($scope, $modalInstance, description){
    $scope.description = description;
});

app.controller('YeastController', function($scope, $http, $timeout, $modal, $log) {

    $http.get('../yeast.json').success(function(data) {
        console.log(data.data[0].name);
        $scope.yeast = data.data;
    }).
    error(function(data) {
        console.log(data);
    });
    $scope.quantity = 5;
    $scope.open = function (yeast) {

        var modalInstance = $modal.open({
        controller:"ModalInstanceCtrl",
        templateUrl:'myModalContent.html',
        resolve: {
            description: function()
            {
                return yeast
            }
        }
        });
    };
});
app.controller('HopController', function($scope, $http) {

    $http({
        method: 'GET',
        url: '../hops.json'
    }).success(function(data) {
        console.log('work');
        $scope.hop = data.data;
    }).
    error(function(data) {
        console.log(data);
    });
    $scope.quantity = 5;
});
app.controller('FermentableController', function($scope, $http) {

    $http({
        method: 'GET',
        url: '../fermentable.json'
    }).success(function(data) {
        console.log('work');
        $scope.ferment = data.data;
    }).
    error(function(data) {
        console.log(data);
    });
    $scope.quantity = 5;
});