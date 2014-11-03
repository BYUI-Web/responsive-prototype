(function () {
    var nav = document.querySelector(".department-nav"),
        state = false;
    
    if (nav) {
        var more = nav.querySelector(".department-nav__more");
        
        showMore();
        
        more.addEventListener("click", function (e) {
            Array.prototype.forEach.call(document.querySelectorAll(".next-line"), function (element) {
                element.style.display = (state) ? "none" : "block";
            });
            nav.style.height = (state) ? "50px" : "auto";
            state = !state;
            e.preventDefault();
        });
        
        window.addEventListener("resize", showMore);
    }

    function showMore() {
        var moreThanOneLine = hasMoreThanOneLine();

        if (moreThanOneLine) {
            $(nav).addClass("department-nav--more-lines");
        } else {
            $(nav).removeClass("department-nav--more-lines");
        }



    }

    function hasMoreThanOneLine() {
        var navItems = nav.querySelectorAll(".navbar-collapse li"),
            numItems = navItems.length,
            moreThanOneLine = false;
        
        $(navItems).removeClass("next-line").css("display", "");
        for (var i = 0; i < numItems; i++) {
            moreThanOneLine = moreThanOneLine || navItems[i].offsetTop > 0;
            if (moreThanOneLine) {
                $(navItems[i]).addClass("next-line");
            }
        }
        nav.style.height = "50px";
        state = false;

        return moreThanOneLine;
    }
})();