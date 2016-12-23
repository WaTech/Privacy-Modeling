function homePage() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code

    // if (cookies.indexOf("name=homepage") + 1) {
    //     console.log('cookie-home'); //TODO delete this code
    //     console.log(cookies);       //TODO delete this code
    //
    // } else {
    var introguide = introJs();
    introguide.setOptions({
        skipLabel: 'Skip this tutorial',
        nextLabel: 'Next',
        showStepNumbers: false,
        exitOnOverlayClick: false, // not allow skip tooltip when overlay click

        steps: [
            {
                intro: '<h1>Welcome To The Privacy Modeling Tutorial</h1>' +
                '<p>We intend Privacy Modeling as your starting point for research. This app draws on a limited database of laws. Results refer only to privacy law, not other possible laws, regulations or policy. Please consult the User Guide as a critical step in your design process.</p>',
                tooltipClass: 'first-home-tooltip'
            },
            {
                intro: '<h1>Privacy Modeling Tutorial</h1>' +
                '<p>We want to make sure you know the capabilities and limits of this tool, so let’s get started …</p>',
                tooltipClass: 'home-tooltips step-tooltip'
            },
            {
                element: '#step3',
                intro: '<div class="bg-icon bg-icon-left"></div>' +
                '<p>Here’s the legal stuff (our lawyer says this is important)</p>',
                position: 'right',
                tooltipClass: 'home-tooltips step-legal step-tooltip'
            },
            {
                element: '#step4',
                intro: '<div class="bg-icon bg-icon-left"></div>' +
                '<p>Consult the user guide at any time for tips on privacy design.</p>',
                position: 'right',
                tooltipClass: 'home-tooltips step-guide step-tooltip'
            },
            {
                element: '#step5',
                intro: '<div class="bg-icon bg-icon-right"></div>' +
                '<p>Click to launch the app</p>',
                position: 'left',
                tooltipClass: 'home-tooltips step-get-started step-tooltip last-step'
            }
        ]
    });
    setTimeout(function () {
        introguide.start().onchange(function () {
            if (introguide._currentStep == "3") {
                $('body').attr('id', 'home-page');
                $('.introjs-nextbutton').text('Got it!');
            }
        });


        document.cookie = " name=homepage;";
        cookies = document.cookie;
        console.log(cookies); // TODO delete this code
    }, 0);


    // }
}


/** Step One  */
function stepOne() {
    var cookies = document.cookie;

    // if (cookies.indexOf("stepname=first_step") + 1) {
    //     console.log('cookie-first');  // TODO delete this code
    //     console.log(cookies);         // TODO delete this code
    //
    // } else {

    var introguide = introJs();
    introguide.setOptions({
        skipLabel: 'Skip this tutorial',
        nextLabel: 'Got it!',
        showStepNumbers: false,
        exitOnOverlayClick: false,

        steps: [
            {
                element: document.querySelector('.container-categories'),
                intro: '<h1>What does your organization do? </h1>' +
                '<p>Select from these 12 categories (you can click more than one).</p>' +
                '<p>Select “General” if none applies to you.</p>',
                position: 'top',
                tooltipClass: 'step-one-tooltip1 step-tooltip'
            },

            {
                element: '.submit-button',
                intro: '<div class="bg-icon bg-icon-down"></div>' +
                '<p>Now, click continue …</p>',
                position: 'top',
                tooltipClass: 'step-one-tooltip2 step-tooltip last-step'
            }
        ]
    });
    setTimeout(function () {
        introguide.start();

        document.cookie = " stepname=first_step;";
        cookies = document.cookie;

        console.log(cookies); // TODO delete this code

    }, 100);

    // }

}

/** Step Two*/
function stepTwo() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code

    // if (cookies.indexOf("steptwo=two_step;") + 1) {
    //     console.log('cookie-two'); // TODO delete this code
    //     console.log(cookies);      // TODO delete this code
    //
    // } else {

    var introguide = introJs();
    introguide.setOptions({
        skipLabel: 'Skip this tutorial',
        nextLabel: 'Got it!',
        showStepNumbers: false,
        exitOnOverlayClick: false,

        steps: [
            {
                element: '.container-categories',
                intro: '<h1>You can select 31 different types of user data</h1>' +
                '<p>Go ahead and select a few categories for a trial run … then click \'continue\' at the bottom.</p>' +
                '<p>(make sure you scroll down)</p>',
                position: 'top',
                tooltipClass: 'step-one-tooltip1 step-tooltip step-two-tooltip1'
            },
            {
                element: '.submit-button',
                intro: '<div class="bg-icon bg-icon-down"></div>' +
                '<p>Now, click continue...<br>(you must select at least one category)</p>',
                position: 'top',
                tooltipClass: 'step-one-tooltip2 step-tooltip last-step'
            }
        ]
    });
    setTimeout(function () {
        introguide.start();

        document.cookie = " steptwo=two_step;";
        cookies = document.cookie;

        console.log(cookies); // TODO delete this code
    }, 100);


    // }

}


/** Step Three*/
function stepThree() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code
    //
    // if (cookies.indexOf("stepthree=three_step;") + 1) {
    //     console.log('cookie-three'); //TODO delete this code
    //
    // } else {

    var introguide = introJs();
    introguide.setOptions({
        skipLabel: 'Skip this tutorial',
        nextLabel: 'Next',
        showStepNumbers: false,

        steps: [
            {
                element: '.container-categories',
                intro: '<h1>Now indicate how you intend to use the data in your product or service.</h1>' +
                '<p>You can click on more than one.</p>',
                position: 'top',
                tooltipClass: 'step-tooltip step-three step-three-hint1'
            },
            {
                element: '.protect-information',
                intro: '<div class="bg-icon bg-icon-left"></div>' +
                '<p>This use means your goal is to shield information from disclosure.</p>',
                position: 'top',
                tooltipClass: 'step-tooltip step-three'
            },
            {
                element: '.share',
                intro: '<div class="bg-icon bg-icon-left"></div>' +
                '<p>Do you intend to share the data with a third party?</p>',
                position: 'top',
                tooltipClass: 'step-tooltip step-three'
            },
            {
                element: '.submit-button',
                intro: '<div class="bg-icon bg-icon-down"></div>' +
                '<p>Now, click continue... <br>(you must select at least one use)</p>',
                position: 'top',
                tooltipClass: 'step-tooltip step-three last-step step-three-hintlast'
            }
        ]
    });
    setTimeout(function () {
        introguide.start().onchange(function () {
            if (introguide._currentStep == "1") {
                $('.introjs-nextbutton').text('Okay');
            }

            if (introguide._currentStep == "2") {
                $('.introjs-nextbutton').text('Got it!');
            }

        });
    }, 100);


    document.cookie = " stepthree=three_step;";
    cookies = document.cookie;

    console.log(cookies);  // TODO delete this code

    // }

}

/** Result Page*/
function resultPage() {
    var cookies = document.cookie;
    console.log(cookies); //TODO delete this code
    //
    // if (cookies.indexOf("resultpage=result_page;") + 1) {
    //     console.log('cookie-result-page');  //TODO delete this code
    //
    // } else {

    var introguide = introJs();
    introguide.setOptions({
        skipLabel: 'Skip this tutorial',
        doneLabel: 'Next',
        showStepNumbers: false,
        showBullets: false,

        steps: [
            {
                intro: '<h1>The Result Matrix produces one, two or three levels <br> depending on your search.</h1>' +
                '<ul class="hint-result">' +
                '<li>' +
                '<h2 class="green">Green</h2>' +
                '<p>Your search did not find a specific privacy law directly on point.</p>' +
                '<div class="bg-img bg-img-allowed"></div>' +
                '</li>' +
                '<li>' +
                '<h2 class="yellow">Yellow</h2>' +
                '<p>Legal restrictions may apply.<br> Click on the “i” see applicable laws.</p>' +
                '<div class="bg-img bg-img-limit"></div>' +
                '</li>' +
                '<li>' +
                '<h2 class="red">Red</h2>' +
                '<p>A potential legal prohibition.<br> Click on the “i” see applicable laws.</p>' +
                '<div class="bg-img bg-img-forbid">' +
                '<div class="bg-tooltip"></div>' +
                '</div>' +
                '</li>' +
                '</ul>' +
                '<p>Next, consult the User Guide for suggestions on<br> product design.</p>',
                position: 'top',
                tooltipClass: 'result-step'
            }
        ]
    });
    setTimeout(function () {
        introguide.start();

        document.cookie = " resultpage=result_page;";
        cookies = document.cookie;

        console.log(cookies);  // TODO delete this code
    }, 100);

    // }

}

/** User Guide */
function userGuide() {

    var cookies = document.cookie;

    // if (cookies.indexOf("userguide=user_guide") + 1) {
    //     console.log('user-guide'); // TODO delete this code
    //
    // } else {

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
            },

            {
                element: '.submit-button',
                intro: 'Click this orange button to view the tutorial article in a new tab.',
                position: 'top'
            },

            {
                element: '.submit-button',
                intro: 'Click this orange button to view the tutorial article in a new tab.',
                position: 'top'
            }
        ]
    });
    setTimeout(function () {
        introguide.start().onchange(function () {
            if (introguide._currentStep == "1") {
                $('.introjs-nextbutton').text('Okay');
            }

            if (introguide._currentStep == "2") {
                $('.introjs-nextbutton').text('Got it!');
            }

        });


        document.cookie = " userguide=user_guide";
        cookies = document.cookie;

        console.log(cookies);  // TODO delete this code
    }, 100);

    // }

}



