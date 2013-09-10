$(document).ready(function() {
	var now=new Date();
	var index=(now.getSeconds())%7;

/*
	You can set the type of transition you want by giving id 'cycle' a class name of a valide transition (default is fade).  blindX, blindY,	blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, scrollUp, scrollDown, scrollLeft, scrollRight, scrollHorz, scrollVert, shuffle, slideX, slideY, toss, turnUp, turnDown, turnLeft, turnRight, uncover, wipe, zoom
// */
// 	var transitionsArray=new Array('fade', 'fadeZoom', 'scrollUp', 'scrollDown', 'scrollLeft', 'scrollRight', 'zoom');

// 	var cycleDiv = $('#cycle');
// 	cycleDiv.removeClass();
// 	cycleDiv.addClass(transitionsArray[index]);



	$('#cycle').cycle({
		fx: 		$('#cycle').attr('class'),
		pause: 		1, 
		speed:      2000,
		pager: 		'#image_gallery_nav'
	});


});
