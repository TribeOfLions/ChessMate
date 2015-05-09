//WARNING: raw Javascript only on this tab


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
  
   // dummy PGN data
  //TODO: load and parse from text file
  /*var pgnData = "[Event \"Casual Game\"]" +
         "[Site \"Berlin GER\"]" +
         "[Date \"1852.??.??\"]" +
         "[EventDate \"?\"]" +
         "[Round \"?\"]" +
         "[Result \"1-0\"]" +
         "[White \"Adolf Anderssen\"]" +
         "[Black \"Jean Dufresne\"]" +
         "[ECO \"C52\"]" +
         "[WhiteElo \"?\"]" +
         "[BlackElo \"?\"]" +
         "[PlyCount \"47\"]" +
         "" +
         "1.e4 e5 2.Nf3 Nc6 3.Bc4 Bc5 4.b4 Bxb4 5.c3 Ba5 6.d4 exd4 7.O-O" +
         "d3 8.Qb3 Qf6 9.e5 Qg6 10.Re1 Nge7 11.Ba3 b5 12.Qxb5 Rb8 13.Qa4" +
         "Bb6 14.Nbd2 Bb7 15.Ne4 Qf5 16.Bxd3 Qh5 17.Nf6+ gxf6 18.exf6" +
         "Rg8 19.Rad1 Qxf3 20.Rxe7+ Nxe7 21.Qxd7+ Kxd7 22.Bf5+ Ke8" +
         "23.Bd7+ Kf8 24.Bxe7# 1-0";
  */
  
// revealing module pattern
var gameData = (function(){

  
  var chess = new Chess();
  chess.load_pgn(pgnData);
  
  // store all moves in an array
  var allMoves = chess.history({verbose : true });
  // reset the board to start position
  chess.reset();
  
  //TODO: create a mechanism for playing through the moves in turn
  var iterateMoves = function() {
    
  };


  var getAllMoves = function() {
    return allMoves;
  };
  
  // return any public properties/methods 
  return {
   getAllMoves : getAllMoves 
  }
  
  
})();

