$( document ).on('turbolinks:load', function() {
    // if google analytics enabled
    if (typeof ga == 'function') {

        /**
         * Track user goes to User Guide from home page
         */
        $('.home-content .user-guide-button').on('touchstart click', function () {
            ga('send', {
                hitType: 'event',
                eventCategory: 'UserGuide',
                eventAction: 'open_user_guide_from_home',
                eventLabel: 'Open user guide from home page'
            });
        });

        /**
         * Track when user goes to User Guide from Results step
         */
        $('.step-4 .user-guide-button').on('touchstart click', function () {
            ga('send', {
                hitType: 'event',
                eventCategory: 'UserGuide',
                eventAction: 'open_user_guide_from_results',
                eventLabel: 'Open user guide from Results step'
            });
        });

        /**
         * Track user goes to User Guide from Legal disclaimer button
         */
        $('.home-content .legal-disclaimer').on('touchstart click', function () {
            ga('send', {
                hitType: 'event',
                eventCategory: 'UserGuide',
                eventAction: 'open_user_guide_from_legal_disclaimer_home',
                eventLabel: 'Open User Guide from Legal Disclaimer (home page)'
            });
        });

        /**
         * Track user goes to User Guide from home page
         */
        $('.home-content .start-over-button').on('touchstart click', function () {
            ga('send', {
                hitType: 'event',
                eventCategory: 'HomeButton',
                eventAction: 'open_get_started_home',
                eventLabel: 'Click Get Started on the home page'
            });
        });

        /**
         * Track clicks on Step 1 Tiles
         */
        $('#select_categories .category-checkbox').on('change', function () {
            if(this.checked) {
                var $this = $(this);
                var tile_title = $this.parent().find('div > p').text();

                ga('send', {
                    hitType: 'event',
                    eventCategory: 'SelectCategoryTiles',
                    eventAction: 'click_' + $.parameterize_string(tile_title) + '_on_select_category',
                    eventLabel: 'Clicked on ' + tile_title + ' tile on Select Category step'
                });
            }
        });


        /**
         * Track clicks on Step 2 tiles
         */
        $('#select_piis .pii-checkbox').on('change', function () {
            if(this.checked) {
                var $this = $(this);
                var tile_title = $this.parent().find('div > p').text();

                ga('send', {
                    hitType: 'event',
                    eventCategory: 'SelectPiisTiles',
                    eventAction: 'click_' + $.parameterize_string(tile_title) + '_on_piis',
                    eventLabel: 'Clicked on ' + tile_title + ' tile on PI Items step'
                });
            }
        });

        /**
         * Track clicks on Step 3 tiles
         */
        $('#select_use_items .use-item-checkbox').on('change', function () {
            if(this.checked) {
                var $this = $(this);
                var tile_title = $this.parent().find('div > p').text();

                ga('send', {
                    hitType: 'event',
                    eventCategory: 'SelectPiisTiles',
                    eventAction: 'click_' + $.parameterize_string(tile_title) + '_on_piis',
                    eventLabel: 'Clicked on ' + tile_title + ' tile on PI Items step'
                });
            }
        });

    }

});

/**
 * Make string parameter-like
 * I.e. "My Super String" => "my_super_string"
 * @param str
 * @returns {string}
 */
$.parameterize_string = function(str){
    return str.toLowerCase().replace(/[^a-z0-9]+/g,'_').replace(/(^-|-$)/g,'');
};