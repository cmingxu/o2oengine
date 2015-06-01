// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.turbolinks
//= require turbolinks
//= require underscore
//= require underscore.string
//
function close_popup() {
  $("#overlay").fadeOut();
}


$(document).on('page:fetch', function () {
  $(".loading_indicator").removeClass('hide');
}).on('page:receive', function () {
  $(".loading_indicator").addClass('hide');
})

$(document).ready(function () {
  $(document).keyup(function (e) {
    if(e.which == 27){
      $("#overlay").fadeOut();
    }
  });
  $("#overlay").click(function () {
    $(this).fadeOut();
  });

  $("#overlay_container").click(function () {
    event.stopPropagation();
  });

  $(".popup").click(function () {
    $("#overlay").fadeIn();
    $("#overlay_container").load($(this).data("remote-url"))
    event.stopPropagation();
  });

  $(".dropdown-handler").click(function () {
    handler = $(this);
    menu = $(this).next(".dropdown_menus");
    menu.css("width", handler.css('width')).removeClass("dropdown-close")
    event.stopPropagation();
    $('html').one('click',function() {
      menu.addClass("dropdown-close");
    });
  });

});
