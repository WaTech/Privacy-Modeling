$(document).on 'turbolinks:load', ->
  table = $('#categories').DataTable(
    'serverSide': true
    'ordering': false
    'searching': false
    'ajax':
      'url': '/admin/categories'
      'type': 'GET'
      'datatype': 'JSON'
    'processing': true
    'pageLength': 5
    'lengthChange': false
    'pagingType': 'simple_numbers'
    'info': false
    'columns': [
      { 'data': 'id' },
      { 'data': 'name' },
    ])

  # reload datatable after new context item added
  $('body').on 'ajax:success', '#new_category_modal, .edit_use_item', ->
    table.draw('page')

