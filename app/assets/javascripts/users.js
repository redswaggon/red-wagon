$(function(){
  $(".photo img").click(function(){
    var username, item, source;
    username = $('.username').text();
    item = $(this).parent().attr("id");
    source = "/users/" + username + "/items/" + item + "/edit";
    $("#edit_frame").attr('src', source);
    $("#edit_frame, #cover").fadeTo(200,1);
  });

  $('#cover').click(function(){
    $('#cover, #edit_frame').fadeTo(200,0).hide();
  });

  $('i').click(function(){
    var item, post_path, data, clicked_tag;
    item = $(this).parent().attr("id");
    post_path = "/items/" + item;
    data = {id: item};
    clicked_tag = $(this);

    $.post(post_path, data, function(updated_photo){
      clicked_tag.parent().children("img").attr('src', updated_photo.photo_url);
      clicked_tag.parent().children("span").text(updated_photo.name);
    });

  });
});