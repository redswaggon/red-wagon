$(function(){
  $('.not_yet_liked').click(function(e){
    e.preventDefault();
    
    var data, user, stranger;
    user_id = $(this).parent().attr('id');
    stranger_id = $(this).parent().attr('class');
    data = {
      user: user_id,
      stranger: stranger_id
      };

    $.post("/likes/create", data, function(response){
      $(".like-success").text(response.message).toggle("fast");
      setTimeout(function(){
        window.location = $('#next_wagon_button').attr('href');
        }, 800);
        
      });
  });

  $('.already_liked').click(function(e){
      e.preventDefault();
      $(".like-success").text("Already liked. Moving you to next wagon.").toggle("fast");
      setTimeout(function(){
        window.location = $('#next_wagon_button').attr('href');
      }, 800);
    });

  $('photo-stranger img').on("mouseover", function(){
    // show the item description in a separate frame
  });

});