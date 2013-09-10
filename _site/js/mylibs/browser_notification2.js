/*******************************************************************/
/*                                                                 */
/*    Name:    Legacy / Compatibility Mode Browser Notification    */
/*                                                                 */
/*    Author:  Jakob Anderson                                      */
/*             http://www.jakobanderson.com                        */
/*             fictionisfiction@gmail.com / and08073@byui.edu      */
/*                                                                 */
/*    Purpose: Test whether browser is modern, legacy              */
/*             or has IE compatibility mode turned on              */
/*             and then issues a notification with a solution      */
/*             for each case.                                      */
/*             Also sets a session cookie to control how often     */
/*             the users should be reminded, default to once       */
/*             per session.                                        */
/*                                                                 */
/*******************************************************************/

/*******************************************************************/
/*                                                                 */
/*                          COOKIE PROCESS                         */
/*                                                                 */
/*******************************************************************/

// Check for the notification cookie and determine whether another notification should appear
// If cookie isn't found, run the notification script. If browser fails baseline tests, save a new cookie on the browser when done.

/*************************** BEGIN CODE ***************************/

// instantiate cookie variables
var cookie_found = false;
var cookie_made = false;

(function($) {
    $.cookie = function(key, value, options) {

        // key and at least value given, set cookie...
        if (arguments.length > 1 && (!/Object/.test(Object.prototype.toString.call(value)) || value === null || value === undefined)) {
            options = $.extend({}, options);

            if (value === null || value === undefined) {
                options.expires = -1;
            }

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setDate(t.getDate() + days);
            }

            value = String(value);

            return (document.cookie = [
                encodeURIComponent(key), '=', options.raw ? value : encodeURIComponent(value),
                options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
                options.path    ? '; path=' + options.path : '',
                options.domain  ? '; domain=' + options.domain : '',
                options.secure  ? '; secure' : ''
            ].join(''));
        }

        // key and possibly options given, get cookie...
        options = value || {};
        var decode = options.raw ? function(s) { return s; } : decodeURIComponent;

        var pairs = document.cookie.split('; ');
        for (var i = 0, pair; pair = pairs[i] && pairs[i].split('='); i++) {
            if (decode(pair[0]) === key) return decode(pair[1] || ''); // IE saves cookies with empty string as "c; ", e.g. without "=" as opposed to EOMB, thus pair[1] may be undefined
        }
        return null;
    };
})(jQuery);

function checkCookie() {
	// If no cookie "browser_validation_notified" found
	if ($.cookie('browser_validation_notified') ) {
		cookie_found = true;
		//console.log("cookie browser_validation_notified found");
		return cookie_found;
	} else {
		cookie_found = false;
		return cookie_found;
	}
}

function setCookie() {
	cookie_made = 'true';
	// If no cookie "browser_validation_notified" found
	$.cookie('browser_validation_notified', 'true');
	return cookie_made;
}

/*******************************************************************/
/*                                                                 */
/*             BROWSER DETECTION / NOTIFICATION PROCESS            */
/*                                                                 */
/*******************************************************************/

// Use JQuery.browser to test whether IE compatibility mode is turned on in IE9+
// Use jQuery.support and Modernizr.js to determine baseline feature support, then write values to an array
// Use Jquery to write browser data to the notification div, then show it to those browsers who 
// drop below our baseline of browser/feature support, including instructions for possible solution paths.
// Feature detection, rather than browser sniffing or user agent detection is preferred standard these days (for accuracy and consistency [Feb. 2012]).

/*************************** BEGIN CODE ***************************/

function browserDetectNotify() {
	
	// Initialize vars:

	// Message array
	var message_legacy = '';
	var message_solution = '';

	/****************************************************************************/

	// Quirks mode detection not working [02.07.2012 - Jakob Anderson]
	// if (jQuery.support.boxModel != 'true') {
	// 	message_legacy = 'maybe?';
	// 	message_solution = quirks_solution;
	// 	//report to console for testing
	// 	console.log('legacy: ' + message_legacy);
	// 	console.log('solution: ' + message_solution);
	// }

	// Use jQuery.support and Modernizr.js to determine feature support
	// Run Modernizr first, because IE9 can give false positives on feature support when in compat. mode
	// And because compat. mode can sometimes be found on a subset of non-legacy browsers (IE9)
	if ( (Modernizr.fontface && Modernizr.canvas ) ) { /* remove "!" for deployment */
	    // script to run if test returns true
		//report to console for testing
		//console.log('modernizr: Is a valid browser / not legacy browser. Passed all: "fontface && canvas"');
	} else {
	    // script to run if baseline features are not supported
	    message_legacy = 'true';
		message_solution = 'legacy_solution';
		//report to console for testing
		//console.log('modernizr: Not a valid browser / is legacy browser, Failed one or more: "fontface && canvas"');
	}

	// JQuery.browser test for IE9+ compatibility mode
	// Test browser type and rendering engine version to determine whether it's 
	// IE9+ with compatibility mode on lying to us, saying that it is ie7

	// If browser user-agent registers as less than IE 9
	if ( ($.browser.msie) && ($.browser.version < '9.0') ){
		if(navigator.userAgent.indexOf("Trident/5")>-1) {
			message_legacy = 'false';
			message_solution = 'ie_compat_solution';
			//report to console for testing
			//console.log('ie 9 legacy: ' + message_legacy);
			//console.log('ie, but not legacy browser');
		}
		else {
			message_legacy = 'true';
			message_solution = 'legacy_solution';
			//report to console for testing
			//console.log('ie legacy: ' + message_legacy);
		}
	}

	var browser_valid = '';
	// If browser has failed the baseline tests, show notification
	if ( (message_legacy != '') && (message_solution != '') ) {
		
		if (message_solution == 'ie_compat_solution') {
			//console.log('message_solution: ' + message_solution);
			$('#compat_message').css('display', 'block');
		} else {
			//console.log('message_solution: ' + message_solution);
			$('#legacy_message').css('display', 'block');
		}

		$('#legacy_browser_notification').slideDown("slow");
		$(".close_button").click(function () {
	      $('#legacy_browser_notification').slideUp("slow");
	    });
	    browser_valid = 'false';
	} else {
		browser_valid = 'true';
	}
	return browser_valid;
	//console.log('at end of detection js');
	
}/* END browserDetectNotify() */



// Checks for existing notification cookie. If none is found, 
// runs entire "Legacy / Compatibility Mode Browser Notification" script
// Note: the call for browserDetectNotify() is embedded inside the checkCookie function, because of a dependency. 

$(window).load(function() {

    //console.log('Begin window.load');

    var checkCookie = window.checkCookie();
    //console.log('ran checkCookie(), returned ' + checkCookie);

    if (checkCookie == true){
    	
    	// found the cookie, kill validation and cookie process
    	//console.log('found cookie, killing process');

    } else {

    	// cookie not found
    	//console.log('cookie_found == false, running browserDetectNotify()')
    	
    	// since no cookie was found, run browserDetectNotify() to validate browsers
    	var browserDetectNotify = window.browserDetectNotify();
    	//console.log('ran browserDetectNotify(), returned ' + browserDetectNotify);
	    
	    // returns whether browser is valid or not	
    	if (browserDetectNotify == 'true') {
	    	// If validation shows that the browser passed the baseline features/settings test, 
	    	// notification will not have been shown
	    	//console.log('browser_valid == true, modern browser detected, killing process');
    	} else {
	    	// Validation showed that the browser is not valid, already ran the notification, 
	    	// and now will set a cookie to prevent the notification from showing until the cookie expires.
	    	var setCookie = window.setCookie();
	    	//console.log('ran setCookie(), returned ' + setCookie);

	    	// Return whether cookie was set or not
	    	if (setCookie == 'true') {
	    		//console.log('cookie has been set');
	    	} else {
	    		//console.log('cookie has not been set, something is messed up.');
	    	}
	    }

    }
	//console.log('end of window.load, after checkCookie, browserDetectNotify() and setCookie');
});












