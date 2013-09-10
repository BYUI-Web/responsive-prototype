/////////////////////////////////////////////////////////////////////////////////////////////////////
// JQuery on window load function below
//    Loading fly out functions.
/////////////////////////////////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
	// add click event to "student life" button to override link to load new link page
	$('.small_super_link').bind('click', openFlyout);
	$('.large_super_link').bind('click', openFlyout);
	$('.super_link').bind('click', openFlyout);
	$('.close_links').bind('click', close_Link);
	$('#CalLink').hover(calHover, calHoverOut);
	$('.small_super_link').hover(moreHover, moreHoverOut);
});

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Calendar Highlights functions below
/////////////////////////////////////////////////////////////////////////////////////////////////////

function RSSItem() {};

RSSItem.prototype = {

    title: '',         // info[i].title      <== feed.items.title
    link: '',          // ...
    description: '',   // ...
    updated: '',       // ...
    id: '',            // info[i].id         <== feed.items.id
    location: '',      // info[i].location   <== feed.items.location
    eventDate: '',     // ...
    allDayEvent: '',   // ...
    startTime: '',     // ...
    endTime: ''        // info[i].endTime    <== feed.items.endTime
};

var info = new RSSItem();  // info[i].{name given above} Use to store data parsed by Calendar_jfeed.js

$(window).load(function() {
	//determin pagetype by title of html page. Then choose correct rss.xml feed 
	var urlfeed = 'Stylesheets/rss.xml';    // <--- address of Current Students rss.xml
	var pagetype = document.getElementsByTagName("title").innerHTML;
	if (pagetype == "Employees")
	{
		urlfeed = 'Stylesheets/rss_emp.xml';        // <--- address of Employees rss.xml 
	} 
 //	else if (pagetype == "Current Students"){}
 // else {"Incorrect title value or diffrent pagetype"}
 
		// use Calendar_jfeed.js (Ajax) to retieve data from file given in "url:"
	    jQuery.getFeed({
        url: urlfeed,                            // This is required to be a locol file address
        success: function(feed) {
        	//Populate scroll bar
	    	var html = '<ul id="event_list">';
	        var NUM_LIST_ITEMS = 20;
            if (NUM_LIST_ITEMS > feed.items.length)
            {
            	NUM_LIST_ITEMS = feed.items.length;
            }
	        for(var i = 0; i < NUM_LIST_ITEMS; i++) { 
	        	info[i] = new Array();
	            var item = feed.items[i];
                info[i].title = item.title;
                info[i].description = item.description;
                info[i].link = item.link;
                info[i].eventDate = item.eventDate;
                info[i].startTime = item.startTime;
                if(i % 2 == 0){
  	            	html += '<li id="' + i + '" class="even">';
  	            }else{
  	                html += '<li id="' + i + '" class="odd">';
  	            }
	            html += item.title.substr('', 22)
	            if (item.title.length > 22){
	            	html += '...'; 
	            }    
	                + '</li>';
	        }

	        $("#event_list_scrolling").html(html);
            $("#event_list").jScrollPane({scrollbarWidth:14});

            // populate display fields
	        $("#event_list li").click(function(){
	        	output(this.id);
	        });
			output(0);
	    }    
	});
});
	
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

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Fly out menu functions below
/////////////////////////////////////////////////////////////////////////////////////////////////////

var openTitleBackgrd = 'prebuilt/interface_textures/general_audience/titlebar.jpg';
var closeTitleBackgrd = 'prebuilt/interface_textures/general_audience/carbon_fiber_blue.jpg';
var openBodyColor = '#f0f0f0';
var closeBodyColor = '#C8C8C8';
var openBodyWidth = '280px';
var closeBodyWidth = '270px';
var leftLinkTail = '_link h3';
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
		$(link).css('backgroundImage',"url('" + openTitleBackgrd + "')");
 		$(body).animate({'backgroundColor': openBodyColor, 'width': openBodyWidth}, fade_in_speed);
	}
	else
	{
		clear_super_links();
		oldName = name = '';
	}
	$(link).bind('click', openFlyout);
}

function clear_super_links() {
		$(links).fadeOut(fade_out_speed);
		$(link).css('backgroundImage',"url('" + closeTitleBackgrd + "')");
 		$(body).animate({'backgroundColor': closeBodyColor, 'width': closeBodyWidth}, fade_out_speed);
		$(link).bind('click', openFlyout);
}

function close_Link(){
	clear_super_links();
	oldName = name = '';
}

function moreHover(){
		var linkImage = this.getElementsByTagName('div')[0];
		$(linkImage).css('backgroundImage',"url('prebuilt/interface_textures/general_audience/moreDoubleHover.png')");
		$(linkImage).clearQueue();
	}
	
function moreHoverOut(){
		var linkImage = this.getElementsByTagName('div')[0];
		$(linkImage).css('backgroundImage',"url('prebuilt/interface_textures/general_audience/moreDouble.png')");
		$(linkImage).clearQueue();
	}


/////////////////////////////////////////////////////////////////////////////////////////////////////
// Highlight search box and site index buttons with orange arrows
/////////////////////////////////////////////////////////////////////////////////////////////////////

/*
function moveDomObj(id, l) {
    var domObj = document.getElementById(id);
    domObj.style.left = l+"px";
}
var arrowInTimer = null;
var arrowOutTimer = null;
var arrowObject = null;
var n2 = 10;
var z = 0;
var x = 0;
function arrowR() {
    x = z+5*n2;
    moveDomObj(arrowObject, x);
    n2++;
    if (n2>6) {
      clearInterval(arrowRTimer);
      arrowLTimer = setInterval(arrowL, 40);
    }
}
function arrowL() {
    x = z+5*n2;
    moveDomObj(arrowObject, x);
    n2--;
    if (n2<1) {
      clearInterval(arrowLTimer);
      arrowRTimer = setInterval(arrowR, 40);
    }
}
function stopArrow() {
    document.getElementById(arrowObject).style.display = 'none';
    clearInterval(arrowRTimer);
    clearInterval(arrowLTimer);
    n2 = 0;
}


function startArrow1() {
    arrowObject = 'arrowSearch'
    z = 620;
    document.getElementById(arrowObject).style.display = 'block';
    arrowLTimer = setInterval(arrowL, 40);
}
function startArrow2() {
    arrowObject = 'arrowIndex'
    z = 620;
    document.getElementById(arrowObject).style.display = 'block';
    arrowRTimer = setInterval(arrowR, 40);
}
*/


