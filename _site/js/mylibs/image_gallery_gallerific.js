$(window).resize(function(){
		
		//alert($('.navigation ul.thumbs').width())
		//alert('img width = ' + $('.current .advance-link img').width() + ' img height = ' + $('.current .advance-link img').height());
		$('.current .advance-link img').css({
			position:'absolute',

			left: Math.round((790 - $('.current .advance-link img').width())/2),

			top: Math.round((650 - $('.current .advance-link img').height())/2)

		});
		$('.navigation ul.thumbs').css({
			left: (Math.round((780 - $('.navigation ul.thumbs').width()))/2)+75 
		});
	
	});

jQuery(document).ready(function($) {

	

// To initially run the function:
$(window).resize();
	
	

	// We only want these styles applied when javascript is enabled
	$('div.content').css('display', 'block');

	// Initially set opacity on thumbs and add
	// additional styling for hover effect on thumbs
	
	var onMouseOutOpacity = 0.5;
	$('#thumbs ul.thumbs li').opacityrollover({
		mouseOutOpacity:   onMouseOutOpacity,
		mouseOverOpacity:  1.0,
		fadeSpeed:         'fast',
		exemptionSelector: '.selected'
	});
	
	//Round next and prev buttons appear when hovering over the slideshow box
	$("div#mainBody").hover(
	function() {
		$( "#roundPrev img, #roundNext img" ).stop().fadeIn();
	},
	function() {
		$("#roundPrev img, #roundNext img" ).stop().fadeOut();
	});
	
	
	// Initialize Advanced Galleriffic Gallery
	var gallery = $('#thumbs').galleriffic({
		delay:                  	4000,				
		numThumbs:  				6,				
		preloadAhead:              	-1,
		enableTopPager:            	false,
		enableBottomPager:         	false,
		imageContainerSel:         	'#slideshow',
		controlsContainerSel:      	'#controls',
		captionContainerSel:       	'#caption',
		loadingContainerSel:       	'#loading',
		renderSSControls:          	true,
		renderNavControls:         	true,
		playLinkText:              	'<img src="http://beta.byui.edu/prebuilt/interface_textures/image_gallery/2_0/paused.png" />',
		pauseLinkText:             	'<img src="http://beta.byui.edu/prebuilt/interface_textures/image_gallery/2_0/playing.png" />',
		prevLinkText:              	'&lsaquo; Previous Photo',
		nextLinkText:              	'Next Photo &rsaquo;',
		nextPageLinkText :          'Next &rsaquo;',
		nextPageLinkText :          'Next &rsaquo;',
		prevPageLinkText:          	'&lsaquo; Prev',
		enableHistory:             	false,
		autoStart:              	true,
		syncTransitions:           	true,
		defaultTransitionDuration:  400,
		onSlideChange:             	function(prevIndex, nextIndex) {
			
		
			// 'this' refers to the gallery, which is an extension of $('#thumbs')
			this.find('ul.thumbs').children()
				.eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
				.eq(nextIndex).fadeTo('fast', 1.0);
			
				
			// Update the photo index display
			this.$captionContainer.find('div.photo-index')
				.html('Photo '+ (nextIndex+1) +' of '+ this.data.length);
		
		},
		onPageTransitionOut:       function(callback) {
			
			this.fadeTo('fast', 0.0, callback);
			
		},
		onPageTransitionIn:        function() {
			$(window).resize();
			var prevPageLink = this.find('a.prev').css('visibility', 'hidden');
			var nextPageLink = this.find('a.next').css('visibility', 'hidden');
			
			// Show appropriate next / prev page links
			if (this.displayedPage > 0)
				prevPageLink.css('visibility', 'visible');

			var lastPage = this.getNumPages() - 1;
			if (this.displayedPage < lastPage)
				nextPageLink.css('visibility', 'visible');
		
			this.fadeTo('fast', 1.0);
		
		}
	});

	/**************** Event handlers for custom next / prev page links **********************/

	gallery.find('a.prev').click(function(e) {
		
		gallery.previousPage();
	
		e.preventDefault();
	});

	gallery.find('a.next').click(function(e) {
		
		gallery.nextPage();
	
		e.preventDefault();
	});

	/****************************************************************************************/

	/**** Functions to support integration of galleriffic with the jquery.history plugin ****/

	// PageLoad function
	// This function is called when:
	// 1. after calling $.historyInit();
	// 2. after calling $.historyLoad();
	// 3. after pushing "Go Back" button of a browser
	function pageload(hash) {
		// alert("pageload: " + hash);
		// hash doesn't contain the first # character.
		if(hash) {
			$.galleriffic.gotoImage(hash);
			//$(window).resize();
		} else {
			gallery.gotoIndex(0);
			//$(window).resize();
		}
	}

	// Initialize history plugin.
	// The callback is called at once by present location.hash. 
	$.historyInit(pageload, "advanced.html");

	// set onlick event for buttons using the jQuery 1.3 live method
	$("a[rel='history']").live('click', function(e) {
		if (e.button != 0) return true;

		var hash = this.href;
		hash = hash.replace(/^.*#/, '');

		// moves to a new page. 
		// pageload is called at once. 
		// hash doesn't contain "#", "?"
		$.historyLoad(hash);

		return false;
	});

	

});
