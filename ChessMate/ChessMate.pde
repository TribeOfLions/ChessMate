// An abstraction of the chess board
Board board;

Trail[] trails = new Trail[63]; // Trail: class for patterns based on game moves
TrailDust[] dust = new TrailDust[3222]; // TrailDust: class for background specks


void setup() {
  //The Board class now allows you to set any resolution you like
  // ideally it should be square!
  size(640, 640);
  smooth();
  background(234); // background color

  board = new Board(); // board holds position/properties of all tiles
  board.render(15, false); // but can also be drawn :)

  // random background specks (TrailDust)
  for (int i = 0; i < dust.length; i++) {
    float x3 = random(width);
    float y3 = random(height);
    dust[i] = new TrailDust(x3, y3);
  }

  // [Simplified] Long Algebraic Notation of Chess moves
  // Populating trails array
  // Joshua Waitzkin vs Edward A Frumkin

  // Note change to parameter types: String used as key to Tile properties
  //TODO: store game in a generic format which can then be parsed
  // and applied more flexibly: i.e. to a range of display methods
  //TODO: ideally parse PGN data files directly
  trails[0] = new Trail("e2", "e4", 1);
  trails[1] = new Trail("c7", "c5", 0);
  trails[2] = new Trail("g1", "f3", 1);
  trails[3] = new Trail("e7", "e6", 0);
  trails[4] = new Trail("d2", "d4", 1);
  trails[5] = new Trail("c5", "d4", 0);
  trails[6] = new Trail("f3", "d4", 1);
  trails[7] = new Trail("g8", "f6", 0);
  trails[8] = new Trail("b1", "c3", 1);
  trails[9] = new Trail("b8", "c6", 0);
  trails[10] = new Trail("c1", "e3", 1);
  trails[11] = new Trail("f8", "b4", 0);
  trails[12] = new Trail("f2", "f3", 1);
  trails[13] = new Trail("d7", "d5", 0);
  trails[14] = new Trail("f1", "b5", 1);
  trails[15] = new Trail("c8", "d7", 0);
  trails[16] = new Trail("b5", "c6", 1);
  trails[17] = new Trail("b7", "c6", 0);
  trails[18] = new Trail("e4", "e5", 1);
  trails[19] = new Trail("f6", "g8", 0);
  trails[20] = new Trail("a2", "a3", 1);
  trails[21] = new Trail("b4", "a5", 0);
  trails[22] = new Trail("b2", "b4", 1);
  trails[23] = new Trail("a5", "c7", 0);
  trails[24] = new Trail("f3", "f4", 1);
  trails[25] = new Trail("g8", "e7", 0);
  trails[26] = new Trail("c3", "a4", 1);
  trails[27] = new Trail("e8", "g8", 0);
  trails[28] = new Trail("h8", "f8", 0);
  trails[29] = new Trail("a4", "c5", 1);
  trails[30] = new Trail("a7", "a5", 0);
  trails[31] = new Trail("c2", "c3", 1);
  trails[32] = new Trail("e7", "c8", 0);
  trails[33] = new Trail("e1", "g1", 1);
  trails[34] = new Trail("h8", "f8", 1);
  trails[35] = new Trail("c8", "b6", 0);
  trails[36] = new Trail("d1", "g4", 1);
  trails[37] = new Trail("b6", "c4", 0);
  trails[38] = new Trail("e3", "f2", 1);
  trails[39] = new Trail("d8", "e8", 0);
  trails[40] = new Trail("f1", "e1", 1);
  trails[41] = new Trail("d7", "c8", 0);
  trails[42] = new Trail("f2", "h4", 1);
  trails[43] = new Trail("g8", "h8", 0);
  trails[44] = new Trail("a3", "a4", 1);
  trails[45] = new Trail("c7", "b6", 0);
  trails[46] = new Trail("a1", "d1", 1);
  trails[47] = new Trail("b6", "c5", 0);
  trails[48] = new Trail("b4", "c5", 1);
  trails[49] = new Trail("c4", "b2", 0);
  trails[50] = new Trail("e1", "e3", 1);
  trails[51] = new Trail("b2", "d1", 0);
  trails[52] = new Trail("g4", "g7", 1);
  trails[53] = new Trail("h8", "g7", 0);
  trails[54] = new Trail("h4", "f6", 1);
  trails[55] = new Trail("g7", "g6", 0);
  trails[56] = new Trail("e3", "g3", 1);
  trails[57] = new Trail("g6", "h6", 0);
  trails[58] = new Trail("f6", "g7", 1);
  trails[59] = new Trail("h6", "h5", 0);
  trails[60] = new Trail("g3", "g5", 1);
  trails[61] = new Trail("h5", "h4", 0);
  trails[62] = new Trail("d4", "f3", 1);

  /* NB: trails || above
    >each move in the Chess game is an array element
    >white = 1 | black = 0
    >if 1 or 0 appears twice in a row then castling is occurring
  */

  /* NB: .coords(); || below
    .coords() method sets up trails array in Trail class
    animations are ready to be drawn
  */

  for (int j = 0; j < trails.length; j++) {
    trails[j].coords();
  }

}

void draw() {

  // Initiating TrailDust (background)
  /* NB: .move(); .display(); || below
    .move() and .display() methods animate specks
    these functions are written in TrailDust class
  */

  for (int i = 0; i < dust.length; i++) {
    dust[i].move();
    dust[i].display();
  }

  // Initiating marktrail (abstract animations)
  /* NB: .marktrail(); || below
    .marktrail() method runs move animations
    animation functions are written in Trail class
  */

  for (int j = 0; j < trails.length; j++) {
    trails[j].marktrail();
  }

}
