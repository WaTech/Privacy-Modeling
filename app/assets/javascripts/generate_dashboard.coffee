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
