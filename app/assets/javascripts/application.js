// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require activestorage

//= require jquery-ui/widgets/datepicker
//= require jquery-ui/widgets/slider
//= require toastr
//= require bootstrap-multiselect
//= require moment
//= require fullcalendar
//= require card
//= require Chart.bundle
//= require chartkick
//= require cable
//= require jquery.remotipart
//= require jquery-fileupload/basic
//= require_tree .


$( document ).on('turbolinks:load', function() {
  $('#warehouse_type').multiselect();
  $('#experience_items').multiselect();
  $('#cert_items').multiselect();
  $('#config_items').multiselect();
  $('#equip_items').multiselect();
  $('#accessibility_items').multiselect();
  $('#service_items').multiselect();
});