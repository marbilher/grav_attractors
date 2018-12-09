
//set this to 60
Mover[] m = new Mover[60];
Attractor a;
float radius = 360;
int numPoints = 120;
float angle=TWO_PI/(float)numPoints;
int offset;
float increment;


void setup() {
  
  size(1000, 1000, FX2D);
  float increment = 0;
  pixelDensity(2);
  rotate(PI);
  
  for (int i = 0; i < m.length; i++) {
  pushMatrix();

  m[i] = new Mover(random(.25, .25), radius*cos(angle*i)+500,radius*sin(angle*i)+700);
  popMatrix();
  }
  
  a = new Attractor(mouseX, mouseY);

  frameRate(60);
  int offset = 500;
}

void draw() {
  int offset = 3;

  translate(width/6, -height/2);

  background(150,255,255);
  ellipseMode(CENTER);
  ellipse(width/2, height/2+increment, 400, 400);
  for (int i = 0; i < m.length; i++) {
      for (int j = 0; j < m.length; j++) {
        if (j != i) {
          if (dist(m[i].location.x, m[i].location.y, m[j].location.x, m[j].location.y) < 300) {
          strokeWeight(1.9);
          stroke(255, 55);
          line(m[i].location.x, m[i].location.y, m[j].location.x, m[j].location.y);
          strokeWeight(1.6);
          stroke(200,150,255,55);
          line(m[i].location.x+offset, m[i].location.y+offset, m[j].location.x+offset, m[j].location.y+offset);
          stroke(255, 255, 150,55);
          line(m[i].location.x-offset, m[i].location.y-offset, m[j].location.x-offset, m[j].location.y-offset); 


          }
          increment+= .00005;
  PVector force = m[j].attract(m[i]);

  a.attract(m[i]);
  force.div(55000);
  m[i].applyForce(force);
        }
  
  
  a.display();
  a.move();

  //m[i].worldBounce();
  m[i].update();
  m[i].display();
      }
  }
}