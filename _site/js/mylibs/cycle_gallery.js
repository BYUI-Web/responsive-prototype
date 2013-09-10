$(window).load(function() {
	
	var width = $('#cycle_gallery').width() - 2;
	var highest = 0;
	var control_top = 0;
	var img_left_margin = 0;
	var img_top_margin = 0;
	var count = 0;

	$('#cycle img').each(function(){
		if($(this).width() > width){
			$(this).css('width', width);
		}
		count++;
	});
	$('#cycle img').each(function(){
		if($(this).height() > highest){
			highest = $(this).height();
		}
	});
	$('#cycle img').each(function(){
		if($(this).width() > width){
			$(this).css('width', width);
		}
		if($(this).height() > highest){
			highest = $(this).height();
			$('#cycle').css('height', highest);
		}
		else {
			img_top_margin = (highest - $(this).height()) / 2;
			$(this).css('margin-top', img_top_margin);
		}
		control_top = highest / 2 - 5;
		$('#cycle_control').css('top', control_top);
		img_left_margin = (width - $(this).width()) / 2;
		$(this).css('margin-left', img_left_margin);
	});
	$('#cycle_control').css('width', width);
	
	$('#cycle').cycle({
		fx:	$('#cycle').attr('class'),
		pause: 1,
		next: '#cycle_next',
		prev: '#cycle_prev',
		pager: '#cycle_nav'
	});

	var nav_width = 0;
	var left_padding = 0;
	var page_nav = count * 36;
	if(page_nav > width){
		nav_width = width;
	} else {
		nav_width = page_nav;
		left_padding = ((page_nav - width) / 2) * -1;
	}

	$('#cycle_nav').css('width', nav_width);
	$('#cycle_nav').css('margin-left', left_padding);
	$('#cycle_gallery').css('width', width);
	$('#cycle').css('width', width);
	$('#cycle').css('height', highest);

	$('#cycle').hover(function(){
		$('#cycle_next').toggle();
		$('#cycle_prev').toggle();
	});
	$('#cycle_control').hover(function(){
		$('#cycle_next').toggle();
		$('#cycle_prev').toggle();
	});
});
