$(function () {

    var $container = $('.list'),
        $checkboxes = $('#filter input');


    $checkboxes.change(function () {
        var filters,
            $limit = $('.limitations'),
            $forbidden = $('.forbidden');
        var value = $(this).val();

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

        else if ($(this).is(":checked")) {
            if (value == '.federal') {
                filters = $container.find('.federal').show();
            } else if (value == '.state') {
                filters = $container.find('.state').show();
            }

            if ($limit.children(':hidden')) {
                $limit.show();
            }
            if ($forbidden.children(':hidden')) {
                $forbidden.show();
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
        $container.masonry({filters: filters});


    });


});