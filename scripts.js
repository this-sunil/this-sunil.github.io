$(document).ready(function() {
		$("#mymenu").click(function(){
			$("#my-bs").addClass("animated zoomInUp");
			if($("#my-bs").hasClass("pop-menu"))
			{
				$("#my-bs").removeClass("pop-menu").hide();
			}
			else
			{
				$("#my-bs").addClass("pop-menu").show();
			}

		});

    $('.toggle').click(function(){
      $('.toggle').toggleClass('active');
      $('ul').toggleClass('active');
    });

  });
  /* $(document).ready(function(){
    $("#myCarousel").carousel('cycle');
   });
document.addEventListener('contextmenu',function(e){
	e.preventDefault();

});
document.onkeydown=function(e){
	if(event.KeyCode==123)
	{
		return false;
	}
	if(e.ctrlKey && e.shiftKey && e.keyCode=='I'.charCodeAt(0)){
		return false;
	}
	if(e.ctrlKey && e.shiftKey && e.keyCode=='J'.charCodeAt(0)){
		return false;
	}
	if(e.ctrlKey && e.shiftKey && e.keyCode=='U'.charCodeAt(0)){
		return false;
	}
}*/