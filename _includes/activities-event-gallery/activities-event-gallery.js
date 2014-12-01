    $(document).ready(function () {

        if (document.querySelector('#activities-gallery') !== null) {

            var leadTile = 0; //index of the first tile in the set of three displayed.
            var jMobileTiles = $(".smallTile:not(.blank-tile)"); //array of all real tiles
            var jTiles = $(".smallTile"); //array of all tiles
            var mobileTileIndex = 0;

            function displayTiles(indexOfFirst) {
                //hide all tiles
                $(".smallTile").hide()

                //display the proper three tiles 
                for (var i = 0; i < jTiles.length; i++) {
                    if (i >= indexOfFirst && i < indexOfFirst + 3) {
                        $(".smallTile").eq(i).show();
                    }
                }
            }

            //hide all tiles after the first three
            displayTiles(leadTile);

            //when the right arrow is clicked
            $("#rightArrow").click(function () {
                if (leadTile + 3 < jTiles.length) {
                    leadTile += 3;
                }

                displayTiles(leadTile);
            });

            //when the left arrow is clicked
            $("#leftArrow").click(function () {
                if (leadTile >= 3) {
                    leadTile -= 3;
                }

                displayTiles(leadTile);
            });

            //when small a small tile is clicked, display the it in the main tile
            $(".smallTile").click(function () {
                //make the dark border of the selected tile lighter
                $(".selected").removeClass("selected");

                //make the newly selected tile's border darker
                $(this).addClass("selected");

                $("#mainTile").html($(this).find("#tileContent").html());
            });

            //when the right mobile arrow is clicked
            $("#right-mobile-arrow").click(function () {
                //if the index is out of bounds to the right,
                if (mobileTileIndex >= jMobileTiles.length - 1) {
                    mobileTileIndex = 0;
                } else {
                    mobileTileIndex++;
                }

                $("#mainTile").html($(jMobileTiles[mobileTileIndex]).find("#tileContent").html());
            });

            //when the right mobile arrow is clicked
            $("#left-mobile-arrow").click(function () {
                //if the index is out of bounds to the left,
                if (mobileTileIndex == 0) {
                    //loop back to the last image
                    mobileTileIndex = jMobileTiles.length - 1;
                } else {
                    mobileTileIndex--;
                }

                $("#mainTile").html($(jMobileTiles[mobileTileIndex]).find("#tileContent").html());
            });

        }
    });