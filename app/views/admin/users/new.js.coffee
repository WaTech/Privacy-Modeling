$('body').prepend "<%= escape_javascript(render partial: 'form') %>"
$('#new_user_modal').modal('toggle')
