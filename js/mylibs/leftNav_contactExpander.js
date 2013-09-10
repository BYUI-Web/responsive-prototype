/***************** LEFT NAV CONTACT INFO EXPANDER ************************/
var selectedContact = "";
function expandContact(contact){
	var element = document.getElementById(contact);
	var currElement = document.getElementById(selectedContact);
	if(selectedContact != ""){   	
		if(selectedContact == contact){
			element.style.height="24px";
			selectedContact = "";
		}
		else {
			element.style.height="auto";
			currElement.style.height="24px";
			selectedContact = contact;
		}
	}
	else {
		element.style.height="auto";
		selectedContact = contact;
	}
}
var isExpanded = false;
function expandEventsList(){
	var element = document.getElementById("exbanding_bar");
	var eventList = document.getElementById("e_list")
	if(isExpanded == false){
		eventList.style.height="auto";
		element.style.backgroundPosition="0px -14px";
		isExpanded = true;
	}
	else {
		eventList.style.height="280px";
		element.style.backgroundPosition="0px 0px";
		isExpanded = false;
	}
}
/***************** END LEFT NAV CONTACT INFO EXPANDER ************************/