$('#new_user_modal').modal('toggle')
$('#alerts').prepend "<%= escape_javascript(render 'admin/shared/alerts') %>"
