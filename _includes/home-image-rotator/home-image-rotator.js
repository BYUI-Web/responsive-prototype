(function () {
    var homeCarousel = document.querySelector("#home-carousel");
    if (homeCarousel) {
        $(".active").css("opacity", 1);

        $(homeCarousel).on("slide.bs.carousel", function (e) {
            var next;
                        
            if (e.direction === "right") {
                next = $(this).find(".active").prev();
                next = (next.length) ? next : $(this).find(".item:last-child");
            } else {
                next = $(this).find(".active").next();
                next = (next.length) ? next : $(this).find(".item:first-child");
            }

            $(next).animate({
                opacity: 1
            }, 500);


            $(this).find(".active").animate({
                opacity: 0
            }, 500);
        });
    }
})();