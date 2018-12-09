
class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G;

  
  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0.002);
    mass = m;
    
  }
  //newtons second law w/ mass
  void applyForce(PVector force) {

    PVector f = PVector.div(force, mass);
    acceleration.add(f);
    
    
  }
  
  
  
  PVector attract(Mover m) {
    

    //location = new PVector(mouseX, mouseY);
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 100.0, 900.0);
    
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    return force;
  }
  

    
  
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

    
    velocity.limit(10);
  }
  
  
  void worldBounce() {
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }
  
  void display() {
        
    
    noStroke();
    fill(255);
        //ellipse(location.x, location.y, mass*60, mass*60);

  }
}