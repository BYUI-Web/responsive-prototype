(function () {
    var nav = document.querySelector(".department-nav"),
        state = false;

    if (nav) {
        var more = nav.querySelector(".department-nav__more"),
            moreThanOneLine = hasMoreThanOneLine();

        if (moreThanOneLine) {
            nav.className += " department-nav--more-lines";
        }

        more.addEventListener("click", function (e) {
            Array.prototype.forEach.call(document.querySelectorAll(".next-line"), function(element) {
               element.style.display = (state) ? "none" : "block"; 
            });
            nav.style.maxHeight = (state) ? "50px" : "300px";
            state = !state;
            e.preventDefault();
        });

    }

    function hasMoreThanOneLine() {
        var navItems = nav.querySelectorAll(".navbar-collapse li"),
            numItems = navItems.length,
            moreThanOneLine = false;

        for (var i = 0; i < numItems; i++) {
            moreThanOneLine = moreThanOneLine || navItems[i].offsetTop > 0;
            if (moreThanOneLine) {
                navItems[i].className += " next-line";
            }
        }

        return moreThanOneLine;
    }
})();