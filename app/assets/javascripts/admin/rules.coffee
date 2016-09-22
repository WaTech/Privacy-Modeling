$(document).on 'turbolinks:load', ->
  icon_allow = '<i class="fa fa-exclamation-circle fa-3x pull-left" data-id="" data-toggle="modal" data-target=".bd_law_context" data-category="limitation" ></i>'
  icon_restriction = '<i class="fa fa-times-circle fa-3x pull-left" data-id="" data-toggle="modal" data-target=".bd_law_context" data-category="restriction" ></i>'
  icon_forbidden = '<i class="fa fa-gavel fa-3x pull-left" data-id="" data-toggle="modal" data-target=".bd_law_context" data-category="applicable_law"></i>'

  log = (value) ->
    console.log value

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
          context_items = row.context_items.map (context_item) ->
            if context_item.category == 'applicable_law'
              ['<p><a href="', context_item.source, '">', context_item.description, '</a></p>'].join('')
            else
              ['<p>', context_item.description, '</p>'].join('')
          context_items.join('')
          # context_items = (context_item.description for context_item in row.context_items)

          # ('<p>' + conext_item + '</p>' for conext_item in context_items).join('')
        'targets': 0
      }
      {
        'render': (data, type, row) ->
          dataIdBlueprint = 'data-id=""'
          dataId = ['data-id="', row.id, '"'].join('')
          icons = [icon_allow, icon_restriction, icon_forbidden]
          (icon.replace(dataIdBlueprint, dataId) for icon in icons).join('')
        'targets': 0
      }
    ])


  # update rule restriction after changing it's value in select
  $('body').on 'change', 'select', ->
    row_id = table.row($(this).parents('tr')).index()

    log table.page.info()
    data = table.row(row_id).data()
    serialized_data = $(this).serialize()
    $.post({ 'url': data.url, 'data': serialized_data, 'type': 'PUT' }, ->).fail(->
      log 'error'
    )

  # reload datatable after new context item added
  $('body').on 'ajax:success', '#new_law_context_item', ->
    $('#new_law_context').modal('toggle')
    table.draw()

  # hide soure url for context item modals except with applicable_law category
  # set real rule id for form's action
  # set real context item categoru
  $('#new_law_context').on 'show.bs.modal', (event) ->
    modal = $(this)
    form = modal.find('form')
    relatedTarget = $(event.relatedTarget)
    row_id = table.row(relatedTarget.parents('tr')).index()
    data = table.row(row_id).data()

    form.attr('action', ['/admin/rules/', data.id, '/context_items'].join(''))
    context_item_category_input = form.find('#context_item_category')
    context_item_category_input.attr('value', relatedTarget.data('category'))
    is_applicable_law_category = relatedTarget.data('category')
    source = modal.find('#context_item_source_form_group')
    if is_applicable_law_category == 'applicable_law'
      source.show()
    else
      source.hide()
