
//  Coming Event Scroll Bar 

$(document).ready(function() {
	var number_cells = $("#events_bar_horizontal #pane .single_event").length;
	if (number_cells > 0) {
		var buttonSpeed = 800;
		var cycleSpeed = 5000;
		var i = 1;
		var window_width = $("#events_bar_horizontal #window").width();
		var cell_width = $("#events_bar_horizontal #pane .single_event").width();
		var cells_in_row = Math.floor(window_width / cell_width);
		var rows = Math.ceil(number_cells / cells_in_row);
		var row_height = $('#events_bar_horizontal #window').css('height').slice(0, -2);
		var new_cell_width = (window_width - 43) / cells_in_row;
		$('#events_bar_horizontal .single_event').css('width', new_cell_width);
		var new_info_width = new_cell_width - 63;
		$('#events_bar_horizontal .event_info').css('width', new_info_width);

		$("#events_bar_horizontal .prev").click(function(){
			if (i > 1) {
				$("#events_bar_horizontal #pane").animate({top: "+=" + row_height + "px"}, buttonSpeed);
				--i;
			} else {
				$("#events_bar_horizontal #pane").animate({top: row_height * (rows - 1) * -1}, buttonSpeed * (rows/2));
				i = rows;
 			}
		});

		$("#events_bar_horizontal .next").click(function(){
			nextItems();
		});
		
		function nextItems() {
			if (i < rows) {
				$("#events_bar_horizontal #pane").animate({top: "-=" + row_height + "px"}, buttonSpeed);
				++i;
			} else {
				$("#events_bar_horizontal #pane").animate({top: 0}, buttonSpeed * (rows/2));
				i = 1;
			}
		}
		
		var cycleItems = setInterval(nextItems, cycleSpeed);

		$("#window").hover(function() {
			clearInterval(cycleItems);
		},
		function() {
			cycleItems = setInterval(nextItems, cycleSpeed);
		});
	}
});
