/*
 * @desc Provides an abstraction of a chess board which
 * allows for arbitrary sketch size
 * @author blindfish ben@blindfish.co.uk
 * @dependencies: class Tile
*/

//TODO: consider privacy of properties/methods: currently all public :/
//TODO: if rendering the board; do so to an image; so this can be displayed 
// independently from any effects...
class Board {

  // A straightforward array could be used for convenience but
  // a HashMap has the advantage of being able to reference a tile
  // directly by the id used in notation
  HashMap<String,Tile> tiles = new HashMap<String,Tile>(64);
  float tileSize = width/8;
  // redundant unless all effects are drawn to layers...
  PGraphics boardImg;
  PGraphics piecesImg = createGraphics(width, height, P2D);
  Boolean drawBoard;
  Boolean drawPieces;

    

  Board(Boolean drawBoard, Boolean drawPieces) {
    
    this.drawBoard = drawBoard;
    this.drawPieces = drawPieces;
    
    String[] columnLabels = { "a", "b", "c", "d", "e", "f", "g", "h" };
    Boolean rowStartIsWhite = true;
    ArrayList occupiedSquares = new ArrayList();  

    for(int i=0; i<8; i++) {
      Boolean tileIsWhite = rowStartIsWhite;
      float y = i * tileSize;

      for(int j=0; j<8; j++) {
        float x = j * tileSize;
        String id = columnLabels[j] + (8-i);
        Object piece = gameData.getPiece(id);
        
        if(piece) {
          Tile t = new Tile(i , j, tileIsWhite, id, x, y, tileSize, piece);
        }
        else {
          Tile t = new Tile(i , j, tileIsWhite, id, x, y, tileSize);
        }
        
        // add the new tile to the HashMap
        tiles.put(id, t);
        
        //swap colour for each tile
        tileIsWhite = !tileIsWhite;
      }
      //swap starting colour each row
      rowStartIsWhite = !rowStartIsWhite;
    }
    if(drawBoard) {
      renderBoardImage(15, false);
    }
    if(drawPieces) {
     updatePiecesImage(15); 
    }
    
    gameData.setBoard(this);
  }


  void renderBoardImage(int opacity, Boolean showLabels) {
    boardImg = createGraphics(width, height, P2D);
    
    boardImg.beginDraw();
    
      boardImg.textAlign(CENTER, CENTER);
      boardImg.textSize(tileSize/4);
      
      for (Tile t : tiles.values()) {
          int c = t.isWhite ? 255 : 0;
          boardImg.fill(c, c, c, opacity);
          boardImg.rect(t.x, t.y, tileSize, tileSize);
    
          if(showLabels) {
            boardImg.fill(255,166,0);
            boardImg.text(t.id, t.midX, t.midY);
          }
      }
    
   boardImg.endDraw();
  }
  
  void updatePiecesImage(int opacity) {
    
    piecesImg = createGraphics(width, height, P2D);
    piecesImg.beginDraw();
    
    piecesImg.textAlign(CENTER, CENTER);
    piecesImg.textSize(tileSize/4);

    for (Tile t : tiles.values()) {
      float pX = t.midX;
      float pY = t.midY;
      float tX = t.x;
      float tY = t.y;
      Object p = t.piece;
      float size = tileSize*0.75;
        piecesImg.noStroke();
      piecesImg.stroke(166,166,166, opacity);
      piecesImg.strokeWeight(2);
      piecesImg.ellipseMode(CENTER, CENTER);
      if(p) {
        if(p["color"] == "w"){
          piecesImg.fill(255,255,255, opacity);
          piecesImg.ellipse(pX, pY, size, size);
          piecesImg.fill(0,0,0, opacity);
            
        }
        else {
          piecesImg.fill(0,0,0, opacity);
          piecesImg.ellipse(pX, pY, size, size);
          piecesImg.fill(255,255,255, opacity);
        }
        
        piecesImg.text(p.type, t.midX, t.midY);
      }
    }
    piecesImg.endDraw();
  }


  void render() {
    
    if(drawBoard) {
      image(boardImg, 0,0);
    }
    if(drawPieces) {
      image(piecesImg, 0,0);
    }

  }//end: render()
  
  
  // name could be made clearer:this assumes moves are being played in order (i.e. not in reverse!) 
  void updatePosition(Object currentMove) {
      // Note that a flag may contain *multiple* fields
      // so straightforward conditions as below may be too simplistic
      // to handle all cases...
      //  It may be adequate to catch instances of the complex flags
      // and just allow fall through to easily handled flags.
      
       var flag = currentMove.flags;
       
       // all these result in a straightforward result       
       if(flag == "n" || flag =="b" || flag == "c") {
          tiles.get(currentMove.from).removePiece();
          tiles.get(currentMove.to).setPiece(gameData.getPiece(currentMove.to));
       }
       // en passant
       // Need to remove the taken pawn as well as implement the move 
       else if(flag == "e") {
         console.info("en passant");  
       }
       
       // promotion
       else if(flag == "p") {
         
       }
       //king side castle
       else if(flag == "k") {
         tiles.get(currentMove.from).removePiece();
         tiles.get(currentMove.to).setPiece(gameData.getPiece(currentMove.to));
         if(currentMove["color"] =="w") {
           tiles.get("h1").removePiece();
           tiles.get("f1").setPiece(gameData.getPiece("f1"));
         }
         else {
           tiles.get("h8").removePiece();
           tiles.get("f8").setPiece(gameData.getPiece("f8"));
         }
         
       }
       //TODO: queen side castle!
       
      updatePiecesImage(50);
       
  }//end: updatePosition
  
  void resetAllTiles() {
    for (Tile t : tiles.values()) {
      String id = t.id;
      t.removePiece();
      Object piece = gameData.getPiece(id);
      if(piece) {
        t.setPiece(piece);
      }
    }
    updatePiecesImage(15);
  }
  
}

