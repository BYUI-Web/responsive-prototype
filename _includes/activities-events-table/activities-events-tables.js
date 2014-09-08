$(document).ready(function () {
    $(".eventRow").click(function () {
        //make sure there is something to expand
        if ($(this).find("div.dCircle").length > 0) {
            return;
        }

        //collapse or expand the div
        var collapsed = $(this).find("div.eventDescription").html();

        if (collapsed.indexOf("...") > 0) {
            collapsed = collapsed.replace("...", "");
        } else {
            collapsed += "...";
        }

        $(this).find("div.eventDescription").html(collapsed);

        //collapse or expand the div
        $(this).find("div.collapsed-text").slideToggle("medium");

        //toggle the class
        var sign = $(this).find("div.circle").find("div.sign");

        if (sign.attr("class") == "sign collapsed") {
            sign.attr("class", "sign expanded");
            sign.html("-");
        } else {
            sign.attr("class", "sign collapsed");
            sign.html("+");
        }
    });
});