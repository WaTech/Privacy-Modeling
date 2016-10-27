# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.list').masonry
    'itemSelector': '.block'
    'columnWidth': 218
    'gutter': 20

  # Check if block is last in column. If it's last then add mirror class
  $('body').on 'mouseover', '.block', ->
    containerWidth = $('.allowed, .limitations, .forbidden').first().width()
    blockWidth = $(this).width()
    columnsNumber = Math.floor(containerWidth / blockWidth)
    position = Math.floor($(this).position().left / blockWidth)
    isLast = position == columnsNumber - 1
    if isLast
      $(this).find('.info').addClass('mirror')
    else
      $(this).find('.info').removeClass('mirror')

  # Open/hide applicable law tooltips on icon click
  $('body').on 'click', '.info', (event) ->
    if $(this).attr('class').indexOf('active') > -1
      $(this).removeClass('active')
    else
      $('.info.active').removeClass('active')
      $(this).addClass('active')
