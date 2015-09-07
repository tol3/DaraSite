var wWidth = $(window).width();

$( function () {
	if ( wWidth <= 767 ) {
		$( ".dropdown" ).hover( function () {
			console.log( "hover" )
			$('.dropdown-menu', this).stop(true, true).fadeIn("fast");
			$(this).toggleClass('open');

		}, function () {
			console.log("hover");
			$('.dropdown-menu', this).stop(true, true).fadeOut("fast");
			$(this).toggleClass('open');
		});
	};
});
