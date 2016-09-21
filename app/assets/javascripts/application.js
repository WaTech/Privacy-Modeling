// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require tether
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require datatables
//= require_tree .
$(document).ready(function() {
  var restrictionIndex = 3;
  var table = $('#rules').DataTable({
    'serverSide': true,
    'ordering':  false,
    'searching': false,
    'ajax': {
      'url': '/admin/rules',
      'type': 'GET',
      'datatype': 'JSON'
    },
    'processing': true,
    'pageLength': 5,
    'lengthChange': false,
    'pagingType': 'simple_numbers',
    'info': false,
    'columns': [
      { 'data': 'category_name' },
      { 'data': 'personal_information_item_name' },
      { 'data': 'use_item_name' },
      { 'data': 'restriction' },
      { 'data': 'context_items' },
      {
          "targets": -1,
          "data": null,
          "defaultContent": "<button>Click!</button>"
      }
    ]
  });


} );
