$('#content').prepend "<%= escape_javascript(render partial: 'form') %>"
$('#context_item_applicable_law_kind').addClass 'form-control'
$('#edit_law_context').modal('toggle')
