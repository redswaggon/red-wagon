$(function(){
  $(".photo").click(function(){

    var username, item, source;
    username = $('.username').text();
    item = $(this).attr("id");
    source = "/users/" + username + "/items/" + item + "/edit";

    $("#edit_frame").attr('src', source);
    $("#edit_frame, #cover").fadeTo(200,1);
  });

  $('#cover').click(function(){
    $('#cover, #edit_frame').fadeTo(200,0).hide();
  });

});