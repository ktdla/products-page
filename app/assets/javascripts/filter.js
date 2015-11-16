$(document).ready(function () {

 $(".filter-toggle").click(function(){
         $(".active-filter").slideToggle();
     });

 //slides
 $(function() {
  $(".slides").slidesjs({
    height: 200,
    play: {
      auto: true
    }
  })
 })
});
