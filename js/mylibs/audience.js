/////////////////////////////////////////////////////////////////////////////////////////////////////
// JQuery on window load function below
//    Loading fly out functions.
/////////////////////////////////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
	$('.box_header').bind('click', openFlyout);
	$('.close_links').bind('click', close_Link);
	$('.super_link').bind('click', openFlyout);

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Fly out menu functions below
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	var openTitleBackgrd = 'prebuilt/interface_textures/general_audience/titlebar.jpg';
	var closeTitleBackgrd = 'prebuilt/interface_textures/general_audience/carbon_fiber_blue.jpg';
	var openBodyColor = '#f0f0f0';
	var closeBodyColor = '#C8C8C8';
	var openBodyWidth = '300px';
	var closeBodyWidth = '290px';
	var leftLinkTail = '_link h3';
	var flyoutTail = '_links';
	var bodyTail = '_body';	
	var fade_out_speed = 400;
	var fade_in_speed = 400;

	var link = '';
	var links = '';
	var body = '';
	var oldName = '';
	var name = '';

	function openFlyout(){
		//If there is no "more" link, do not run the flyout/box animation [added 1.130.2012 by Jakob Anderson]
		if ($(this).children('.link_expansion_arrow').length != 0) {

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
				//$(link).addClass("box_header_black");
		 		$(body).css({'backgroundColor': '#f0f0f0'}).animate({'width': openBodyWidth}, fade_in_speed);
			}
			else
			{
				clear_super_links();
				oldName = name = '';
			}
			$(link).bind('click', openFlyout);
		}
	}

	function clear_super_links() {
			$(links).fadeOut(fade_out_speed);
			//$(link).removeClass("box_header_black");
	 		$(body).css({'backgroundColor': '#C8C8C8'}).animate({'width': closeBodyWidth}, fade_out_speed);
			$(link).bind('click', openFlyout);
	}

	function close_Link(){
		clear_super_links();
		oldName = name = '';
	}

	// Close open flyout when clicking anywhere else on the page
	$('body').click(function(event) {
	    if (!$(event.target).closest('.container').length) {
	       close_Link();
	    };
	});

});//end document.ready

/////////////////////////////////////////////////////////////////////////////////////////////////////
// CYCLE ad functions functions below
/////////////////////////////////////////////////////////////////////////////////////////////////////

$(window).load(function() {
	
	var width = $('#cycle_gallery').width();
	var highest = 0;
	var control_top = 0;
	var img_left_margin = 0;
	var img_top_margin = 0;
	var count = 0;

	$('#cycle img').each(function(){
		count++;
	});
	$('#cycle_control').css('width', width);
	
	$('#cycle').cycle({
		fx: 		$('#cycle').attr('class'),
		pause: 		1, 
		next: 		'#cycle_next',
		prev: 		'#cycle_prev',
		pager: 		'#cycle_nav' 
	});

	var nav_width = 0;
	var left_padding = 0;
	var page_nav = count * 22;

	$('#cycle').hover(function(){
		$('#cycle_next').toggle();
		$('#cycle_prev').toggle();
	});
	$('#cycle_control').hover(function(){
		$('#cycle_next').toggle();
		$('#cycle_prev').toggle();
	});

});

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Calendar Highlights functions below
/////////////////////////////////////////////////////////////////////////////////////////////////////


	
function output(index){
	// Get description info
	var DESC_LENGTH = 400;
	var descriptionShort = info[index].description.substr('', DESC_LENGTH);
	var detail_info = "<span style=\"font-size:12px; margin: 10px;\">";
	detail_info += descriptionShort;
	if (info[index].description.length > DESC_LENGTH){
		detail_info += '...';
	}
	detail_info += '</span>';

	// Get and reformat date
	var date = new Date(info[index].eventDate);
   	date = date.toString();
   	date = date.substr('', 10);
	date = date.replace(" 0"," ");
	date = date.substr(0,3) + ',' + date.substr(3);

	// Display title, date with start time, and link inside info_box div
	$("#info_box").html(
		'<div class="title_div">'
	    + '<span class="title">' + info[index].title + '</span>'
	    + '</div>'
	    + '<span class="date">' + date + ', ' + info[index].startTime + '</span>'
	    + '<div class="info_box_link_div">'
	    + '<a href="' + info[index].link + '" class="info_box_link">Learn more</a>'
		+ '</div>'
	);

	// Get image tag out of description
	var newImage = null;
	for (var i = 0; i < info[index].description.length; i++){
	   	if (info[index].description.substr(i, 4) == '<img'){
	    	var start = i;
			while (info[index].description[i] != '>' && i < info[index].description.length){
				i++;
			}
			i++;
			newImage = info[index].description.substr(start, i - start);
			i = info[index].description.length;
		}
	}

	// Display image if image found else display description
	var displayInfo;
   	if (newImage != null){
	    displayInfo = '<a href="' + info[index].link + '" class="display_img">';
   		displayInfo += newImage;
   		displayInfo += '</a>';
   		detail_info.substr('', 0);
   	} else {
		displayInfo = detail_info;
		displayInfo += '<div id="morelinks" class="display_info">';
		displayInfo += '<img width="10" height="10" src="prebuilt/interface_textures/calendar_highlights/dark_grey_button.png">';
	    displayInfo += '<a href="' + info[index].link + '" class="display_info_link">Click here for more info.</a>';
		displayInfo += '</div>';
	}

	// Output to detail_view
    $("#detail_view").html(
       	displayInfo
	);
}

function calHover(){
		document.getElementById('CalTitleImg').innerHTML = "<img src='prebuilt/interface_textures/calendar_highlights/doubleArrowHover.png' />";
		$(this).addClass('hoverLink');
	}

function calHoverOut(){
		document.getElementById('CalTitleImg').innerHTML = "<img src='prebuilt/interface_textures/calendar_highlights/doubleArrow.png' />";
		$(this).removeClass('hoverLink');
	}
