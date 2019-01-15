//********************** Eerste figuur **********************//
float x1(float t) {
return sin(t/10) * 100 + sin(t/5) * 20;  
}

float y1(float t) {
return cos(t/10) * 100;  
}

float x2(float t) {
return sin(t/10) * 200 + sin(t) * 2;  
}

float y2(float t) {
return cos(t/20) * 200 + cos(t/12) * 20;  
}
float t;
static final int NUM_LINES = 10;
//********************** Einde eerste figuur **********************//



//********************** Tweede figuur **********************//
float x3(float p) {
return sin(-p/10) * 100 + sin(-p/5) * 20;  
}

float y3(float p) {
return cos(-p/10) * 100;  
}

float x4(float p) {
return sin(-p/10) * 200 + sin(-p) * 2;  
}

float y4(float p) {
return cos(-p/20) * 200 + cos(-p/12) * 20;  
}
float p;
//static final int NUM_LINES2 = 10;
//********************** Einde Tweede figuur **********************//

void setup(){
background(0);
size(500,500);
}

void draw(){
  background(0);
//stroke(random(255), random(255), random(255));
stroke(255);
strokeWeight(5);
translate(width/2, height/2);

for(int i = 0; i < NUM_LINES; i++) {
  line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
  }
  
  t += 0.5;
  
  stroke(255,0,0);
  noFill();
for(int e = 0; e < NUM_LINES; e++) {
  line(x3(t + e), y3(t + e), x4(t + e), y4(t + e));
  }
  
  p += 0.5;
}
