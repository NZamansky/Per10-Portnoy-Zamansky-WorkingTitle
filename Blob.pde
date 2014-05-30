public class Blob extends Object{

    float G_CONST = 30.0;//(float)Math.pow(10,-3);
  
  
   public Blob(PVector pos, PVector siz, PVector rot, boolean block){
      super(pos, siz, rot, block);
      this.mass = 10;
    }
  
   public PVector computeForce(Object o){
         //println(pos.dist( o.getPos() ));
         if(Math.abs(pos.dist( o.getPos() )) < siz.x){
           return new PVector(0,0,0);
         }
     
         PVector f = PVector.sub(pos,o.getPos());
         
         f.normalize();
         float mag = G_CONST * (o.getMass()*this.mass) / (float)Math.pow(pos.dist(o.getPos()),2);
         f.mult(mag);
         return f;
   }
  

}
