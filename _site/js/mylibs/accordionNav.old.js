/**
 *	Name: open_accordion
 *  Desc:
 *  Comparing the id "breadcrumbs" <a/ href > URLs with the id "accordion_structure" URL's and opening
 *    the accordion where the URL's match for each level in the accordion.
 *	id tags --> varible name:
 *    breadcrumbs          -->  bc_links     The varrable containing array of URLs from highest to lowest accordion levels
 *    accordion_structure  -->  accr_links   The varrable transending the accordion array levels
 */
$(window).load(function()
{
	if (document.getElementById('breadcrumbs') && document.getElementById('left_nav'))
	{
		var bc_links = document.getElementById('breadcrumbs').getElementsByTagName('a');
		var accr_links = document.getElementById('accordion_structure').getElementsByTagName('a');

		for (var i = 1; i < bc_links.length; i++)
		{
			for (var j = 0; j < accr_links.length; j++)
			{
			    if ((bc_links[i].getAttribute("href") === accr_links[j].getAttribute("href")) && accr_links[j].parentNode.nextSibling.innerHTML === "+")
				{
					accr_links[j].parentNode.nextSibling.innerHTML = "&ndash;";
					var accrlist = accr_links[j].parentNode.parentNode;
					accrlist = accrlist.getElementsByTagName('ul');
					accrlist[0].style.cssText = 'display: block;';
					i++;
				}
			}
		}
	}
});



$(document).ready(function(){
   
  $(".expander").next().each(function(){
    $(this).css("display", "none");
  });
  $(".expander").click(function(){
    $(this).next().slideToggle("normal");
    if($(this).html() == "+"){
      $(this).html("&ndash;");
    }else{
      $(this).html("+");
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
	
});