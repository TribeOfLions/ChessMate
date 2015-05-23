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
  Object piece;

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
 
  Tile(int row, int column, Boolean isWhite, String id, float x, float y, float tileSize, Object piece) {
   this.row = row;
   this.column = column;
   this.isWhite = isWhite;
   this.id = id;
   this.x = x;
   this.y = y;
   this.midX = x + tileSize/2;
   this.midY = y + tileSize/2;
   this.piece = piece;
 }
 
 void setPiece(Object piece) {
  this.piece = piece; 
 }

  public void removePiece() {
    this.piece = null;
  }


}
