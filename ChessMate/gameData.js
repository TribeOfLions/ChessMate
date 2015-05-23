//WARNING: raw Javascript only on this tab

// revealing module pattern
// see: http://addyosmani.com/resources/essentialjsdesignpatterns/book/#revealingmodulepatternjavascript

// gameData is a pseudo-class which effectively acts as an interface
// to chess.js
var gameData = (function(){

  // test data - eventually we'll want to be able to load this in dynamically
  var pgnData =   "[Event \"IBM Man-Machine, New York USA\"]" +
    "[Site \"02\"]" +
    "[Date \"1997.05.04\"]" +
    "[EventDate \"?\"]" +
    "[Round \"2\"]" +
    "[Result \"1-0\"]" +
    "[White \"Deep Blue (Computer)\"]" +
    "[Black \"Garry Kasparov\"]" +
    "[ECO \"C93\"]" +
    "[WhiteElo \"?\"]" +
    "[BlackElo \"?\"]" +
    "[PlyCount \"89\"]" +
    
    "1.e4 e5 2.Nf3 Nc6 3.Bb5 a6 4.Ba4 Nf6 5.O-O Be7 6.Re1 b5 7.Bb3 d6 8.c3 O-O 9.h3 h6 10.d4 Re8 11.Nbd2 Bf8 12.Nf1 Bd7 13.Ng3 Na5 14.Bc2 c5 15.b3 Nc6 16.d5 Ne7 17.Be3 Ng6 18.Qd2 Nh7 19.a4 Nh4 20.Nxh4 Qxh4 21.Qe2 Qd8 22.b4 Qc7 23.Rec1 c4 24.Ra3 Rec8 25.Rca1 Qd8 26.f4 Nf6 27.fxe5 dxe5 28.Qf1 Ne8 29.Qf2 Nd6 30.Bb6 Qe8 31.R3a2 Be7 32.Bc5 Bf8 33.Nf5 Bxf5 34.exf5 f6 35.Bxd6 Bxd6 36.axb5 axb5 37.Be4 Rxa2 38.Qxa2 Qd7 39.Qa7 Rc7 40.Qb6 Rb7 41.Ra8+ Kf7 42.Qa6 Qc7 43.Qc6 Qb6+ 44.Kf1 Rb8 45.Ra6 1-0";
    
//    "1.e4 e5 2.Nf3 Nf6 3.Nxe5 d6 4.Nf3 Nxe4 5.d4 d5 6.Bd3 Nc6 7.O-O Be7 8.Re1 Bf5 9.c4 Nb4 10.Bf1 O-O 11.a3 Nc6 12.Nc3 Nxc3 13.bxc3 Bf6 14.Bf4 dxc4 15.Bxc4 Qd7 16.Ba2 Rfe8 17.Qd2 b5 18.Bg5 Bg6 19.Bxf6 gxf6 20.Nh4 Kg7 21.f4 Ne7 22.Qf2 Nf5 23.g4 Nxh4 24.Qxh4 f5 25.Re5 f6 26.Rc5 Re3 27.Re1 Rxe1+ 28.Qxe1 Re8 29.Qg3 Bf7 30.Bxf7 Qxf7 31.g5 Kh8 32.Rxf5 Qb3 33.gxf6 Qd1+ 34.Kg2 Qc2+ 35.Kg1 Qb1+ 36.Kg2 Qc2+ 37.Kg1 1/2-1/2"
  
  var chess = new Chess(),
      board,
      allMoves,
      allMovesLength,
      currentMoveIndex = 0, // use this to track progress through the game
      replaySpeed = 1000; // number of milliseconds between turns
  
  //TODO: may need to add a check that this was successful...    
  chess.load_pgn(pgnData);
  
  // store all moves in an array
  allMoves = chess.history({verbose : true });
  allMovesLength = allMoves.length;
  
  // end: init()
  
  // play a single move - AKA 'ply'
  // TODO: could change function name to reflect proper terminology...
  var playMove = function() {
    if(currentMoveIndex < allMovesLength) {
    var currentMove = allMoves[currentMoveIndex];
    chess.move(currentMove.san);
    if(board) {
      board.updatePosition(currentMove);
    }
    else {
     console.error("no board Object set"); 
    }
    
    currentMoveIndex ++; 
    }
  },
  
  // will play all moves remaining for the current turn
  playTurn = function() {
    playMove();
    if(chess.turn() === "b") {
      playMove();
    }  
  },
  
  resetBoard = function() {
    console.info("resetting board to default starting position");
    chess.reset();
    board.resetAllTiles();
  },

  // 'Getters'
  getPiece = function(square) {
    return chess.get(square);
  },
  
  // retuns an array of all moves from the game
  getAllMoves = function() {
    return allMoves;
  },
  
  getAllMovesLength = function() {
    return allMovesLength;
  },
    
  getReplayedMoves = function() {
    return chess.history({verbose : true });
  },
  
  // could just return the raw fen and create a separate method to parse it...
  getCurrentPosition = function() {
     var fen = chess.fen();
     return fen.split(" ")[0].split("/");//return the piece positions as an array of rows...
  },
    
  getLegalMoves = function(squareReference) {
     return squareReference ? chess.moves({ square : squareReference}) : chess.moves({verbose : true }); 
  },
  
  // this one is going to be tricky
  getThreatenedSquares = function() {
    
  },
  
  // 'Setters'
  setBoard = function(newBoard) {
    board = newBoard;
  };

    
  // return any public properties/methods 
  return {
    playMove : playMove,
    playTurn : playTurn,
    resetBoard : resetBoard,
    getPiece : getPiece,
    getAllMoves : getAllMoves,
    getAllMovesLength : getAllMovesLength,
    getReplayedMoves : getReplayedMoves,
    getLegalMoves : getLegalMoves,
    getCurrentPosition : getCurrentPosition,
    setBoard : setBoard
  }
  
  
})();

