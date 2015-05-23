//WARNING: this sketch will only run in JavaScript mode

// Dependencies
// Chess.js - exposes Chess pseudoclass
// gameData.js - effectively an interface to Chess.js with PGN data loaded

Board board;// An abstraction of the chess board

// In order to make this more flexible it may be necessary
// to subclass all effects from a parent class.
// the parent would define a common interface for interacting
// with the other components of the sketch..
//Trail[] trails; // Trail: class for patterns based on game moves
//TrailDust[] dust = new TrailDust[3222]; // TrailDust: class for background specks

int m;// optional used in timed moves..

void setup() {
  //The Board class now allows you to set any resolution you like
  // ideally it should be square!
  size(640, 640);
  smooth();

//Board(Boolean drawBoard, Boolean drawPieces)
  board = new Board(true, true); // board holds position/properties of all tiles
  
  m = millis(); // set start time
  
  // Get all played moves from PGN file :)
// MOVE RENDER OPTION 1
// grab all played moves into an array and do the work yourself
//  Array moves = gameData.getReplayedMoves();
//  int movesLimit = gameData.getAllMovesLength();
  gameData.resetBoard();
  
  //TODO: generation of effects should happen elsewhere
  // so that these can be made optional
  /*
  trails = new Trail[movesLimit];

  for (int i=0; i<movesLimit; i++) {
      Object move = moves[i];
      String from = move.from;
      String to = move.to;
      String pieceColour = move["color"];
      int pieceColourAsInt = pieceColour.equals("w") ? 1 : 0;

      trails[i] = new Trail(from, to, pieceColourAsInt);
      
  }


  // random background specks (TrailDust)
  for (int i = 0; i < dust.length; i++) {
    float x3 = random(width);
    float y3 = random(height);
    dust[i] = new TrailDust(x3, y3);
  }

  for (int j = 0; j < trails.length; j++) {
    trails[j].coords();
  }
  */
  
  // MOVE RENDER OPTION 2
  // Pre-render all moves
  // likely to delay first call to draw()
  // Run in draw instead to give visual feedback of progress
//  for(int i = 0; i<movesLimit; i++) {
//    gameData.playMove();
      // do stuff with move data
//  }

}

void draw() {
  background(120,166,120);

  board.render();
  
  // Initiating TrailDust (background)
  /*
  for (int i = 0; i < dust.length; i++) {
    dust[i].move();
    dust[i].display();
  }

  // Initiating marktrail (abstract animations)
  for (int j = 0; j < trails.length; j++) {
    trails[j].marktrail();
  }
*/

  // MOVE RENDER OPTION 3
  // Play all game moves at framerate
  // quick and lets people see something is happening (unlike option 2)
//  gameData.playMove();
    // do stuff with move data

  // MOVE RENDER OPTION 4  
  // Play a move every ~quarter-second
  // use for animated visualisations 
  if(millis() - m >= 250) {
   gameData.playMove();
   // do stuff with move data
    m = millis();
  } 

}

// MOVE RENDER OPTION 5
// allow user to manually progress through game 
void mousePressed() {
  // gameData.playMove();
  // do stuff with move data
}


