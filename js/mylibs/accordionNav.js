/**
 *	Name: open_accordion
 *  Desc:
 *  Comparing the id "breadcrumbs" <a/ href > URLs with the id "accordion_structure" URL's and opening
 *    the accordion where the URL's match for each level in the accordion.
 *	id tags --> varible name:
 *    breadcrumbs          -->  bc_links     The varrable containing array of URLs from highest to lowest accordion levels
 *    accordion_structure  -->  accr_links   The varrable transending the accordion array levels
 */


$(document).ready(function(){
   
  $(".expander").next().each(function(){
    $(this).css("display", "none");
  });
  $(".expander").click(function(){
    $(this).next().slideToggle("normal");
    if($(this).html() == "+"){
      $(this).html("&ndash;").toggleClass("open");
    }else{
      $(this).html("+").toggleClass("open");
    }
  });
	$(".expand").click(function(){ 
	  $(".accordion ul").slideDown("normal");
	  $("span.expander").html("&ndash;"); 
	}); // show all functionality
	$(".collapse").click(function(){ 
	  $(".accordion ul").slideUp("normal"); 
	  $("span.expander").html("+");
	}); // hide all functionality


	open_accordion ();
});

function open_accordion () {

	if ($('#breadcrumbs') && $('.accordion'))
	{
		var bc_links = $('#breadcrumbs a');
		var accr_links = $('.accordion a');
		var bc_href;
		var accr_href;
		for (var i = 1; i < bc_links.length; i++)
		{
			for (var j = 0; j < accr_links.length; j++)
			{
				bc_href = bc_links.eq(i).attr("href");
				accr_href = accr_links.eq(j).attr("href");
			    if (bc_href == accr_href)
				{
					if (i == bc_links.length - 1)
					{
						accr_links.eq(j).parent().addClass('active_page');
					}
					if (accr_links.eq(j).next().attr("class") == 'expander')
					{
					 	accr_links.eq(j).next().html("&ndash;");
					 	accr_links.eq(j).next().addClass("open");
					 	accr_links.eq(j).next().next().slideDown("normal");
					}

				 	i++;

				}
			}
		}
	}
}




