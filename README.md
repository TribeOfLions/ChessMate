# ChessMate
ChessMate transforms chess games into digital art | powered by Processing

See  [kaleido.rocks](http://www.kaleido.rocks/ChessMate/) for further details.


## Dependencies

* Built in [Processing](https://processing.org/)
*  [Processing.js](http://processingjs.org/)
* [chess.js](https://github.com/jhlywa/chess.js/blob/master/README.md)


## Usage
At the present time PGN files are manually added to gameData.js.  This then parses the data (using chess.js) and exposes methods to work through the game moves.  The Board class keeps track of piece location vian abstractionof the chess board.  You can hook into this and pull out piece locations etc to generate a visualisation.

When a Board is instantiated the board state is set to the end of the game in the PGN data. Call `gameData.resetBoard()` to set it back to the starting position and then `gameData.playMove()` to play each turn.  This returns true if here are still moves to be played.

`Influence_simple` is an example visualisation: for each turn it checks all tiles for a piece and, if a piece is present, draws a semi-transparent rectangle on a separate image layer at the location of that tile.  The image layer is faded out after each rendering.  The 'influence' of each player is then mapped out as the game progresses leading to a unique image at the end of the game.  This is a proof of concept for a more complex - but similar in style - visualisation.

## TODO
* Some moves are not yet handled by the Board class; notably Queen side castle, en passant and pawn promotion
* Mechanism for feeding in a PGN file through the web
* saving of images to the server