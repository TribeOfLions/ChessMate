Trail[] trails = new Trail[63]; // Trail: class for patterns based on game moves
TrailDust[] dust = new TrailDust[3222]; // TrailDust: class for background specks

// Chess Board Coordinates
// 8x8 grid

float[] a1 = {40, 600};
float[] a2 = {40, 520};
float[] a3 = {40, 440};
float[] a4 = {40, 360};
float[] a5 = {40, 280};
float[] a6 = {40, 200};
float[] a7 = {40, 120};
float[] a8 = {40, 40};

float[] b1 = {120, 600};
float[] b2 = {120, 520};
float[] b3 = {120, 440};
float[] b4 = {120, 360};
float[] b5 = {120, 280};
float[] b6 = {120, 200};
float[] b7 = {120, 120};
float[] b8 = {120, 40};

float[] c1 = {200, 600};
float[] c2 = {200, 520};
float[] c3 = {200, 440};
float[] c4 = {200, 360};
float[] c5 = {200, 280};
float[] c6 = {200, 200};
float[] c7 = {200, 120};
float[] c8 = {200, 40};

float[] d1 = {280, 600};
float[] d2 = {280, 520};
float[] d3 = {280, 440};
float[] d4 = {280, 360};
float[] d5 = {280, 280};
float[] d6 = {280, 200};
float[] d7 = {280, 120};
float[] d8 = {280, 40};

float[] e1 = {360, 600};
float[] e2 = {360, 520};
float[] e3 = {360, 440};
float[] e4 = {360, 360};
float[] e5 = {360, 280};
float[] e6 = {360, 200};
float[] e7 = {360, 120};
float[] e8 = {360, 40};

float[] f1 = {440, 600};
float[] f2 = {440, 520};
float[] f3 = {440, 440};
float[] f4 = {440, 360};
float[] f5 = {440, 280};
float[] f6 = {440, 200};
float[] f7 = {440, 120};
float[] f8 = {440, 40};

float[] g1 = {520, 600};
float[] g2 = {520, 520};
float[] g3 = {520, 440};
float[] g4 = {520, 360};
float[] g5 = {520, 280};
float[] g6 = {520, 200};
float[] g7 = {520, 120};
float[] g8 = {520, 40};

float[] h1 = {600, 600};
float[] h2 = {600, 520};
float[] h3 = {600, 440};
float[] h4 = {600, 360};
float[] h5 = {600, 280};
float[] h6 = {600, 200};
float[] h7 = {600, 120};
float[] h8 = {600, 40};

void setup() {
  
  size(640, 640); // each square is 80x80 pixels
  smooth();
  background(234); // background color
  
  // random background specks (TrailDust)
  for (int i = 0; i < dust.length; i++) {
    float x3 = random(width);
    float y3 = random(height);
    dust[i] = new TrailDust(x3, y3);
  }
  
  // [Simplified] Long Algebraic Notation of Chess moves
  // Populating trails array
  // Joshua Waitzkin vs Edward A Frumkin
  
  trails[0] = new Trail(e2, e4, 1);
  trails[1] = new Trail(c7, c5, 0);
  trails[2] = new Trail(g1, f3, 1);
  trails[3] = new Trail(e7, e6, 0);
  trails[4] = new Trail(d2, d4, 1);
  trails[5] = new Trail(c5, d4, 0);
  trails[6] = new Trail(f3, d4, 1);
  trails[7] = new Trail(g8, f6, 0);
  trails[8] = new Trail(b1, c3, 1);
  trails[9] = new Trail(b8, c6, 0);
  trails[10] = new Trail(c1, e3, 1);
  trails[11] = new Trail(f8, b4, 0);
  trails[12] = new Trail(f2, f3, 1);
  trails[13] = new Trail(d7, d5, 0);
  trails[14] = new Trail(f1, b5, 1);
  trails[15] = new Trail(c8, d7, 0);
  trails[16] = new Trail(b5, c6, 1);
  trails[17] = new Trail(b7, c6, 0);
  trails[18] = new Trail(e4, e5, 1);
  trails[19] = new Trail(f6, g8, 0);
  trails[20] = new Trail(a2, a3, 1);
  trails[21] = new Trail(b4, a5, 0);
  trails[22] = new Trail(b2, b4, 1);
  trails[23] = new Trail(a5, c7, 0);
  trails[24] = new Trail(f3, f4, 1);
  trails[25] = new Trail(g8, e7, 0);
  trails[26] = new Trail(c3, a4, 1);
  trails[27] = new Trail(e8, g8, 0);
  trails[28] = new Trail(h8, f8, 0);
  trails[29] = new Trail(a4, c5, 1);
  trails[30] = new Trail(a7, a5, 0);
  trails[31] = new Trail(c2, c3, 1);
  trails[32] = new Trail(e7, c8, 0);
  trails[33] = new Trail(e1, g1, 1);
  trails[34] = new Trail(h8, f8, 1);
  trails[35] = new Trail(c8, b6, 0);
  trails[36] = new Trail(d1, g4, 1);
  trails[37] = new Trail(b6, c4, 0);
  trails[38] = new Trail(e3, f2, 1);
  trails[39] = new Trail(d8, e8, 0);
  trails[40] = new Trail(f1, e1, 1);
  trails[41] = new Trail(d7, c8, 0);
  trails[42] = new Trail(f2, h4, 1);
  trails[43] = new Trail(g8, h8, 0);
  trails[44] = new Trail(a3, a4, 1);
  trails[45] = new Trail(c7, b6, 0);
  trails[46] = new Trail(a1, d1, 1);
  trails[47] = new Trail(b6, c5, 0);
  trails[48] = new Trail(b4, c5, 1);
  trails[49] = new Trail(c4, b2, 0);
  trails[50] = new Trail(e1, e3, 1);
  trails[51] = new Trail(b2, d1, 0);
  trails[52] = new Trail(g4, g7, 1);
  trails[53] = new Trail(h8, g7, 0);
  trails[54] = new Trail(h4, f6, 1);
  trails[55] = new Trail(g7, g6, 0);
  trails[56] = new Trail(e3, g3, 1);
  trails[57] = new Trail(g6, h6, 0);
  trails[58] = new Trail(f6, g7, 1);
  trails[59] = new Trail(h6, h5, 0);
  trails[60] = new Trail(g3, g5, 1);
  trails[61] = new Trail(h5, h4, 0);
  trails[62] = new Trail(d4, f3, 1);
  
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
