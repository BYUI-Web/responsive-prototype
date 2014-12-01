$(document).ready(function () {
    if (document.querySelector('#inner-nav') !== null) {
        function toggleMenu() {
            //toggle the menu/home text
            $("#rNavHome").find("a").text() == "menu" ? $("#rNavHome").find("a").text("home") : $("#rNavHome").find("a").text("menu");

            //show the links
            if ($("#rNavDivider").css("display") != "none") {
                $("#rNavTriangle").slideToggle(200);
            }
            $("#rNavLinks").slideToggle(200);
        }

        function initializeMenu() {
            //show the menu icon
            $("#menuIcon").show();

            //hide the links
            $("#rNavLinks").hide();
            $("#rNavTriangle").hide();

            //show the menu text
            $("#rNavHome").find("a").text("menu");
        }

        initializeMenu();

        $("#menuIcon").click(function () {
            toggleMenu();
        });
    }
});