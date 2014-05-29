public class Cube extends Object{

  
   public Cube(PVector pos, PVector siz, PVector rot){
      super(pos, siz, rot);
    }
  
  
   public void draw(){
    translate(pos.x, pos.y, pos.z);
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.z);
    box(siz.x, siz.y, siz.z);
    rotateZ(-rot.z);
    rotateY(-rot.y);
    rotateX(-rot.x);
    translate(-pos.x, -pos.y, -pos.z);
  }

}
