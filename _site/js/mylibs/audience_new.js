/////////////////////////////////////////////////////////////////////////////////////////////////////
// JQuery on window load function below
//    Loading fly out functions.
/////////////////////////////////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
	// add click event to "student life" button to override link to load new link page
	$('.box_header').bind('click', openFlyout);
	$('.close_links').bind('click', close_Link);

	//$('.small_super_link').bind('click', openFlyout);
	//$('.large_super_link').bind('click', openFlyout);
	$('.super_link').bind('click', openFlyout);
	$('.close_links').bind('click', close_Link);
	//$('#CalLink').hover(calHover, calHoverOut);
	//$('.small_super_link').hover(moreHover, moreHoverOut);

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Fly out menu functions below
/////////////////////////////////////////////////////////////////////////////////////////////////////

var openBodyColor = '#f0f0f0';
var closeBodyColor = '#C8C8C8';
var openBodyWidth = '300px';
var closeBodyWidth = '290px';
var leftLinkTail = '_link';
var flyoutTail = '_links';
var bodyTail = '_body';	
var fade_out_speed = 200;
var fade_in_speed = 300;

var link = '';
var links = '';
var body = '';
var oldName = '';
var name = '';

function openFlyout(){
	
	$(link).unbind('click', openFlyout);
	oldName = name;
	var IDName = this.getAttribute("id");
	var index = IDName.indexOf("_link");
	name = '#' + IDName.slice(0,index);
	
	if(oldName !== name)
	{
		clear_super_links();
		link = name + leftLinkTail;
		links = name + flyoutTail;
		body = name + bodyTail;
		$(links).fadeIn(fade_in_speed).css({'z-index':'900'});
		$(link).addClass("box_header_black");
		console.log("oldname is not equal to name");
 		$(body).css({'backgroundColor': '#f0f0f0'}).animate({'width': openBodyWidth}, fade_in_speed);
	}
	else
	{
		clear_super_links();
		console.log("value of .name is: " + name);
		console.log("value of .oldName is: " + oldName);
		name = '';
		//oldName = '';

	}
	$(link).bind('click', openFlyout);
}

function clear_super_links() {
		console.log("hit clear_super_links");
		$(links).fadeOut(fade_out_speed);
		$(link).removeClass("box_header_black");
 		$(body).css({'backgroundColor': '#C8C8C8'}).animate({'width': closeBodyWidth}, fade_out_speed);
		$(link).bind('click', openFlyout);
}

function close_Link(){
	console.log("hit close_links");
	clear_super_links();
	oldName = '';
	//name = '';
}

});
//end document.ready

// $(window).load(function() {
	
// 	var width = $('#cycle_gallery').width();
// 	var highest = 0;
// 	var control_top = 0;
// 	var img_left_margin = 0;
// 	var img_top_margin = 0;
// 	var count = 0;

// 	$('#cycle img').each(function(){
// 		count++;
// 	});
// 	$('#cycle_control').css('width', width);
	
// 	$('#cycle').cycle({
// 		fx: 		$('#cycle').attr('class'),
// 		pause: 		1, 
// 		next: 		'#cycle_next',
// 		prev: 		'#cycle_prev',
// 		pager: 		'#cycle_nav' 
// 	});

// 	var nav_width = 0;
// 	var left_padding = 0;
// 	var page_nav = count * 22;

// 	$('#cycle').hover(function(){
// 		$('#cycle_next').toggle();
// 		$('#cycle_prev').toggle();
// 	});
// 	$('#cycle_control').hover(function(){
// 		$('#cycle_next').toggle();
// 		$('#cycle_prev').toggle();
// 	});
// });
