$(document).on 'turbolinks:load', ->
  table = $('#users').DataTable(
    'serverSide': true
    'ordering': false
    'searching': false
    'ajax':
      'url': '/admin/users'
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
      { 'data': 'email' },
      {
        'render': (data, type, row) ->
          dataId = ['data-id="', row.id, '"'].join('')
          editIcon = ['<i class="edit-user fa fa-pencil fa-1x pull-left"', dataId, '></i>'].join(' ')
          destroyIcon = ['<i class="remove-user fa fa-remove fa-1x pull-left"', dataId, '></i>'].join(' ')
          [editIcon, destroyIcon].join('')
        'targets': 0
      }
    ])


  # reload datatable after new context item added
  $('body').on 'ajax:success', '#new_user_modal, .edit_user', ->
    table.draw('page')

  $('body').on 'click', '.edit-user', ->
    row_id = table.row($(this).parents('tr')).index()
    data = table.row(row_id).data()
    $.get [data.url, 'edit'].join('/')

  $('body').on 'click', '.remove-user', ->
    row_id = table.row($(this).parents('tr')).index()
    data = table.row(row_id).data()
    if confirm('Do you really want to destroy this user?')
      $.ajax
        url: data.url
        type: 'DELETE'
        success: (result) ->
          table.draw('page')
