# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('body').on 'change', '.pii-checkbox', ->
    if !!$('.pii-checkbox:checked').length
      $('.submit-button').attr('disabled', false)
    else
      $('.submit-button').attr('disabled', 'disabled')

  $('body').on 'change', '.use-item-checkbox', ->
    if !!$('.use-item-checkbox:checked').length
      $('.submit-button').attr('disabled', false)
    else
      $('.submit-button').attr('disabled', 'disabled')

  $('body').on 'click', '#select_piis .back-button, #select_use_items .back-button', (event) ->
    action = ['/generate_dashboard', $('form').attr('data-previous-step')].join('/')
    path = [action, $('form').serialize()].join('?')
    $(this).attr('href', path)

  $('body').on 'click', '#select_categories_nav_step.active, #select_piis_nav_step.active', (event) ->
    if !!$('form').length
      action = ['/generate_dashboard', $('form').attr('data-previous-step')].join('/')
      path = [action, $('form').serialize()].join('?')
      $(this).attr('href', path)

  $('body').on 'click', '.user-guide-link.pseudo-nav-item', (event) ->
    if !!$('form').length
      path = ['/user_guide', $('form').serialize()].join('?')
      $(this).attr('href', path)
