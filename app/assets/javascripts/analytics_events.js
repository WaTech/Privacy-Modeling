$(function () {
    // if google analytics enabled
    if (typeof ga == 'function') {

        /**
         * Track user goes to User Guide from home page
         */
        $('.home-content .user-guide-button').on('touchstart click', function () {
            ga('send', {
                hitType: 'event',
                eventCategory: 'UserGuide',
                eventAction: 'open_user_guide_home',
                eventLabel: 'Open user guide from home page'
            });
        });


    }

});