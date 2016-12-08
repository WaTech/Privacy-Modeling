// Code goes here
var myApp = angular.module('myApp',['angular-intro']);

myApp.controller('MyController', function MyController($scope, $timeout) {
    $scope.IntroOptions = {
        steps:[
            {
                element: document.querySelector('#step1'),
                intro: "<div></div>" +
                 '<strong>NEXT!</strong>',
                position: 'center'
            },
            {
                element: '#step2',
                intro: "Ok, <i>wasn't</i> that fun?",
                position: 'right'
            }

        ],
        showStepNumbers: false,
        exitOnOverlayClick: true,
        exitOnEsc:true,
        nextLabel: '<strong>NEXT!</strong>',
        prevLabel: '<span style="color:green">Previous</span>',
        skipLabel: 'Exit',
        doneLabel: 'Thanks'
    };

    $timeout(function() { $scope.CallMe();},0);


});