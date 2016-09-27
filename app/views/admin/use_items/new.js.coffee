$('body').prepend "<%= escape_javascript(render partial: 'form') %>"
$('#new_use_item_modal').modal('toggle')
