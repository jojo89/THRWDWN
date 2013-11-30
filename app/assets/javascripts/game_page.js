$( document ).ready(function() {
	numberOfDice = $('.nonselected').length
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
      $('.selected').remove();
      $.post(url, {data:array},function(response){
        $('#points').text(response.data);
      });
    });


    ///when fetching new dice/////
    $('.new_dice').on('click', function(e){
      e.preventDefault	
      if($('.nonselected').length == numberOfDice)
      {
        $('#points').text("You must score at least one dice per turn");
      }
      else
      {
      	numberOfDice = $('.nonselected').length
        var url = $(this).attr("action")
        $.get(url,null,function(response){
          $('.nonselected').each(function(index,element){
            $(this).attr('value',response.dice[index]);
            $(this).attr('alt',response.dice[index]);
            $(this).attr('src',"/assets/" + response.dice[index]+ ".png");
          }); 
      });
      	
      }
    });
});

