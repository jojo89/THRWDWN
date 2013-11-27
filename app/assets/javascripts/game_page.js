$( document ).ready(function() {
    $('.nonselected').on('click',function(e){
    	$(this).removeClass('nonselected')
    	$(this).addClass('selected')	
    })
    $('.edit_roll').on('click',function(e){

      e.preventDefault();
      var url = $(this).attr("action")
      console.log(url)
    });
});