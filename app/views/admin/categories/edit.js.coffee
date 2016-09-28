$('body').prepend "<%= escape_javascript(render partial: 'form') %>"
$('#new_category_modal').modal('toggle')
