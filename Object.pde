public class Object{
  PVector pos, vel, acc, siz, rot, force;
  float[] xver, yver, zver;
  float mass;
  boolean block;
 
  
  
  public Object(PVector pos, PVector siz, PVector rot, boolean block){
     this.pos = pos;
     this.siz =siz;
     this.rot =rot;
     this.mass = 10;
     this.vel = new PVector(0,0,0);
     this.acc = new PVector(0,0,0);
     this.force = new PVector(0,0,0);
     this.block = block;
  }
  
  public float getMass(){
      return mass;
  }
  
  public PVector getPos(){
      return pos;
  }
  
  public PVector getForce(){
      return force;
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
    sphere(siz.x);
    rotateZ(-rot.z);
    rotateY(-rot.y);
    rotateX(-rot.x);
    translate(-pos.x, -pos.y, -pos.z);
  }
  
  public void resolveForces(ArrayList<Object> obs){
      if(block){
        return;
      }
    
     force = new PVector(0,0,0);
     for(int i = 0; i < obs.size(); i++){
      
       if(!obs.get(i).equals(this)){
        if(obs.get(i) instanceof Blob){
          Blob b = (Blob)obs.get(i);
          PVector f = b.computeForce(this);
          //println("force is: " +f);
          force.add(f);
        }
      }
      
    }
  }
  
  public void move(){
    //println(this + ": " + force);
    acc = PVector.div(force,mass);
    vel.add(acc);
    pos.add(vel);
  }
  
}

