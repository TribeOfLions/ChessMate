/*
 * @desc Provides an abstraction of a chess board which
 * allows for arbitrary sketch size
 * @author blindfish ben@blindfish.co.uk
 * @dependencies: class Tile
 */

class Board {

  /*
  A straightforward array could be used for convenience but
  a HashMap has the advantage of being able to reference a tile
  directly by the id used in notation
   */
  HashMap<String, Tile> tiles = new HashMap<String, Tile>(64);
  float tileSize;

  PGraphics boardImg;
  PGraphics piecesImg;
  color darkColour;
  color lightColour;
  Boolean drawBoard;
  Boolean drawPieces;
  int piecesOpacity = 50;

  Board() {
    this.drawBoard = false;
    this.drawPieces = false;
    tileSize = width/8;
    init();
  }  
  
  // overriding tile size may allow for some optimisation
  Board(float t) {
    this.drawBoard = false;
    this.drawPieces = false;
    this.tileSize = t;
    init();
  }
  
  Board(Boolean drawBoard, Boolean drawPieces, color darkColour, color lightColour) {

    this.drawBoard = drawBoard;
    this.drawPieces = drawPieces;
    tileSize = width/8;
    init();
    if (drawBoard) {
      this.darkColour = darkColour;
      this.lightColour = lightColour;
      _renderBoardImage(false);
    }

    if (drawPieces) {
      piecesImg = createGraphics(width, height, P2D);
      _updatePiecesImage(15);
    } 
    
  }

  void init() {
    String[] columnLabels = { 
      "a", "b", "c", "d", "e", "f", "g", "h"
    };
    Boolean rowStartIsWhite = true;
    ArrayList occupiedSquares = new ArrayList();  

    for (int i=0; i<8; i++) {
      Boolean tileIsWhite = rowStartIsWhite;
      float y = i * tileSize;

      for (int j=0; j<8; j++) {
        float x = j * tileSize;
        String id = columnLabels[j] + (8-i);
        Object piece = gameData.getPiece(id);

        if (piece) {
          Tile t = new Tile(i, j, tileIsWhite, id, x, y, tileSize, piece);
        } else {
          Tile t = new Tile(i, j, tileIsWhite, id, x, y, tileSize);
        }

        // add the new tile to the HashMap
        tiles.put(id, t);

        //swap colour for each tile
        tileIsWhite = !tileIsWhite;
      }
      //swap starting colour each row
      rowStartIsWhite = !rowStartIsWhite;
    }

    // automatically pass a reference to gameData
    gameData.setBoard(this);
  }


  // PRIVATE methods...
  // though note some are intended to be called by gameData
  
  // Name of following could be made clearer:this assumes moves 
  // are being played in order (i.e. not in reverse!) 
  void _updatePosition(Object currentMove) {
    /*
     Note that a flag may contain *multiple* fields
     so straightforward conditions as below may be too simplistic
     to handle all cases...
     It may be adequate to catch instances of the complex flags
     and just allow fall through to easily handled flags.
     */
    var flag = currentMove.flags;

    // all these result in a straightforward result       
    if (flag == "n" || flag =="b" || flag == "c") {
      tiles.get(currentMove.from).removePiece();
      tiles.get(currentMove.to).setPiece(gameData.getPiece(currentMove.to));
    }
    // en passant
    else if (flag == "e") {
      tiles.get(currentMove.from).removePiece();
      tiles.get(currentMove.to).setPiece(gameData.getPiece(currentMove.to));
      console.info("en passant");
      //TODO: need to remove the taken pawn as well as implement the move! 
    }
    // promotion
    //TODO: test!
    else if (flag == "p") {
      tiles.get(currentMove.from).removePiece();
      tiles.get(currentMove.to).setPiece(gameData.getPiece(currentMove.to));
    }
    //king side castle
    else if (flag == "k") {
      tiles.get(currentMove.from).removePiece();
      tiles.get(currentMove.to).setPiece(gameData.getPiece(currentMove.to));
      if (currentMove["color"] =="w") {
        tiles.get("h1").removePiece();
        tiles.get("f1").setPiece(gameData.getPiece("f1"));
      } else {
        tiles.get("h8").removePiece();
        tiles.get("f8").setPiece(gameData.getPiece("f8"));
      }
    }
    //queen side castle
    //TODO: test!
    else if (flag == "q") {
      tiles.get(currentMove.from).removePiece();
      tiles.get(currentMove.to).setPiece(gameData.getPiece(currentMove.to));
      if (currentMove["color"] =="w") {
        tiles.get("a1").removePiece();
        tiles.get("d1").setPiece(gameData.getPiece("d1"));
      } else {
        tiles.get("h1").removePiece();
        tiles.get("d8").setPiece(gameData.getPiece("d8"));
      }
    }
    
    if (drawPieces) {
     _updatePiecesImage();
    }
  }//end: updatePosition


  void _resetAllTiles() {
    for (Tile t : tiles.values ()) {
      String id = t.id;
      t.removePiece();
      Object piece = gameData.getPiece(id);
      if (piece) {
        t.setPiece(piece);
      }
    }
    if (drawPieces) {
      _updatePiecesImage();
    }
  }
  
  
  // additional methods to render board and pieces
  // initially built for debugging purposes
  // This should only need to be done once during instantiation
  void _renderBoardImage(Boolean showLabels) {
    boardImg = createGraphics(width, height, P2D);

    boardImg.beginDraw();

    boardImg.textAlign(CENTER, CENTER);
    boardImg.textSize(tileSize/4);

    for (Tile t : tiles.values ()) {
      int c = t.isWhite ? lightColour : darkColour;
      boardImg.fill(c);
      boardImg.rect(t.x, t.y, tileSize, tileSize);

      if (showLabels) {
        boardImg.fill(255, 166, 0);
        boardImg.text(t.id, t.midX, t.midY);
      }
    }
    boardImg.endDraw();
  }


  // All pieces are drawn to a single layer here
  void _updatePiecesImage() {

    piecesImg = createGraphics(width, height, P2D);
    piecesImg.beginDraw();

    piecesImg.textAlign(CENTER, CENTER);
    piecesImg.textSize(tileSize/4);

    for (Tile t : tiles.values ()) {
      float pX = t.midX;
      float pY = t.midY;
      float tX = t.x;
      float tY = t.y;
      Object p = t.piece;
      float size = tileSize*0.75;

      piecesImg.stroke(166, 166, 166, piecesOpacity);
      piecesImg.strokeWeight(2);
      piecesImg.ellipseMode(CENTER, CENTER);
      if (p) {
        if (p["color"] == "w") {
          piecesImg.fill(255, 255, 255, piecesOpacity);
          piecesImg.ellipse(pX, pY, size, size);
          piecesImg.fill(0, 0, 0, piecesOpacity);
        } else {
          piecesImg.fill(0, 0, 0, piecesOpacity);
          piecesImg.ellipse(pX, pY, size, size);
          piecesImg.fill(255, 255, 255, piecesOpacity);
        }

        piecesImg.text(p.type, t.midX, t.midY);
      }
    }
    piecesImg.endDraw();
  }



  // PUBLIC METHODS
  void render() {
    if (drawBoard) {
      image(boardImg, 0, 0);
    }
    if (drawPieces) {
      image(piecesImg, 0, 0);
    }
  }
  
}

