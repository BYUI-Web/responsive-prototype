$(window).load(function() {


	$("#left_bottom_hover_box").hover(function(){
		$('#light_indicator').css({backgroundPosition: '-382px 0px'});
	}, function(){
		$('#light_indicator').css({backgroundPosition: '-382px -44px'});
	});

	$("#right_bottom_hover_box").hover(function(){
		$('#light_indicator').css({backgroundPosition: '-382px 0px'});
	}, function(){
		$('#light_indicator').css({backgroundPosition: '-382px -44px'});
	});

});
// FOR USE WITH CYCLE ON HOME PAGE
$(window).load(function() {

	$('#cycle1').cycle({
		fx: 		'fade',
		pause: 		1, 
		next: 		'#cycle_next',
		prev: 		'#cycle_prev',
		pager: 		'#cycle_nav',
		speed:  	1500,
		timeout:  	6000
		// cleartypeNoBg: 	true
	});

});