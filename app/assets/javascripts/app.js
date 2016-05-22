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
    alert("go to go page");
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

var geocoder; // To use later
var map; //Your map
function initialize() {

  geocoder = new google.maps.Geocoder();
  //Default setup
  var latlng = new google.maps.LatLng(-34.397, 150.644);
  var myOptions = {
    zoom: 8,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById("map"), myOptions);
  
}

//Call this wherever needed to actually handle the display
// function codeAddress(location) {
//     var lat = '';
//     var lng = '';
//     var address = location;
//     geocoder.geocode( { 'address': address}, function(results, status) {
//       if (status == google.maps.GeocoderStatus.OK) {
//          lat = results[0].geometry.location.lat();
//          lng = results[0].geometry.location.lng();
//         });
//       } else {
//         alert("Geocode was not successful for the following reason: " + status);
//       }
  
//     alert('Latitude: ' + lat + ' Logitude: ' + lng);
//   }

  initialize();

};

$(document).ready(ready);
$(document).on('page:load', ready);






