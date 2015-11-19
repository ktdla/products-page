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

  //filter categories from home
  var url = window.location.href
  var arr = url.split("#");
  var category = arr[1].toLowerCase();
  $(".products article").hide();
  $("."+category).show();

  //filter posts in home
  var elements = $('.news .post');
  $('.news .post').detach();
  elements.appendTo(".news");
  $('.news .post').hide();
  $('.news .post').slice(0,3).show();

  //popup
  $('.popup-vimeo').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,

    fixedContentPos: false
  });
});
