$(function () {

    var $container = $('.list'),
        $checkboxes = $('#filter input'),
        filters,
        $limit = $('.limitations'),
        $forbidden = $('.forbidden');

    $checkboxes.change(function () {

        var value = $(this).val();

        if ($(this).is(":checked")) {

            var block = [$limit, $forbidden];

            $.each( block, function( i, block ) {
                if (( $limit.children(':hidden') ) || ($forbidden.children(':hidden')) ){
                    block.show();
                }
            });

            if (value == '.federal') {
                filters = $container.find('.federal').show().css('transform', 'none');
            }
            if (value == '.state') {
                filters = $container.find('.state').show().css('transform', 'none');
            }


        }

        if ($(this).is(":not(:checked)")) {
            if (value == '.federal') {

                $('.federal', $container).each(function () {
                    if (!$(this).hasClass('state')) {
                        filters = $(this).hide();
                    }
                });


            } else if (value == '.state') {

                $('.state', $container).each(function () {
                    if (!$(this).hasClass('federal')) {
                        filters = $(this).hide();
                    }
                });


            }


            if ($limit.find('.list').children('.state:visible').length === 0 && $limit.find('.list').children('.federal:visible').length === 0) {
                $limit.hide();
            }
            if ($forbidden.find('.list').children('.state:visible').length === 0 && $forbidden.find('.list').children('.federal:visible').length === 0) {
                $forbidden.hide();
            }


        }


        $checkboxes.change(function () {
            if ($('#federal').is(":not(:checked)") && $('#washington').is(":not(:checked)")) {

                $('.state', $container).each(function () {
                    filters = $(this).hide();
                });
            }


            if ($forbidden.find('.list').children('.state:visible').length === 0 && $forbidden.find('.list').children('.federal:visible').length === 0) {
                $forbidden.hide();
            }
            if ($limit.find('.list').children('.state:visible').length === 0 && $limit.find('.list').children('.federal:visible').length === 0) {
                $limit.hide();
            }
        });

        $container.isotope({
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            },

            masonry: {
                gutter: 20,
                columnWidth: 218
            },
            itemSelector: '.block'
        });


        if ($(this).is(":checked")) {

            if (value == '.federal') {
                $container.find('.federal').css('transform', 'none');
            }
            if (value == '.state') {
                $container.find('.state').css('transform', 'none');
            }
        }
    });


});