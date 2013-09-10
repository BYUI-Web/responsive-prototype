var closeAll = false;

$(document).ready(function(){

	$('#multSelect').unbind('click', multiSelect);
	$('#soloSelect').bind('click', soloSelect);
	$('.expandBody').bind('click', expandAll);
	$('.collapseBody').bind('click', collapseAll);
	$('.collapseBody2').bind('click', collapseAll);

	$(".openText").click(function(){
  		if(closeAll){
	  		var thisID = $(this).attr('id');
  			thisID = thisID.slice(0);
  			var listItems = $(".openText");
  			for (var i = 0; i < listItems.length; ++i)
  			{
  				if($(listItems).eq(i).attr('id').slice(0) != thisID)
  				{
	  				$(listItems).eq(i).next().slideUp("normal");
	  				var marker = $(listItems).eq(i).children();
					marker.eq(0).removeClass("negMark ");
					marker.eq(0).addClass("posMark");
	  			}
  			}
  		}
  		$(this).next().slideToggle("normal");
  		
  		var marker = $(this).children().eq(0);
  		if( marker.attr('class') === "negMark")
  		{
  			marker.removeClass("negMark");
  			marker.addClass("posMark");
  		}
  		else
  		{
  			marker.removeClass("posMark");
  			marker.addClass("negMark");
  		}
	});
	
	$(".OpenNav").click(function(){
  		var thisID = $(this).children().eq(0).attr('id');
  		thisID = thisID.slice(0);
  		var trgt = "#ID" + thisID;
  		$(trgt).next().show();
  		var marker = $((trgt)).children().eq(0);
		marker.removeClass("posMark");
		marker.addClass("negMark");
	});
});

function multiSelect ()
{
	$('#multSelect').unbind('click', multiSelect);
	$('#soloSelect').removeClass('inActiveView');
		$('#listTopNav').slideDown("normal");
		$('#multi').toggle();
		$('#single').toggle();
		closeAll = false;
	$('#multSelect').addClass('inActiveView');
	$('#soloSelect').bind('click', soloSelect);
}

function soloSelect ()
{
	$('#soloSelect').unbind('click', soloSelect);
		$('#multSelect').removeClass('inActiveView');
			$('#listTopNav').slideUp("normal");
			collapseAll ();
			$('#multi').toggle();
			$('#single').toggle();
  			closeAll = true;
		$('#soloSelect').addClass('inActiveView');
	$('#multSelect').bind('click', multiSelect);
}

function collapseAll ()
{
	$('.hiddenText').slideUp("normal");
	var marker = $(".negMark");
	marker.removeClass("negMark");
	marker.addClass("posMark");
}

function expandAll ()
{
	$('.hiddenText').slideDown("normal");
	var marker = $(".posMark");
	marker.removeClass("posMark");
	marker.addClass("negMark");
}