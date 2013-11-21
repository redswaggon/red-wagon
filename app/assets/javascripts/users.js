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

  // $('#grab_id')


  // $('form').submit(setTimeout(function(){
  //   var timestamp = new Date().getTime();
  //   $('photo').attr('src',$(this).attr('src') + '?' +timestamp );
  //   parent.closeIFrame();
  //   }), 1000);
});


// dummy view with js file that hides the frame

// $('#id',window.parent.document).html('do something');