var ready;

ready = function(){

  $main_image = $("#main_image_section");
  $sub_image = $(".sub-image li img");

 
  // filter btn

  $(".filter-btn").click(function(){
    $("#filter_panel").slideToggle("slow");
  });


  // show page

  $show_page = $("#show");
  var active = $show_page.find(".sub-image li").first();
  
  $show_page.find(".active").insertBefore(active);
  $show_page.find(".main-image").attr("src",$show_page.find(".active img").attr("src"));


  // go page btn
  $("#liked table tr").on('click',function(){
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
    parent.history.back();
    return false;    
  });  


// Go page 


if (top.location.pathname === '/go')
{
  initialize();
}

var map; //Your map
function initialize() {
  //Default setup
  var geocoder = new google.maps.Geocoder();
  var myOptions = {
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById("map"), myOptions);
  geocodeAddress(geocoder, map);
}

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').innerText;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

  

}; // end

$(document).ready(ready);
$(document).on('page:load', ready);






