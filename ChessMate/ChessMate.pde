 //WARNING: this sketch will only run in JavaScript mode

// - - - Dependencies
// Chess.js - exposes Chess pseudoclass
// gameData.js - effectively an interface to Chess.js with PGN data loaded

Board board;// An abstraction of the chess board
InfluenceSimple foo;// A demo visualisation

int m;// optional used in timed moves..

void setup() {
  // square aspect ration preferred ;)
  size(640, 640);
  
  // board holds position/properties of all tiles  
  board = new Board(width/40);
  // ...but can also be used to render a board if desired:
  // Board(Boolean drawBoard, Boolean drawPieces, Hex darkColour, Hex lightColour)
  // board = new Board(true, true, 0xff990033, 0xffffff33);
  // m = millis(); // set start time


  /* OPTION 1
     grab all played moves into an array and do the work yourself
  */
   // Array moves = gameData.getReplayedMoves();


  // resets pieces to standard start position  
  gameData.resetBoard();
  
  background(#666666);
  
  // demo visualisation
  foo = new InfluenceSimple(0x33663322, 0x33ddeeff);
  
  /* OPTION 2
   Pre-render all moves 
   Likely to delay first call to draw()
   Option 3 probably a better choice
   */
  /*
    for(int i = 0; i<movesLimit; i++) {
      gameData.playMove();
      // do stuff with move data
    }
   */
}

void draw() {

  // only invoke if board set to display...
//    board.render();

  /* OPTION 3
     Play all game moves at framerate
   */
  //  gameData.playMove();
  // do stuff with move data

  // Wrapped in a condition here to stop
  // further processing of image once game
  // is complete
   if(gameData.playMove()) {
      // do stuff with move data   
      foo.updateLayer();
    }
    foo.drawLayer();


  /* OPTION 4  
     Play a move every ~quarter-second
     Use for animated visualisations 
   */
   /*
  if (millis() - m >= 250) {
    // again a condition has been added to stop processing once game completes
    if(gameData.playMove()) {
    // do stuff with move data   
      foo.updateLayer();
      m = millis();
    }
    foo.drawLayer();
  }
  */
}

/* OPTION 5
 allow user to manually progress through game 
 */
void mousePressed() {
  // gameData.playMove();
  // do stuff with move data
}

