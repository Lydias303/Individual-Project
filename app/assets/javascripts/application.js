//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-modal
//= require bootstrap-modalmanager
//= require moment
//= require maskedinput
//= require bootstrap-datetimepicker
//= require_tree .

$('.dropdown-toggle').dropdown();

$('#openBtn').click(function(){
  $('#likes-modal').modal({show:true})
});
