$( document ).ready(function() {
    $('.nonselected').on('click',function(e){
    	$(this).removeClass('nonselected')
    	$(this).addClass('selected')
    })
});