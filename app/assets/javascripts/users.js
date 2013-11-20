$(function(){
  $(".edit_link").click(function(){
    $("#edit_frame, #cover").fadeTo(200,1);
  });
  $('#cover').click(function(){
    $('#cover, #edit_frame').fadeTo(200,0).hide();
  });
});