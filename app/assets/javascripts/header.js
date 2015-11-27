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
//show collection
$('.collection a').hover(function(){
  $('#collection').show();
});
$('.collection a').click(function(){
  $('#collection').toggle();
  $('#collection-responsive').toggle();
});
$(window).resize(function(){
  if ($(window).width()>768) {
    console.log($(window).width());
    $(".nav-responsive").removeAttr('style');
  }
});
//button responsive
$('.button-responsive').click(function(){
  $(".nav-responsive").fadeToggle("fast","swing");
});

});
