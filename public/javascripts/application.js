$(document).ready(function(){
	$("#Flash.flash_notice, #Flash.flash_error")
	.animate({opacity: 1.0}, 7000)
	.slideToggle('slow', function() {
		$(this).remove();
	});
});