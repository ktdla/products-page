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
