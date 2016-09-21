$(document).ready ->
  restrictionIndex = 3
  table = $('#rules').DataTable(
    'serverSide': true
    'ordering': false
    'searching': false
    'ajax':
      'url': '/admin/rules'
      'type': 'GET'
      'datatype': 'JSON'
    'processing': true
    'pageLength': 5
    'lengthChange': false
    'pagingType': 'simple_numbers'
    'info': false
    'columns': [
      { 'data': 'category_name' }
      { 'data': 'personal_information_item_name' }
      { 'data': 'use_item_name' }
      {
        'render': (data, type, row) ->
          options = [['allowed', 'Allowed'], ['limitations', 'Limitations'], ['forbidden', 'Forbidden']]
          option_elements = (['<option value="', option[0], '" ', (if option[0] == row.restriction then 'selected="selected"' else ''), ' ">', option[1], '</option>'].join('') for option in options).join('')
          ['<select size="1" id="rule[restriction]" name="rule[restriction]">', option_elements, '</select></td>'].join('')
        'targets': 0

      }
      {
        'render': (data, type, row) ->
          context_items = (context_item.description for context_item in row.context_items)
          ('<p>' + conext_item + '</p>' for conext_item in context_items).join('')
        'targets': 0
      }
    ])

  log = (value) ->
    console.log value

  $('body').on 'change', 'select', ->
    row_id = $(this).parents('tr').attr('id').replace('row_', '') - 1
    data = table.row(row_id).data()
    serialized_data = $(this).serialize()
    $.post({ 'url': data.url, 'data': serialized_data, 'type': 'PUT' }).fail(->
      log 'error'
    )
