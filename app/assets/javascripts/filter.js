$(document).ready(function () {

  $(".filter-toggle").click(function(){
         $(".active-filter").slideToggle();
     });

  //slides
  $(function() {
  $(".slides").slidesjs({
    height: 80,
    play: {
      auto: true,
      interval: 15000
    },
    effect: {
      slide: {
        speed: 8000
      },
      fade: {
        speed: 8000,
        crossfade: true
      }
    }
  });
  });

//filter posts in home
  var elements = $('.news .post');
  $('.news .post').detach();
  elements.appendTo(".news");
  $('.news .post').hide();
  $('.news .post').slice(0,3).show();

//filter categories products
//filter with animation
  $('#Container').mixItUp({
    animation: {
      duration: 600,
      effects: 'fade stagger(34ms) translateZ(-100px)',
      easing: 'cubic-bezier(0.68, -0.55, 0.265, 1.55)'
    }
  });
  $(".active-filter li").click(function(){
    $(".active-filter li").removeClass("active");
    $(this).addClass("active");
    var categoryProduct = $(this).text().toLowerCase();
    $(".products article .tagline").hide();
    $(".products article #"+categoryProduct).show();
    //Sort elements
    //var list = $(".products article span").text();
    //var elements = $("#"+categoryProduct)
  });

  //popup
  $('.popup-vimeo').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,

    fixedContentPos: false
  });

//map
  $('#map').addClass('scrolloff');
    $('#overlay').on("mouseup",function(){
      $('#map').addClass('scrolloff');
    });
    $('#overlay').on("mousedown",function(){
      $('#map').removeClass('scrolloff');
    });
    $("#map").mouseleave(function () {
      $('#map').addClass('scrolloff');
    });
});