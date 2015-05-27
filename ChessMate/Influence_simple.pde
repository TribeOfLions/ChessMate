/*
 * @desc Quick demo of implementing a visualisation 
 * Draw transparent rectangles to show each side's pieces
 * and let these fade out/build up over the course of the game
 * @author blindfish ben@blindfish.co.uk
*/

class InfluenceSimple {
  
  PGraphics drawingLayer;
  PGraphics outputLayer;
  color darkColour;
  color lightColour;


  InfluenceSimple(color d,color l) {
   this.darkColour = d;
   this.lightColour = l;
   // Since the fade algorithm slows as size increases
   // we're limiting the size of our base image and setting board
   // tileSize accordingly in setup...
   drawingLayer = createGraphics(width/5, width/5, P2D);
  }


  void updateLayer() {
    color c;
    //TODO: stop updating once all moves have been played!
    drawingLayer.beginDraw();

      drawingLayer.noStroke();
      
      for (Tile t : board.tiles.values()) {
        
        Object p = t.piece;
        
        if(p) {
           c = (p["color"] == "w") ? lightColour : darkColour;
          drawingLayer.fill(c);   
          drawingLayer.rect(t.x, t.y, board.tileSize, board.tileSize);
        }
        
      }
      
    drawingLayer.endDraw();
  }
 
 void drawLayer() {
     
     //TODO: establish the best place to call this
     fadeImage();
     // scale image to fit sketch. 
     //TODO: probably a better way to implement this and get cleaner results
     // though scaling anomalies actually add a little character to the result
     image(drawingLayer, 0, 0, width, height);
 }
 
 //TODO: check this is correct and optimise...
 void fadeImage() {
   drawingLayer.loadPixels();
   Array p = drawingLayer.pixels;
   int pLen = p.length;
   
   for(int i=0; i < pLen; i++) {
     Color c = p[i];
     int r = c >> 16 & 0xFF;
     int g = c >> 8 & 0xFF;
     int b = c & 0xFF;
     int a = c >> 24 & 0xFF;
     //TODO: remove maic number!
     a = Math.max(a -= 40, 0);
     c = (a << 24) | (r << 16) | (g << 8) | b;
     drawingLayer.pixels[i] = c;
   }
   drawingLayer.updatePixels();
 }
  
}

