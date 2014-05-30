  /************************/
  import java.awt.*;
  
  Robot rob;
  Point scPos;
  
  ArrayList<Object> o;
  Player p;
  int time;
  
  
  void setup(){
    size(1000,1000,P3D);
    time = 0;
    scPos = getLocationOnScreen();
    try { 
    rob = new Robot();
    } 
    catch (AWTException e) {
      e.printStackTrace(); 
    }
    rob.mouseMove((int) (scPos.x+width/2), (int) (scPos.y+height/2));
    
    p = new Player();
    o = new ArrayList<Object>();
    for(int i=0; i < 10; i++){
       o.add(new Object(
         new PVector(random(500)-250,random(500)-250,random(500)-250),
         new PVector(25,25,25),
         new PVector(random(TWO_PI),random(TWO_PI),random(TWO_PI)),
         false
     )); 
    }
    
     o.add(new Cube(
    new PVector(500,0,0),
    new PVector(100,100,100),
    new PVector(0,0,0),
    true
    ));
     o.add(new Cube(
    new PVector(-500,0,0),
    new PVector(100,100,100),
    new PVector(0,0,0),
    true
    ));
     o.add(new Cube(
    new PVector(0,0,500),
    new PVector(100,100,100),
    new PVector(0,0,0),
    true
    ));
    o.add(new Cube(
    new PVector(0,0,-500),
    new PVector(100,100,100),
    new PVector(0,0,0),
    true
    ));
    
    
    
    o.add(new Cube(
    new PVector(0,0,0),
    new PVector(500,2,2),
    new PVector(0,0,0),
    true
    ));
    o.add(new Cube(
    new PVector(0,0,0),
    new PVector(2,500,2),
    new PVector(0,0,0),
    true
    ));
    o.add(new Cube(
    new PVector(0,0,0),
    new PVector(2,2,500),
    new PVector(0,0,0),
    true
    ));
    
    o.add(new Blob(
    new PVector(0,0,0),
    new PVector(100, 100, 100),
    new PVector(0,0,0),
    false
    ));
    
    o.add(new Blob(
    new PVector(1000,0,0),
    new PVector(100, 100, 100),
    new PVector(0,0,0),
    false
    ));
    
    p.turn(-500,-500);
  }
  
  
  public void keyPressed(){
      //System.out.println(key);
      p.act();       
   }
  
  public void mouseMoved() {
    float h = pmouseX-mouseX;
    float v = pmouseY-mouseY;
    p.turn(-h,-v);
    //noCursor();
    float dx = (int) (mouseX-width/2.0);
    float dy = (int) (mouseY-height/2.0);
    //println(dx+" "+dy);
    rob.mouseMove((int) (scPos.x+mouseX-dx), (int) (scPos.y+mouseY-dy));
    mouseX-=dx;
    mouseY-=dy;
    pmouseX-=dx;
    pmouseY-=dy;
    
    
  }
    
  
  void draw(){
    background(255);
   
    translate(width/2.0, height/2.0);
    scale(1,-1,1);
    camera(0, 0, 0, 0, 0, 1000, 0, 1, 0);
    p.convertPlayerView();
    //p.draw();
    
    for(int i=0; i < o.size(); i++){
        Object ob = o.get(i);
        ob.resolveForces(o);
        ob.move();
        if(i==1){
          //println(ob.getForce());
        }
        ob.draw();
    }
    
    p.revertPlayerView();
    scale(1,-1,1);
    translate(-width/2.0, -height/2.0);
  }
  

