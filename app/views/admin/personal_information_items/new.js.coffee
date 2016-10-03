$('body').prepend "<%= escape_javascript(render partial: 'form') %>"
$('#new_personal_information_item_modal').modal('toggle')
