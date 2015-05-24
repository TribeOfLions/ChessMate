//WARNING: this sketch will only run in JavaScript mode

// Dependencies
// Chess.js - exposes Chess pseudoclass
// gameData.js - effectively an interface to Chess.js with PGN data loaded

Board board;// An abstraction of the chess board
InfluenceSimple foo;

int m;// optional used in timed moves..

void setup() {
  // square aspect ration preferred ;)
  size(640, 640);
  smooth();
  
  //Board(Boolean drawBoard, Boolean drawPieces, Hex darkColour, Hex lightColour)
  // board holds position/properties of all tiles  
  board = new Board();
  // but can also be used to render a board if desired
  //  board = new Board(true, true, 0xff990033, 0xffffff33);
  //  m = millis(); // set start time


  /* RENDER OPTION 1
   // grab all played moves into an array and do the work yourself
   //  Array moves = gameData.getReplayedMoves();
   //  int movesLimit = gameData.getAllMovesLength();
   //  
   */

  gameData.resetBoard();
  
  background(#666666);
  foo = new InfluenceSimple(0x33663322, 0x33ddeeff);
  
  /* RENDER OPTION 2
   // Pre-render all moves
   // likely to delay first call to draw()
   // Run in draw instead to give visual feedback of progress
   */
  //  for(int i = 0; i<movesLimit; i++) {
  //    gameData.playMove();
  // do stuff with move data
  //  }
}

void draw() {

  // onlinvoke if board set to display...
  //  board.render();

  /* RENDER OPTION 3
   // Play all game moves at framerate
   // quick and lets people see something is happening (unlike option 2)
   */
  //  gameData.playMove();
  // do stuff with move data

   if(gameData.playMove()) {
    // do stuff with move data   
      foo.updateLayer();
    }
    foo.drawLayer();


  /* RENDER OPTION 4  
   // Play a move every ~quarter-second
   // use for animated visualisations 
   */
//  if (millis() - m >= 250) {
//    if(gameData.playMove()) {
//    // do stuff with move data   
//      foo.updateLayer();
//      m = millis();
//    }
//    foo.drawLayer();
//  }
}

/* RENDER OPTION 5
 // allow user to manually progress through game 
 */
void mousePressed() {
  // gameData.playMove();
  // do stuff with move data
}

