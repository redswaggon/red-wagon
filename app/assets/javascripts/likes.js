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
      alert(response.message);
      setTimeout(function(){
        window.location = $('#next_wagon_button').attr('href');
        }, 800);
      });
  });

  $('.already_liked').click(function(e){
      e.preventDefault();
      $('body').append("Already liked!");
      setTimeout(function(){
        window.location = $('#next_wagon_button').attr('href');
      }, 800);
    });

});