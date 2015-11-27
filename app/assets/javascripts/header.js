$(document).ready(function () {
  $(window).scroll(function(){
    var sticky = $('.sticky'),
        scroll = $(window).scrollTop();

    if (scroll >= 30) sticky.addClass('fixed');
    else sticky.removeClass('fixed');
  });

//suscription header
$(".suscribe").click(function(){
  $(".header-register").slideToggle(0);
});

//button responsive
$('.button-responsive').click(function(){
  $(".nav-responsive").toggle();
  if ($("#navigation-menu").is(':hidden')) {
    $("#navigation-menu").removeAttr('style');
  }
});
});
