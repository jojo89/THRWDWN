$( document ).ready(function() {
    $('#cheat').on('click',function(e){	
      $('.nonselected').each(function(index,element){
        var rand = Math.floor((Math.random()*6)+1).toString();	
        $(this).attr('value',rand);
        $(this).attr('alt',rand);
        $(this).attr('src',"/assets/" + rand  + ".png");
      }); 
    });     
	numberOfDice = $('.nonselected').length
    $('.nonselected').on('click',function(e){	
      $(this).toggleClass( 'selected')
    });     

    $('.edit_roll').on('click',function(e){
      e.preventDefault();
      var url = $(this).attr("action")
      var array = []
      $('.selected').each(function(){
        array.push($(this).attr('value'));
      });
      $.post(url, {data:array},function(response){
        $('#points').text(response.data);
        if(response.updated == false)
        {
          
        }
        else
        {
          $('#scored_points').val('true')
          $('.selected').remove();
        }
      });
    });


    ///when fetching new dice/////
    $('.new_dice').on('click', function(e){
      e.preventDefault	
      if($('.nonselected').length == numberOfDice)
      {
        $('#error').text("You must score at least one dice per turn");
      }
      else
      {
        $('#scored_points').val('false')
      	numberOfDice = $('.nonselected').length
      	if(numberOfDice == 0)
      	{
      	  $.get("/dice",null,function(response){
            $('.images').replaceWith(response);
            numberOfDice = $('.nonselected').length
            $('.nonselected').on('click',function(e){	
              $(this).toggleClass( 'selected')
            });   
      	  });
      	}
      	else
      	{
          var url = $(this).attr("action")
          $.get(url,null,function(response){
            $('.nonselected').each(function(index,element){
              $(this).attr('value',response.dice[index]);
              $(this).attr('alt',response.dice[index]);
              $(this).attr('src',"/assets/" + response.dice[index]+ ".png");
            }); 
          });
        }
      	
      }
    });
});

            $('.nonselected').each(function(index,element){
              var rand = Math.floor((Math.random()*6)+1).toString();	
              $(this).attr('value',rand);
              $(this).attr('alt',rand);
              $(this).attr('src',"/assets/" + rand  + ".png");
            }); 
