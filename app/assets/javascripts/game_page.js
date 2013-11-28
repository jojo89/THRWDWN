$( document ).ready(function() {
    $('.nonselected').on('click',function(e){
      console.log("hey");	
      $(this).toggleClass( 'selected')
    });     

    $('.edit_roll').on('click',function(e){
      e.preventDefault();
      var url = $(this).attr("action")
      var array = []
      $('.selected').each(function(){
        array.push($(this).attr('value'));
      });
      $('.nonselected').remove();
      $.post(url, {data:array},function(response){
      	console.log(response)
        $('#points').text(response.data);
        $.each(response.dice, function(index,value){
          $('#points').after($("<img class=\"nonselected\" value=" + value +" src=\"/assets/" + value +".png\">"))
          $('.nonselected').on('click',function(e){
            $(this).toggleClass( 'selected')
          }); 
        }) ;
      });
    });
});