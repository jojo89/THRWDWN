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
      $('.selected').remove();
      $.post(url, {data:array},function(response){
        $('#points').text(response.data);
        $('.nonselected').each(function(index,element){
         $(this).attr('value',response.dice[index]);
        }); 
      });
    });
});