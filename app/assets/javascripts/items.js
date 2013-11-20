# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function{

  $('#submit_new_photo').click(function(){
    $.post("/users/#{@user.username}/items", data, function(new_image_attributes){
        $('.photos').append(
          # Append the html necessary to show the image using the JSON. Must fix the setup of the paperclip images
          );
        
        var count = $('.photo').length;
        if count >= 5
          $('#add_photo_form').hide();
        end
    });
  });
});