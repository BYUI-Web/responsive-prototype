$(window).load(function() {
	
	var width = $('#cycle_time-line_gallery').width() - 2;
	var highest = 0;
	var control_top = 0;
	var img_left_margin = 0;
	var img_top_margin = 0;
	var count = 0;

	$('#cycle_time-line img').each(function(){
		if($(this).width() > width){
			$(this).css('width', width);
		}
		count++;
	});
	// $('#cycle_time-line img').each(function(){
	// 	if($(this).height() > highest){
	// 		highest = $(this).height();
	// 	}
	// });
	// $('#cycle_time-line img').each(function(){
	// 	if($(this).width() > width){
	// 		$(this).css('width', width);
	// 	}
	// 	if($(this).height() > highest){
	// 		highest = $(this).height();
	// 	 	$('#cycle_time-line').css('height', highest);
	// 	}
	// 	else {
	// 		img_top_margin = (highest - $(this).height()) / 2;
	// 		$(this).css('margin-top', img_top_margin);
	// 	}
	// 	control_top = highest / 2 - 5;
	// 	$('#time_control').css('top', control_top);
	// 	img_left_margin = (width - $(this).width()) / 2;	
	// 	$(this).css('margin-left', img_left_margin);
	// });
	$('#time_control').css('width', width);
	
	$('#cycle_time-line').cycle({
		fx: 		$('#cycle_time-line').attr('class'),
		pause: 		1, 
		next: 		'#time_next',
		prev: 		'#time_prev',
		pager: 		'#time_nav',
		pagerAnchorBuilder: function(idx, slide) {
            // return sel string for existing anchor
            return '#time_nav li:eq(' + (idx) + ')';
        } 
	});

	var nav_width = 0;
	var left_padding = 0;
	var page_nav = count * 57;
	if(page_nav > width){
		nav_width = width
	} else {
		nav_width = page_nav;
		left_padding = ((page_nav - width) / 2) * -1;
	}

	$('#time_nav').css('width', nav_width);
	$('#time_nav').css('margin-left', left_padding);
	$('#cycle_time-line_gallery').css('width', width);
	$('#cycle_time-line').css('width', width);
	// $('#cycle_time-line').css('height', highest);

	$('#cycle_time-line').hover(function(){
		$('#time_next').toggle();
		$('#time_prev').toggle();
	});
	$('#time_control').hover(function(){
		$('#time_next').toggle();
		$('#time_prev').toggle();
	});
});
