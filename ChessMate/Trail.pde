//TODO: check for 'magic numbers' - i.e. anything hardcoded that may refer to
// something dynamic; such as the tile size

class Trail { // this class holds the properties of the animations based on moves in the chess game

  float twixt, split; // explained fully at NB: Variables (above coords() method)
  float x, y, x1, y1, z; // explained fully at NB: Variables (above coords() method)
  float endpoint, endx, endy; // explained fully at NB: Variables (above coords() method)
  float linespeed = -1; // move animation speed
  float picky = int(random(5)); // just a random variable
  float opacity = 12; // variable for specifying transparency
  Tile start;
  Tile end;

  // changed parameter type to work with Tile class
  Trail(String start, String end, int tempZ) {
    // a bit of extra work required to get at values
    // the payoff being greater flexibility
    this.start = board.tiles.get(start);
    this.end = board.tiles.get(end);
    x = this.start.midX;
    y = this.start.midY; // unpacking start point Y-axis coordinate
    x1 = this.end.midX;  // unpacking end point X-axis coordinate
    y1 = this.end.midY;  // unpacking end point Y-axis coordinate
    z = tempZ;    // player information (white = 1 | black = 0)
  }

   /* NB: Variables

     x,y = start coordinates
     x1,y1 = end coordinates
     z = player information (white = 1 | black = 0)

     >>>twixt, split, endpoint: used only to compute vertical & horizontal movements
     >>ONLY one of either x OR y axis will need incrementation to produce animation in vertical & horizontal movements
     >twixt: holds distance between start & end points
     >split: holds value that will be compared to twixt to determine direction
     >endpoint: holds value of the endpoint

   */

  void coords() { // method for preparing animations

    twixt = dist(x, y, x1, y1); // distance between start & end point

    if (x == x1 && (y > y1)) { // defining upward (vertical) movement [N]
      endpoint = y;
      split = y;
    } else if (x == x1 && (y < y1)) { // defining downward (vertical) movement [S]
      endpoint = y;
      split = y;
      twixt = -twixt;
      linespeed = -linespeed;
    } else if (y == y1 && (x < x1)) { // defining forward (horizontal) movement [E]
      endpoint = x;
      split = x;
      linespeed = -linespeed;
    } else if (y == y1 && (x > x1)) { // defining backward (horizontal) movement [W]
      endpoint = x;
      split = x;
      twixt = -twixt;
    } else { // defining diagonal movement
      endx = x;
      endy = y;
    }

  }

  /*

    >>>VARIOUS ANIMATION PATTERNS

    This is where we have fun and create whatever kind of patterns we can think of.
    Whatever we choose simply needs to use X,Y parameters from the game.

  */

  void lightTrail(float tempXa, float tempYa) { // START function for LIGHT move animations

    float x1 = tempXa;
    float y1 = tempYa;

      if (picky == 1) { // some random colors
        fill(random(225, 235), 0, 0, opacity); // random red
      } else if (picky == 2) {
        fill(random(250, 260), random(215, 225), 0, opacity); // random yellow
      } else if (picky == 3) {
        fill(random(30, 40), random(165, 175), random(215, 225), opacity); // random blue
      } else {
        fill(random(0, 10), random(165, 175), random(0, 10), opacity); // random green
      }

    noStroke();
    ellipse(x1, y1, 33, 33); // ellipse animation represents moves

  } // END function for LIGHT animation moves

  void darkTrail(float tempXa, float tempYa) { // START function for DARK move animations

    float x1 = tempXa;
    float y1 = tempYa;

    fill(0, opacity); // total black with some transparency

    noStroke();
    ellipse(x1, y1, 33, 33); // ellipse animation represents moves

  } // END function for DARK animation moves

  void burst1(float tempXb, float tempYb) { // START extra animations 1

    float x1 = tempXb;
    float y1 = tempYb;
    color filler1 = color(255, 100);

    fill(filler1);
    ellipse(x1 + random(20) - 10, y1 + random(20) - 10, 10, 10); // ellipse randomly offset from X,Y parameters
    stroke(random(255), random(235), random(25)); // random colors
    strokeWeight(5);
    point(x1 + random(24) - 12, y1 + random(24) - 12); // pixel point randomly offset from X,Y parameters

  } // END extra animations 1

  void burst2(float tempXb, float tempYb) { // START extra animations 2

    float x1 = tempXb;
    float y1 = tempYb;
    color filler1 = color(25, 100);

    fill(filler1);
    ellipse(x1 + random(20) - 10, y1 + random(20) - 10, 10, 10); // ellipse randomly offset from X,Y parameters
    if (picky == 1) { // some random colors
        stroke(random(225, 235), 0, 0); // random red
      } else if (picky == 2) {
        stroke(random(250, 260), random(215, 225), 0); // random yellow
      } else if (picky == 3) {
        stroke(random(30, 40), random(165, 175), random(215, 225)); // random blue
      } else {
        stroke(random(0, 10), random(165, 175), random(0, 10)); // random green
      }
    strokeWeight(5);
    point(x1 + random(24) - 12, y1 + random(24) - 12); // pixel point randomly offset from X,Y parameters

  } // END extra animations 2

  void trailPattern1(float tempX4, float tempY4) { // placing basic animations in a function
    float x4 = tempX4;
    float y4 = tempY4;

    if (z == 1) { // LIGHT player animations
      lightTrail(x4, y4);
      burst1(x4, y4);
    } else { // DARK player animations
      darkTrail(x4, y4);
      burst2(x4, y4);
    }

  }

  void squarespray(int spray) { // some abstract atmospheric animations
    strokeWeight(1);
    point(endx*1.1 + sin(spray) * opacity, endy*1.1 - spray);
  }

  void trailPatterns(float coordX, float coordY) { // START all animation patterns in a FINAL function

    for (int i = 0; i < twixt; i += 6) { // just random and abstract
      squarespray(i);
    }

    trailPattern1(coordX, coordY); // basic animations (lightTrail, darkTrail, burst1, burst2)

   for (int i = 0; i < twixt; i++) { // random colors to [accidentally] disturb defined colors
      if (picky == 1) {
        stroke(random(225, 235), 0, 0); // random red
      } else if (picky == 2) {
        stroke(random(250, 260), random(215, 225), 0); // random yellow
      } else if (picky == 3) {
        stroke(random(30, 40), random(165, 175), random(215, 225)); // random blue
      } else if (picky == 4) {
        stroke(random(0, 10), random(165, 175), random(0, 10)); // random green
      }
    }

  } // END all animation patterns in a FINAL function

  void marktrail() { // method for animations

    // defining animation movements

    if (y == y1) { // defining [E] & [W] (horizontal) movements
      if (endpoint != split + twixt) {
        trailPatterns(endpoint, y1);
        endpoint += linespeed;
      }
    } else if (x == x1) { // defining [N] & [S] (vertical) movements
      if (endpoint != split - twixt) {
        trailPatterns(x1, endpoint);
        endpoint += linespeed;
      }
    } else if ((x1 - x) == 80 && (y - y1) == 160) { // defining long [NE] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx -= linespeed;
        endy += linespeed  * 2;
      }
    } else if ((x1 - x) == -80 && (y - y1) == -160) { // defining long [SW] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx += linespeed;
        endy -= linespeed  * 2;
      }
    } else if ((x1 - x) == -160 && (y - y1) == -80) { // defining short [SW] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx += linespeed * 2;
        endy -= linespeed;
      }
    } else if ((x1 - x) == 160 && (y - y1) == 80) { // defining short [NE] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx -= linespeed * 2;
        endy += linespeed;
      }
    } else if ((x1 - x) == 160 && (y - y1) == -80) { // defining short [SE] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx -= linespeed * 2;
        endy -= linespeed;
      }
    } else if ((x1 - x) == -160 && (y - y1) == 80) { // defining short [NW] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx += linespeed * 2;
        endy += linespeed;
      }
    } else if ((x1 - x) == 80 && (y - y1) == -160) { // defining long [SE] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx -= linespeed;
        endy -= linespeed * 2;
      }
    } else if ((x1 - x) == -80 && (y - y1) == 160) { // defining long [NW] (diagonal) movement -KNIGHT
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx += linespeed;
        endy += linespeed * 2;
      }
    } else if (x < x1 && y > y1) { // defining [NE] (diagonal) movement
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx -= linespeed;
        endy += linespeed;
      }
    } else if (x > x1 && y < y1) { // defining [SW] (diagonal) movement
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx += linespeed;
        endy -= linespeed;
      }
    } else if (x > x1 && y > y1) { // defining [NW] (diagonal) movement
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx += linespeed;
        endy += linespeed;
      }
    } else if (x < x1 && y < y1) { // defining [SE] (diagonal) movement
      if (endx != x1 && (endy != y1)) {
        trailPatterns(endx, endy);
        endx -= linespeed;
        endy -= linespeed;
      }
    }

    // START animation reset

    if (endx == x1 || endy == y1) {
      endx = x;
      endy = y;
      opacity -= 0.1;
      if (opacity <= 0) {
        opacity = 24;
      }
    } else if (endpoint == x1) {
      endpoint = x;
      opacity -= 0.1;
      if (opacity <= 0) {
        opacity = 24;
      }
    } else if (endpoint == y1) {
      endpoint = y;
      opacity -= 0.1;
      if (opacity <= 0) {
        opacity = 24;
      }
    } // END animation reset
  }

}
