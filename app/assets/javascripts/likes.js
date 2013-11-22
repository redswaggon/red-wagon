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
        $('#next_wagon_button').click();
        }, 800);
      });
  });

});