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
      $('#error').text(" ");
      $(this).toggleClass( 'selected')
    });     

    $('.edit_roll').on('click',function(e){
      e.preventDefault();
      $('#error').text(" ");
      var url = $(this).attr("action")
      var array = []
      $('.selected').each(function(){
        array.push($(this).attr('value'));
      });
      $.post(url, {data:array},function(response){
        $('#points').text(response.data);
        if(response.updated == false)
        {
          $('#error').text("That combination of dice doesn't score points");
        }
        else
        {
          $('#scored_points').val('true')
          $('.selected').remove();
          if($('.nonselected').length== 0)
          {
            $('#error').text("Dice are hot roll again if you dare!");
          }  
        }
      });
    });


    ///when fetching new dice/////
    $('.new_dice').on('click', function(e){
      e.preventDefault	
      $('#error').text(" ");
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
              if(response.dice[index]=="1")
              {
              var extension="1-16227445d1ca9296dae458aee6fdd365"
              }  
              else if(response.dice[index]=="2")
              {
              var extension = "2-7dea6c86173b48c853904a79446fa77a"
              }
              else if(response.dice[index]=="3")
              {
              var extension="3-d6132acd68d225b3c2ed6a78ef18966d"
              }              
              else if(response.dice[index]=="4")
              {
              var extension="4-c2576f2ac64889d520e64ef2dfe71dc0"
              }
              else if(response.dice[index]=="5")
              {
              var extension ="5-239cb74163ebe73a33539200aba0f210"
              }              
              else if(response.dice[index]=="6")
              {
              var extension="6-a69ae67146a8d67ad227d249f29b4fff"
              }
              $(this).attr('value',response.dice[index]);
              $(this).attr('alt',response.dice[index]);
              $(this).attr('src',"/assets/" + extension + ".png");
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
