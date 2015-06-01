//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require underscore
//= require underscore.string
//



$(document).on('page:fetch', function () {
  $(".loading_indicator").removeClass('hide');
}).on('page:receive', function () {
  $(".loading_indicator").addClass('hide');
})
