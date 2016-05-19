$(document).ready(function () {

  $(".status_icon").click(function() {  
    $(".status_bg").show();

    setTimeout(function(){
        $(".status_bg").animate({top: '0'}, 1000);
    });  

  });
  
  $(".status_bg").click(function() { 
    $(".status_bg").animate({top: '-1250px'}, 1000);

  });


});