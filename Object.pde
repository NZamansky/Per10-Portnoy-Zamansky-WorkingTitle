public class Object{
  PVector pos, vel, siz, rot;
  float[] xver, yver, zver;
 
  
  
  public Object(PVector pos, PVector siz, PVector rot){
     this.pos=pos;
     this.siz=siz;
     this.rot=rot;
  }
  
  public void setRotation(PVector rot){
     this.rot=rot;
  }
  
   public void setLocation(PVector pos){
     this.pos=pos;
  }
  
    public void changeLocation(PVector c){
     pos.add(c);
  }
  
  public void draw(){
    translate(pos.x, pos.y, pos.z);
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.z);
    sphere(siz.z);
    rotateZ(-rot.z);
    rotateY(-rot.y);
    rotateX(-rot.x);
    translate(-pos.x, -pos.y, -pos.z);
  }
  
  public void move(){
    pos.add(vel);
  }
  
}

