function homePage() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code

    if (cookies.indexOf("name=homepage") + 1) {
        console.log('cookie-home'); //TODO delete this code
        console.log(cookies);       //TODO delete this code

    } else {
        var introguide = introJs();
        introguide.setOptions({
            skipLabel: 'Skip this tutorial',
            nextLabel: 'Next',
            showStepNumbers: false,
            exitOnOverlayClick: false, // not allow skip tooltip when overlay click

            steps: [
                {
                    intro: '<h1>Welcome To The Privacy Modeling Tutorial</h1>' +
                    '<p>text</p>',
                    tooltipClass: 'first-home-tooltips'
                },
                {
                    intro: '<h1>Privacy Modeling Tutorial</h1>' +
                    '<p>text 2</p>',
                    tooltipClass: 'home-tooltips'
                },
                {
                    element: '#step3',
                    intro: 'Hover over each title to display a longer description.',
                    position: 'right',
                    tooltipClass: 'home-tooltips'
                },
                {
                    element: '#step4',
                    intro: 'Click this orange button to view the tutorial article in a new tab.',
                    position: 'right',
                    tooltipClass: 'home-tooltips'
                },
                {
                    element: '#step5',
                    intro: 'Click this orange button to view the tutorial article in a new tab.',
                    position: 'left',
                    tooltipClass: 'home-tooltips'
                }
            ]
        });
        setTimeout(function () {
            introguide.start();


            document.cookie = " name=homepage;";
            cookies = document.cookie;
            console.log(cookies); // TODO delete this code
        }, 0);



    }
}


/** Step One  */
function stepOne() {
    var cookies = document.cookie;

    if (cookies.indexOf("stepname=first_step") + 1) {
        console.log('cookie-first');  // TODO delete this code
        console.log(cookies);         // TODO delete this code

    } else {

        var introguide = introJs();
        introguide.setOptions({
            skipLabel: 'Skip this tutorial',
            nextLabel: 'Next',
            showStepNumbers: false,
            exitOnOverlayClick: false,

            steps: [
                {
                    element: document.querySelector('.container-categories'),
                    intro: 'Click this main logo to view a list of all Hongkiat demos.',
                    position: 'top'
                },

                {
                    element: '.submit-button',
                    intro: 'Click this orange button to view the tutorial article in a new tab.',
                    position: 'top'
                }
            ]
        });
        // setTimeout(function () {
        introguide.start();

        document.cookie = " stepname=first_step;";
        cookies = document.cookie;

        console.log(cookies); // TODO delete this code

        // }, 100);

    }

}

/** Step Two*/
function stepTwo() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code

    if (cookies.indexOf("steptwo=two_step;") + 1) {
        console.log('cookie-two'); // TODO delete this code
        console.log(cookies);      // TODO delete this code

    } else {

        var introguide = introJs();
        introguide.setOptions({
            skipLabel: 'Skip this tutorial',
            nextLabel: 'Next',
            showStepNumbers: false,
            exitOnOverlayClick: false,

            steps: [
                {
                    intro: 'step 2',
                    position: 'top'
                },
                {
                    element: '.container-categories',
                    intro: 'Click this main logo to view a list of all Hongkiat demos.',
                    position: 'top'
                },
                {
                    element: '.margin-left-6',
                    intro: 'Click this main logo to view a list of all Hongkiat demos.',
                    position: 'top'
                }
            ]
        });
        setTimeout(function () {
            introguide.start();

            document.cookie = " steptwo=two_step;";
            cookies = document.cookie;

            console.log(cookies); // TODO delete this code
        }, 100);


    }

}


/** Step Three*/
function stepThree() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code

    if (cookies.indexOf("stepthree=three_step;") + 1) {
        console.log('cookie-three'); //TODO delete this code

    } else {

        var introguide = introJs();
        introguide.setOptions({
            skipLabel: 'Skip this tutorial',
            nextLabel: 'Next',
            showStepNumbers: false,

            steps: [
                {
                    intro: 'Hover over each title to display a longer description.',
                    position: 'top'
                },
                {
                    element: '.container-categories',
                    intro: 'Click this main logo to view a list of all Hongkiat demos.',
                    position: 'top'
                }
            ]
        });
        setTimeout(function () {
            introguide.start();
        }, 100);


        document.cookie = " stepthree=three_step;";
        cookies = document.cookie;

        console.log(cookies);  // TODO delete this code

    }

}

/** Result Page*/
function resultPage() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code

    if (cookies.indexOf("resultpage=result_page;") + 1) {
        console.log('cookie-result-page');  //TODO delete this code

    } else {

        var introguide = introJs();
        introguide.setOptions({
            skipLabel: 'Skip this tutorial',
            nextLabel: 'Next',
            showStepNumbers: false,

            steps: [
                {
                    intro: '<div class="bg-img">' +
                    '<div class="tooltip-img"></div>' +
                    '</div>',
                    position: 'top'
                },
                {
                    element: document.querySelector('.container-categories'),
                    intro: 'Click this main logo to view a list of all Hongkiat demos.',
                    position: 'top'
                }
            ]
        });
        setTimeout(function () {
            introguide.start();

            document.cookie = " resultpage=result_page;";
            cookies = document.cookie;

            console.log(cookies);  // TODO delete this code
        }, 100);

    }

}

/** User Guide */
function userGuide() {

    var cookies = document.cookie;

    if (cookies.indexOf("userguide=user_guide") + 1) {
        console.log('user-guide'); // TODO delete this code

    } else {

        var introguide = introJs();
        introguide.setOptions({
            skipLabel: 'Skip this tutorial',
            nextLabel: 'Next',
            showStepNumbers: false,

            steps: [
                {
                    intro: 'Hover over each title to display a longer description.',
                    position: 'top'
                },
                {
                    element: document.querySelector('.container-categories'),
                    intro: 'Click this main logo to view a list of all Hongkiat demos.',
                    position: 'top'
                },

                {
                    element: '.submit-button',
                    intro: 'Click this orange button to view the tutorial article in a new tab.',
                    position: 'top'
                }
            ]
        });
        // setTimeout(function () {
        introguide.start();


        document.cookie = " userguide=user_guide";
        cookies = document.cookie;

        console.log(cookies);  // TODO delete this code
        // }, 100);

    }

}



