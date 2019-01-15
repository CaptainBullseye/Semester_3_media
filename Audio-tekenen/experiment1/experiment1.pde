void setup() {
  size(450,350);
  background(0);
  smooth();
  noFill();
}

void draw() {
  noStroke();
  // fade
  fill(0,9);
  rect(0,0,width,height);
  // Ellipse
  stroke(255);
  noFill();
  ellipse(mouseX, mouseY, 50, 90);
 
  
}
