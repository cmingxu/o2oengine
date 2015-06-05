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

function register_popup_event() {
  $(".popup").on('click', function () {
    overlay_id = $(this).data("overlay");
    $("#overlay").fadeIn('fast');
    $("#" + overlay_id).show();
    $("#" + overlay_id).one('click', function () {
      event.stopPropagation();
    });
    $("#overlay").one('click', function () {
      $("#" + overlay_id).hide();
      $(this).fadeOut('fast');
    });
  });
}

function register_place_order_event() {
  $(".quantity .quantity_handler").on('click', function () {
    if($(this).parent().hasClass("disabled")){
      return;
    }

    $(".loading_indicator").removeClass('hide');

    $.ajax({
      url: "wechat/change_last_quantity",
      method: 'PATCH',
      data: {change: $(this).data('change')}
    })
  });

  $("#place_order_btn").click(function () {
    if($(this).hasClass("disabled")){
      $(".loading_indicator").removeClass('hide');

      $.ajax({
        url: "wechat/place_order",
        method: 'POST'
      })
    }
  });
}

$(document).ready(function(){
  register_popup_event();
  register_place_order_event();

  $(".product-list-group .list-group-item").click( function () {
    $(".loading_indicator").removeClass('hide');
    $.ajax({
      url: "wechat/change_product",
      method: 'PATCH',
      data: {product_id: $(this).data('product-id')}
    });
  });

});
