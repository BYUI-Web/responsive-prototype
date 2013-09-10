$(window).load(function() {

	$('#cycle1').cycle({
		fx: 		'fade',
		pause: 		1, 
		next: 		'#cycle_next',
		prev: 		'#cycle_prev',
		pager: 		'#cycle_nav',
		speed:  	1500,
		timeout:  	4000,
		cleartypeNoBg: 	true
	});

	$('#cycle2').cycle({
		fx: 		'wipe',
		pause: 		1, 
		next: 		'#cycle_next',
		prev: 		'#cycle_prev',
		pager: 		'#cycle_nav',
		speed:  	1500,
		timeout:  	4000,
		cleartypeNoBg: 	true
	});

});