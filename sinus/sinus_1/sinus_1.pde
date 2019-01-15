float t;

void setup(){
background(0);
size(500,500);
}

void draw(){
//stroke(random(255), random(255), random(255));
stroke(255);
strokeWeight(5);
translate(width/2, height/2);

point(x1(t), y1(t));
t++;
}

float x1(float t) {
return sin(t/10) * 100 + sin(t/5) * 2;  
}

float y1(float t) {
return cos(t/10) * 100;  
}
