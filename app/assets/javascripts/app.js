var ready;

ready = function(){
  
  // filter btn

  $(".filter-btn").click(function(){
    $("#filter_panel").slideToggle("slow");
  });
    
    // show page image selector
      $(".sub-image li img").click(function(){
      var selected_img = $(this).attr("src");
      $(".main-image").attr("src",selected_img);
      
  // show page name
      var name = $(this).data("name");
      $(".header-title h2").append().text(name);
      console.log(name);

    });  

  // show sub navigation

    $("div").each(function(){
      if($(this).data("nav") === "sub-nav"){
        $("#main_nav").css("display","none");
        $("#sub_nav").css("display","block");
      }
    }); 

  // sub navigation back/home button
    
    $(".back-btn").click(function(){
    
  
        window.location.replace("http://localhost:3001");
    
    });  


};

$(document).ready(ready);
$(document).on('page:load', ready);

    
    



