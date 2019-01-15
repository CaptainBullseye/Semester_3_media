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

//****************************** Eerste ******************************//

for(int i = 0; i < NUM_LINES; i++) {
  line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
  }
  
  t += 0.5;

//****************************** Tweede ******************************//

  stroke(255,0,0);
  noFill();
for(int e = 0; e < NUM_LINES; e++) {
  line(x3(t + e), y3(t + e), x4(t + e), y4(t + e));
  }  
  
  p += 0.5;

//****************************** Derde ******************************//
  
  stroke(0,255,0);
  for(int q = 0; q < NUM_LINES; q++) {
  line(x5(t + q), y5(t + q), x6(t + q), y6(t + q));
  }
    
  h += 0.5;
  
//****************************** Vierde ******************************//

  stroke(0,0,255);
  noFill();
for(int z = 0; z < NUM_LINES; z++) {
  line(x7(t + z), y7(t + z), x8(t + z), y8(t + z));
  }
  
  k += 0.5;
}

//********************** Derde figuur **********************//
float x5(float h) {
return cos(h/10) * 100 + cos(h/5) * 20;  
}

float y5(float h) {
return sin(h/10) * 100;  
}

float x6(float h) {
return cos(h/10) * 200 + cos(h) * 2;  
}

float y6(float h) {
return sin(h/20) * 200 + sin(h/12) * 20;  
}
float h;
//********************** Einde Derde figuur **********************//



//********************** Vierde figuur **********************//
float x7(float k) {
return cos(-k/10) * 100 + cos(-k/5) * 20;  
}

float y7(float k) {
return sin(-k/10) * 100;  
}

float x8(float k) {
return cos(-k/10) * 200 + cos(-k) * 2;  
}

float y8(float k) {
return sin(-k/20) * 200 + sin(-k/12) * 20;  
}
float k;
//********************** Einde Vierde figuur **********************//
