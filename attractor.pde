
class Attractor {
  
  float mass;
  PVector location;
  float G;
  PVector movement;
  
  Attractor(float x, float y) {
    location = new PVector(random(width), random(height));
    mass = 5;
    float G = 5.9;
  }
  
  
  
  
  
  void move() {
    movement = new PVector (.02, .04);
    location.add(movement);
  }
  
  
  PVector attract(Mover m) {
    
    location = new PVector(mouseX, mouseY);
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 30.0, 100.0);
    
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    return force;
  }
  
  
  
  void display() {
    
    stroke(0);
    fill(175, 200);
    //ellipse(mouseX, mouseY, mass*2, mass*2);
  }
  
  
}