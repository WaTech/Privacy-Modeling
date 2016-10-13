$(document).on 'turbolinks:load', ->
  table = $('#use_items').DataTable(
    'serverSide': true
    'ordering': false
    'searching': false
    'ajax':
      'url': '/admin/uses'
      'type': 'GET'
      'datatype': 'JSON'
    'processing': true
    'pageLength': 15
    'lengthChange': false
    'pagingType': 'simple_numbers'
    'info': false
    'columnDefs': [
      { "width": "5%", "targets": 0 }
      { "width": "80%", "targets": 1 }
    ]
    'columns': [
      { 'data': 'id' },
      { 'data': 'name' },
      {
        'render': (data, type, row) ->
          dataId = ['data-id="', row.id, '"'].join('')
          editIcon = ['<i class="edit-use-item fa fa-pencil fa-1x pull-left"', dataId, '></i>'].join(' ')
          destroyIcon = ['<i class="remove-use-item fa fa-remove fa-1x pull-left"', dataId, '></i>'].join(' ')
          [editIcon, destroyIcon].join('')
        'targets': 0
      }
    ])

  # reload datatable after new context item added
  $('body').on 'ajax:success', '#new_use_item, .edit_use_item', ->
    table.draw('page')

  $('body').on 'click', '.edit-use-item', ->
    row_id = table.row($(this).parents('tr')).index()
    data = table.row(row_id).data()
    $.get [data.url, 'edit'].join('/')

  $('body').on 'click', '.remove-use-item', ->
    row_id = table.row($(this).parents('tr')).index()
    data = table.row(row_id).data()
    if confirm('Do you really want to destroy?')
      $.ajax
        url: data.url
        type: 'DELETE'
        success: (result) ->
          table.draw('page')
