var allTutorials = false;
var allElements = false;
var allComponents = false;
var allPageTypes = false;

$(document).ready(function(){ 
	
	//Reset Vars to starting
	function resetVars(){
		allTutorials = false;
		allElements = false;
		allComponents = false;
		allPageTypes = false;
		$('.active').each(function(){
			$(this).removeClass('active');
		});
	}
	//Close all and reset windows
	function closeWindows(all){
		resetVars();
		$('#allTutorials, #allElements, #allComponents, #allPageTypes').hide();
		if(all){
			$('#trainingMain').show();
		} else {
			$('#trainingMain').hide();
		}
	}
		
	// Reset click
	$('span.close_area').click(function(){
		closeWindows(true);	
	});
	// Pagetype click
	$('#control_region #pageTypes h3').click(function(){
		if(!allPageTypes){
			closeWindows(false);
			$('#allPageTypes').show();
			allPageTypes = true;
			$(this).addClass('active');
		} else {
			closeWindows(true);
		}
	});
	// Component click
	$('#control_region #components h3').click(function(){
		if(!allComponents){
			closeWindows(false);
			$('#allComponents').show();
			allComponents = true;
			$(this).addClass('active');
		} else {
			closeWindows(true);
		}
	});
	// Elements click
	$('#control_region #elements h3').click(function(){
		if(!allElements){
			closeWindows(false);
			$('#allElements').show();
			allElements = true;
			$(this).addClass('active');
		} else {
			closeWindows(true);
		}
	});
	// Tutorial click
	$('#control_region #relatedTutorials h3').click(function(){
		if(!allTutorials){
			closeWindows(false);
			$('#allTutorials').show();
			allTutorials = true;
			$(this).addClass('active');
		} else {
			closeWindows(true);
		}
	});
});