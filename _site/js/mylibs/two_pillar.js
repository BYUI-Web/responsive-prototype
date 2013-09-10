$(document).ready(function() {

	//left and right positions for white arrow pointer
	var leftPosition = "179px";
	var centerPosition = "380px";
	var rightPosition = "575px";


	//Functions for activating and deactivating columns
	function leftActive() {
		//$("#right_pillar").hover();
		$("#right_pillar").removeClass("active_pillar");                   /* remove right pillar's active class */
		$('#left_pillar').addClass("active_pillar");                       /* add left pillar's active class */
	    $('#white_directional_arrow').css({'marginLeft': leftPosition});   /* move white arrow to left position */
	}
	function rightActive() {
		//$("#left_pillar").hover();
		$("#left_pillar").removeClass("active_pillar");                    /* remove left pillar's active class */
		$('#right_pillar').addClass("active_pillar");                      /* add right column's active class */
	    $('#white_directional_arrow').css({'marginLeft': rightPosition});  /* move white arrow to right position */
	}
	function deactivatePillars() {
		$('.pillars').removeClass("active_pillar");                        /* remove all pillar's active classes */
		$('#white_directional_arrow').css({'marginLeft': centerPosition}); /* move white arrow to center (idle) position */
	}


	//Detect left or right pillar incoming #link from URL
	if(/#LeftDisplay/.test(self.location.href)){
            //console.log("your url contains the name #LeftDisplay");
            leftActive();
        }
    if(/#RightDisplay/.test(self.location.href)){
            //console.log("your url contains the name #RightDisplay");
            rightActive();
        }


    //Add active class to pillar on hover, deactivate when exiting pillar hover
	$(".pillars").hover(
	  function () {
	    $(this).addClass("active_pillar");
	  },
	  function () {
	  	deactivatePillars();
	  }
	);

	$("#left_pillar").hover(
	  function () {
	  	leftActive();
	  },
	  function () {
	  	deactivatePillars();
	  }
	);

	$("#right_pillar").hover(
	  function () {
	  	rightActive();
	  },
	  function () {
	  	deactivatePillars();
	  }
	);

});













