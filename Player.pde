public class Player extends Object{
  
  PVector eye, target, up, right;
  float ha, va;
  float step;
  float le;
/*  
 public Player(){
  super(new PVector(0.0,0.0,0.0), new PVector(10,10,10), new PVector(0.0,0.0,0.0));
  le = (height/2.0) / tan(PI*30.0 / 180.0);
  
  eye = new PVector(width/2.0, height/2.0, -le);
  target = new PVector(0,0,1);
  up = new PVector(0,1,0);
  right = up.cross(target);
  right.normalize();
  setCamera();
  
  setLocation(eye);
  step = 10;
 } 
 */
 
 public Player(){
  super(new PVector(0.0,0.0,0.0), new PVector(10,10,10), new PVector(0.0,0.0,0.0), true);
  va = 0.0;
  ha = 0.0;
  eye = new PVector(0,0,0);
  target = new PVector(0,0,1);
  up = new PVector(0,1,0);
  right = up.cross(target);
  right.normalize();
  
  setLocation(eye);
  step = 10;
 } 
 
 public void setAngles(float h, float v){
   ha = h;
   va = v;
 }
 
 public void convertPlayerView(){
    //println(target);
    //rotateX(target.x);
    rotateX(va);
    rotateY(ha);
    translate(eye.x, eye.y, eye.z);
 } 
 public void revertPlayerView(){
    translate(-eye.x, -eye.y, -eye.z);
    rotateY(-ha);
    rotateX(-va);
    //rotateX(-target.x);
 } 
  
 public void draw(){
   target.normalize();
 }
  
 public void turn(float h, float v){
   ha+=h/500.0;
   va+=v/500.0;
   
   if(va > PI/6 || va < -PI/6){
     va -= 2*v/500.0;
   }
   
   
   if(ha<0){
     ha = 2*PI-ha;
   }else if(ha>2*PI){
     ha = ha-2*PI;
   }
   //println(ha*180/PI);
   target.x = sin(ha);
   target.z = -cos(ha);
    
   
   target.normalize();
   right = up.cross(target);
   right.normalize();
   
 }
  
 public void act(){
   
   target.normalize();
   target.mult(step);
   
   right.normalize();
   right.mult(step);
   
   up.normalize();
   up.mult(step);
   
   
   //println(centerX + " " +centerY);
   //println(eye);
   //println(up);
   if(key=='a'){
       eye.add(right);
     }else if(key=='d'){
       eye.sub(right);
     }else if(key=='w'){
       eye.add(target);
     }else if(key=='s'){
       eye.sub(target);
     }else if(key=='e'){
       eye.add(up);
     }else if(key=='q'){
       eye.sub(up);
     }
     setLocation(eye);
 }
 
}
 
 


