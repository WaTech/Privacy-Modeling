// // Code goes here
// var myApp = angular.module('myApp',['angular-intro']);
//
// myApp.controller('MyController', function MyController($scope, $timeout) {
//     $scope.IntroOptions = {
//         steps:[
//             {
//                 element: document.querySelector('#step1'),
//                 intro: "<div></div>" +
//                  '<strong>NEXT!</strong>',
//                 position: 'center'
//             },
//             {
//                 element: '#step2',
//                 intro: "Ok, <i>wasn't</i> that fun?",
//                 position: 'right'
//             }
//
//         ],
//         showStepNumbers: false,
//         exitOnOverlayClick: true,
//         exitOnEsc:true,
//         nextLabel: '<strong>NEXT!</strong>',
//         prevLabel: '<span style="color:green">Previous</span>',
//         skipLabel: 'Exit',
//         doneLabel: 'Thanks'
//     };
//
//     $timeout(function() { $scope.CallMe();},0);
//
//
// });

//
// var app = angular.module('myApp', ['angular-intro']);
//
// app.controller('MyController', function ($scope) {
//
//     // $scope.CompletedEvent = function (scope) {
//     //     console.log("Completed Event called");
//     // };
//     //
//     // $scope.ExitEvent = function (scope) {
//     //     console.log("Exit Event called");
//     // };
//     //
//     // $scope.ChangeEvent = function (targetElement, scope) {
//     //     console.log("Change Event called");
//     //     console.log(targetElement);  //The target element
//     //     console.log(this);  //The IntroJS object
//     // };
//     //
//     // $scope.BeforeChangeEvent = function (targetElement, scope) {
//     //     console.log("Before Change Event called");
//     //     console.log(targetElement);
//     // };
//     //
//     // $scope.AfterChangeEvent = function (targetElement, scope) {
//     //     console.log("After Change Event called");
//     //     console.log(targetElement);
//     // };
//
//     $scope.IntroOptions = {
//         steps:[
//             {
//                 element: document.querySelector('#step1'),
//                 intro: "This is the first tooltip."
//             },
//             {
//                 element: document.querySelectorAll('#step2')[0],
//                 intro: "<strong>You</strong> can also <em>include</em> HTML",
//                 position: 'right'
//             },
//             {
//                 element: '#step1',
//                 intro: 'More features, more fun.',
//                 position: 'left'
//             },
//             {
//                 element: '#step2',
//                 intro: "Another step.",
//                 position: 'bottom'
//             },
//             {
//                 element: '#step5',
//                 intro: 'Get it, use it.'
//             }
//         ],
//         showStepNumbers: false,
//         exitOnOverlayClick: true,
//         exitOnEsc:true,
//         nextLabel: '<strong>NEXT!</strong>',
//         prevLabel: '<span style="color:green">Previous</span>',
//         skipLabel: 'Exit',
//         doneLabel: 'Thanks'
//     };
//
//     $scope.ShouldAutoStart = true;
//
//     // $timeout(function() { $scope.CallMe();},0);
//
// });

$( window ).on('load',function() {
    $(function(){
        var introguide = introJs();
        // var startbtn   = $('#startdemotour');

        introguide.setOptions({
            steps: [
                {
                    element: '#step1',
                    intro: 'This guided tour will explain the Hongkiat demo page interface.<br><br>Use the arrow keys for navigation or hit ESC to exit the tour immediately.',
                    position: 'bottom'
                },
                {
                    element: '.nav-logo',
                    intro: 'Click this main logo to view a list of all Hongkiat demos.',
                    position: 'bottom'
                },
                {
                    element: '.nav-title',
                    intro: 'Hover over each title to display a longer description.',
                    position: 'bottom'
                },
                {
                    element: '.readtutorial a',
                    intro: 'Click this orange button to view the tutorial article in a new tab.',
                    position: 'right'
                },
                {
                    element: '.nav-menu',
                    intro: "Each demo will link to the previous & next entries.",
                    position: 'bottom'
                }
            ]
        });
        setTimeout(function() { introguide.start(); }, 0);
    });


});
