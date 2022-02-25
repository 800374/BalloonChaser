public class Chaser {
  public PVector pos, vel, acc;
  public int SIZE = 20;
  public float MAX_SPEED = 5;
  
  public Chaser() {
    pos = new PVector(width,height).mult(0.5);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  public void move() {
    vel.add(acc);
    pos.add(vel); 
  }
  
  public void chase(Balloon[] bs) {
    Balloon targetBalloon = target(bs);
    
    PVector perfectVel = PVector
      .sub(targetBalloon.pos,pos)
      .limit(MAX_SPEED);
    acc = PVector
      .sub(perfectVel,vel)
      .limit(MAX_SPEED * 0.1);
  }
  
// finish this maybe (it destroys the balloons when they come in contact with chaser)
  /*public void collide(Balloon[] balloons) {
    if(dist(pos.x,pos.y, balloons.pos.x,balloons.pos.y) > SIZE/2 + balloons.size/2) {
     balloons.active = false;
    }
  }*/
  
  private Balloon target(Balloon[] balloons) {
     Balloon bigBalloon = balloons[0];
    int[] balloonSize = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    for (int i = 0; i < balloonSize.length; i++) { //<>//
       if (balloonSize[i] > bigBalloon.size) { //<>//
          bigBalloon.size = balloonSize[i]; //<>//
       }
    }
    
    
    return balloons[0];
  }
  
  public void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PVector.angleBetween(vel,new PVector(0,-1)));
    fill(255);
    circle(0,0,SIZE);
    fill(0);
    circle(0,-SIZE/3,SIZE/3);
    popMatrix();
  }
}
