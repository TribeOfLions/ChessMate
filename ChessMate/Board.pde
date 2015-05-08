/*
 * @desc Provides an abstraction of a chess board which
 * allows for arbitrary sketch size
 * @author blindfish ben@blindfish.co.uk
 * @dependencies: class Tile
*/

//TODO: consider privacy of properties/methods: currently all public :/
class Board {

  // A straightforward array could be used for convenience but
  // a HashMap has the advantage of being able to reference a tile
  // directly by the id used in notation
  HashMap<String,Tile> tiles = new HashMap<String,Tile>(64);
  float tileSize = width/8;

  Board() {
    String[] columnLabels = { "a", "b", "c", "d", "e", "f", "g", "h" };
    Boolean rowStartIsWhite = true;

    for(int i=0; i<8; i++) {
      Boolean tileIsWhite = rowStartIsWhite;
      float y = i * tileSize;

      for(int j=0; j<8; j++) {
        float x = j * tileSize;
        String id = columnLabels[j] + (8-i);
        Tile t = new Tile(i , j, tileIsWhite, id, x, y, tileSize);
        // add the new tile to the HashMap
        tiles.put(id, t);

        //swap colour for each tile
        tileIsWhite = !tileIsWhite;
      }
      //swap starting colour each row
      rowStartIsWhite = !rowStartIsWhite;
    }
  }

  // Optional method to display the chessboard
  // initially added to check data accuracy.
  // Further parameters could be added to set options
  //TODO: add more board rendering options - e.g. tile colour
  void render(int opacity, Boolean showLabels) {
    noStroke();
    textAlign(CENTER, CENTER);
    textSize(tileSize/4);

    // Note that one possible disadvantage of a HashMap is that
    // iteration does not happen in 'order': see output from print()
    for (Tile t : tiles.values()) {
      int c = t.isWhite ? 255 : 0;

      fill(c, c, c, opacity);
      rect(t.x, t.y, tileSize, tileSize);

      if(showLabels) {
        fill(255,166,0);
        text(t.id, t.midX, t.midY);
      }

      // debug:
      // print(t.id + "\n");

    }

  }//end: render()
}

/*
 * @desc Convenience class to store Tile properties
 * @author blindfish ben@blindfish.co.uk
 * @comments:  Avoid adding unneccessary complexity (e.g. methods) here
 * and instead favour acting on Tiles from within methods in the Board class.
*/
class Tile {
  int row;
  int column;
  Boolean isWhite;
  String id;
  float x;
  float y;
  float midX;
  float midY;

 Tile(int row, int column, Boolean isWhite, String id, float x, float y, float tileSize) {
   this.row = row;
   this.column = column;
   this.isWhite = isWhite;
   this.id = id;
   this.x = x;
   this.y = y;
   this.midX = x + tileSize/2;
   this.midY = y + tileSize/2;
 }



}
