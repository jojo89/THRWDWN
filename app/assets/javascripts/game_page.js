$( document ).ready(function() {
    $('.nonselected').on('click',function(e){
      $(this).toggleClass( 'selected')
    });     

    $('.edit_roll').on('click',function(e){
      e.preventDefault();
      var url = $(this).attr("action")
      var array = []
      $('.selected').each(function(){
        array.push($(this).attr('id'))
      });
      console.log(array)
 
      $.post(url, {data:array},function(response){

      });
    });
});