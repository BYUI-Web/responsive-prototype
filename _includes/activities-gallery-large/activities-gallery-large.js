$(document).ready(function () {
    if (document.querySelector(".gallery-container") !== null) {
        var jTiles = $('.small-tile'); //array of all 'tile' thumbnails
        var leadTile = 0; //the first tile in the row of 4 that is to be displayed

        //initialize the gallery
        displayTiles(leadTile);

        /**
         * Function to display the next four tiles starting at indexOfFirst
         */
        function displayTiles(indexOfFirst) {
            //hide all tiles
            $(".small-tile").hide();
            $('#gallery-caption').hide();

            //if the tiles are visible, but no arrows, show all tiles
            if ($('#thumbnail-container').css('display') == 'block' && $('.gallery-arrow').css('display') == 'none') {
                $('.small-tile').show();
            }

            //display the proper three tiles 
            for (var i = 0; i < jTiles.length; i++) {
                if (i >= indexOfFirst && i < indexOfFirst + 4) {
                    $(".small-tile").eq(i).show();
                }
            }
        }

        //if the right arrow is pressed
        $('#right-arrow').click(function () {
            if (leadTile + 4 < jTiles.length) {
                leadTile++;
                displayTiles(leadTile);
            }
        });

        //if the left arrow is pressed
        $('#left-arrow').click(function () {
            if (leadTile > 0) {
                leadTile--;
                displayTiles(leadTile);
            }
        });

        //when a thumbnail tile is clicked
        $('.small-tile').click(function () {
            $('#main-tile').html($(this).attr('data-value'));

            //check for a caption
            if ($(this).attr('data-value').indexOf("alt=\"") > 0) {
                var description = $(this).attr('data-value').substring($(this).attr('data-value').indexOf("alt=\"") + 5);
                description = description.substring(0, description.indexOf("\""));
                $('#gallery-caption').html(description);
                $('#gallery-caption').show();
            } else {
                $('#gallery-caption').hide();
            }
        });

        /********Code for mobile view of gallery***********/
        //handle view change from medium to large
        enquire.register("screen and (min-width : 992px)", {
            match: function () {
                displayTiles(0);
                leadTile = 0;
            }
        });

        //handle view change from large to medium
        enquire.register("screen and (max-width : 992px)", {
            match: function () {
                $('.small-tile').show();
            }
        });

        $('#right-mobile-arrow').click(function () {
            //if we are not out of bounds to the right
            leadTile = (leadTile + 1 >= jTiles.length) ? 0 : leadTile + 1;

            //show the next image
            $('#main-tile').html($(jTiles[leadTile]).attr('data-value'));
            $('#gallery-caption').hide();
        });

        $('#left-mobile-arrow').click(function () {
            //if we are not out of bounds to the left
            leadTile = (leadTile - 1 < 0) ? jTiles.length - 1 : leadTile - 1;

            //show the next image
            $('#main-tile').html($(jTiles[leadTile]).attr('data-value'));
            $('#gallery-caption').hide();
        });
    }
});