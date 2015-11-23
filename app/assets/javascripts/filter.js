$(document).ready(function () {

  $(".filter-toggle").click(function(){
         $(".active-filter").slideToggle();
     });

  //slides
  $(function() {
  $(".slides").slidesjs({
    height: 100,
    play: {
      auto: true
    }
  });
  });

//filter posts in home
  var elements = $('.news .post');
  $('.news .post').detach();
  elements.appendTo(".news");
  $('.news .post').hide();
  $('.news .post').slice(0,3).show();

  //filter categories from home
  // $('#navigation-menu li').click(function(){
  //   var name = $(this).text().toLowerCase();
  //   $(".products article").hide();
  //   $("."+name).show();
  //   window.history.replaceState(category, name, name);
  // });
  // var url = window.location.href
  // var arr = url.split("#");
  // var category = arr[1].toLowerCase();
  // $(".products article").hide();
  // $("."+category).show();

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