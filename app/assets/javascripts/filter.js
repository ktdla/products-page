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
});
