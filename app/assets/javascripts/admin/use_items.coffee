#TODO
# - Reload databale on adding use item without page dropping

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
          ['<i class="fa fa-pencil fa-1x pull-left"', dataId, '></i>'].join(' ')
        'targets': 0
      }
    ])

  # reload datatable after new context item added
  $('body').on 'ajax:success', '#new_use_item', ->
    table.draw('page')
