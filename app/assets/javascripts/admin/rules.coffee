$(document).on 'turbolinks:load', ->
  icon_allow = '<i class="context-item-limitation-icon ca-2x pull-left" data-id=""  data-label="limitation" data-toggle="modal" data-target=".bd_law_context" data-category="limitation" ></i>'
  icon_restriction = '<i class="context-item-restriction-icon ca-2x pull-left" data-id=""  data-label="restriction" data-toggle="modal" data-target=".bd_law_context" data-category="restriction" ></i>'
  icon_forbidden = '<i class="context-item-applicable-law-icon ca-2x  pull-left" data-id=""  data-label="applicable law" data-toggle="modal" data-target=".bd_law_context" data-category="applicable_law"></i>'

  context_item_icon_allow = '<i class="ca-x context-item-limitation-icon_x pull-left vertical-center"></i>'
  context_item_icon_restriction = '<i class="ca-x context-item-restriction-icon_x pull-left vertical-center"></i>'
  context_item_icon_forbidden = '<i class="ca-x context-item-applicable-law-icon_x pull-left vertical-center"></i>'
  preview_context_item_icon_forbidden = '<i class="ca-x preview-context-item-applicable-law-icon pull-left vertical-center"></i>'

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
    'pageLength': 15
    'lengthChange': false
    'pagingType': 'simple_numbers'
    'info': false
    'columns': [
      { 'data': 'category_name' }
      { 'data': 'personal_information_item_name' }
      { 'data': 'use_item_name' }
      {
        'render': (data, type, row) ->
          options = [['allowed', 'Allowed'], ['limitations', 'Limitations'], ['forbidden', 'Restricted']]
          option_elements = (['<option value="', option[0], '" ', (if option[0] == row.restriction then 'selected="selected"' else ''), ' ">', option[1], '</option>'].join('') for option in options).join('')
          ['<div class="form-group"><select class="form-control" size="1" id="rule[restriction]" name="rule[restriction]">', option_elements, '</select></div>'].join('')
        'targets': 0

      }
      {
        'render': (data, type, row) ->
          context_items = row.context_items.map (context_item) ->
            description = ['<span class="vertical-center">', context_item.description, '</span>'].join('')
            if context_item.category == 'applicable_law'
              ['<p class="rules_context_item_description" data-id="' + context_item.id + '" data-destroy_url="' + context_item.destroy_url + '">', preview_context_item_icon_forbidden, '<a href="', context_item.source, '" target="_blank">', description, '</a></p>'].join('')
            else
              icon = if context_item.category == 'limitation' then context_item_icon_allow else context_item_icon_restriction
              ['<p class="rules_context_item_description" data-id="' + context_item.id + '" data-destroy_url="' + context_item.destroy_url + '">', icon,  description, '</p>'].join('')
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

    log table.page.info().page
    data = table.row(row_id).data()
    serialized_data = $(this).serialize()
    $.post({ 'url': data.url, 'data': serialized_data, 'type': 'PUT' }, ->).fail(->
      log 'error'
    )

  # reload datatable after new context item added
  $('body').on 'ajax:success', '#new_law_context_item', ->
    $('#new_law_context').modal('toggle')
    $('#context_item_category').val('')
    $('#context_item_source').val('')
    $('#context_item_description').val('')
    table.draw('page')

  # hide soure url for context item modals except with applicable_law category
  # set real rule id for form's action
  # set real context item categoru
  $('#new_law_context').on 'show.bs.modal', (event) ->
    modal = $(this)
    form = modal.find('form')
    relatedTarget = $(event.relatedTarget)
    row_id = table.row(relatedTarget.parents('tr')).index()
    data = table.row(row_id).data()

    modal_title = ['New', relatedTarget.data('label'), 'context'].join(' ')
    modal.find('.modal-title').text(modal_title)

    form.attr('action', ['/admin/rules/', data.id, '/context_items'].join(''))
    context_item_category_input = form.find('#context_item_category')
    context_item_category_input.attr('value', relatedTarget.data('category'))
    is_applicable_law_category = relatedTarget.data('category')
    source = modal.find('#context_item_source_form_group')

    if is_applicable_law_category == 'applicable_law'
      source.show()
    else
      source.hide()

  $('body').on 'click', '.import-csv-button', (event) ->
    $('#file').click()
    event.preventDefault()
  $('body').on 'change', '#file', ->
    $('#submit_import_form').click()

  $('body').on 'click', '.rules_context_item_description', ->
    $.get [$(this).data('destroy_url'), 'edit'].join('/')

  $('body').on 'click', '.destroy_context_item_button', (event) ->
    destroy_url = $('#edit_law_context').attr('data-destroy_url')
    if confirm('Do you really want to destroy this context item?')
      $.ajax
        url: destroy_url
        type: 'DELETE'
        success: (result) ->
          table.draw('page')
          $('#edit_law_context').modal('toggle')

  $('body').on 'ajax:success', '.edit_context_item', ->
    $('.edit_law_context').modal('hide')
    table.draw('page')

  $('body').on 'hidden.bs.modal', '.edit_law_context', ->
    $('.edit_law_context').remove()


