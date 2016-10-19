# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  setTimeout (->
    $('.list').masonry
      'itemSelector': '.block'
      'columnWidth': 218
      'gutter': 20
  ), 100
