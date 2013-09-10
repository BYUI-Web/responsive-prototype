var activeIndex = "A_group_box";

function toggleIndex(id) { 
	var f = document.getElementById(activeIndex);
	f.style.display = 'none';
	var e = document.getElementById(id);
	e.style.display = 'block';
	activeIndex = id;	
}
