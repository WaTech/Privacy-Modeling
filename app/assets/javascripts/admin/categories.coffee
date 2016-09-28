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
      {
        'render': (data, type, row) ->
          dataId = ['data-id="', row.id, '"'].join('')
          editIcon = ['<i class="edit-category fa fa-pencil fa-1x pull-left"', dataId, '></i>'].join(' ')
          destroyIcon = ['<i class="remove-category fa fa-remove fa-1x pull-left"', dataId, '></i>'].join(' ')
          [editIcon, destroyIcon].join('')
        'targets': 0
      }
    ])

  # reload datatable after new context item added
  $('body').on 'ajax:success', '#new_category_modal, .edit_category', ->
    table.draw('page')

  $('body').on 'click', '.edit-category', ->
    row_id = table.row($(this).parents('tr')).index()
    data = table.row(row_id).data()
    $.get [data.url, 'edit'].join('/')

