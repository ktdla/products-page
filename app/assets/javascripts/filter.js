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
  })
 })


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
