import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;
ControlHat hat;

float LstickPosX, LstickPosY;
float RstickPosX, RstickPosY;

float vkBtnSize;
float kruisBtnSize;
float rondBtnSize;
float driehoekBtnSize;

float L1btnSize;
float R1btnSize;
float L2btnSize;
float R2btnSize;
float L3btnSize;
float R3btnSize;

float shareBtnSize;
float optionsBtnSize;
float PSbtnSize;
float touchBtnSize;

float StickRotRad = 80, stickRotSize = StickRotRad * 2;
float stickRad = 50, stickSize = stickRad * 2;

public void setup() {
  size(1000, 600);
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  gpad = control.getMatchedDevice("controller_layout");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
}

public void draw() {
  background(0);
  
  // Events bij het indrukken van knoppen
//********************************* D-PAD *****************************************//
  boolean VK = gpad.getButton("VIERKANT").pressed();
  vkBtnSize = VK ? stickSize * 0.6f : stickSize * 0.0f;
  
  boolean kruis = gpad.getButton("KRUIS").pressed();
  kruisBtnSize = kruis ? stickSize * 0.6f : stickSize * 0.0f; 
  
  boolean rond = gpad.getButton("ROND").pressed();
  rondBtnSize = rond ? stickSize * 0.6f : stickSize * 0.0f; 
  
  boolean driehoek = gpad.getButton("DRIEHOEK").pressed();
  driehoekBtnSize = driehoek ? stickSize * 0.6f : stickSize * 0.0f; 
//*********************************************************************************//  
//*******************************TRIGGERS******************************************//  
  boolean L1 = gpad.getButton("L1").pressed();
  L1btnSize = L1 ? stickSize * 0.7f : stickSize * 0.0f;
  
  boolean R1 = gpad.getButton("R1").pressed();
  R1btnSize = R1 ? stickSize * 0.7f : stickSize * 0.0f; 
  
  boolean L2 = gpad.getButton("L2").pressed();
  L2btnSize = L2 ? stickSize * 0.8f : stickSize * 0.0f; 
  
  boolean R2 = gpad.getButton("R2").pressed();
  R2btnSize = R2 ? stickSize * 0.8f : stickSize * 0.0f;
//*********************************************************************************//  
//******************************** Joy-Sticks ***************************************************************************//  
  LstickPosX =  0.9f * map(gpad.getSlider("XPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  LstickPosY =  0.9f * map(gpad.getSlider("YPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  RstickPosX =  0.9f * map(gpad.getSlider("XPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  RstickPosY =  0.9f * map(gpad.getSlider("YPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  boolean L3 = gpad.getButton("L3").pressed();
  L3btnSize = L3 ? stickSize * 0.7f : stickSize * 0.0f;
  
  boolean R3 = gpad.getButton("R3").pressed();
  R3btnSize = R3 ? stickSize * 0.7f : stickSize * 0.0f;
//************************************************************************************************************************//   
//********************************EXTRA-BUTTONS*************************************//  
  boolean share = gpad.getButton("Share").pressed();
  shareBtnSize = share ? stickSize * 0.4f : stickSize * 0.0f;
  
  boolean options = gpad.getButton("Options").pressed();
  optionsBtnSize = options ? stickSize * 0.4f : stickSize * 0.0f; 
  
  boolean PSbtn = gpad.getButton("PSbtn").pressed();
  PSbtnSize = PSbtn ? stickSize * 0.6f : stickSize * 0.0f; 
  
  boolean touch = gpad.getButton("Touchpad").pressed();
  touchBtnSize = touch ? stickSize * 1.4f : stickSize * 0.0f; 
//**********************************************************************************//

hat = gpad.getHat("Arrows");

  float directionX = hat.getX();
  float directionY = hat.getY();
  
  if (directionX == -1.0) {
        drawLeft(70,190);
  }
  
  if (directionY == 1.0) {
        drawDown(100,220);
  }
  
  if (directionX == 1.0) {
        drawRight(130,190);
  }
  
  if (directionY == -1.0) {
        drawUp(100,160);
  }
  

//******************Drawing everything***************************//
  drawLeftStick(width/2 - 120, 500);
  drawRightStick(width/2 + 120, 500);
  
  drawVK(370,190);
  drawKruis(400,220);
  drawRond(430,190);
  drawDriehoek(400,160);
  
  drawL1(80,90);
  drawR1(380,90);
  drawL2(76,30);
  drawR2(376,30);
  
  drawShare(150,150);
  drawOptions(350,150);
  drawPSbtn(250,250);
  drawTouch(178,140);
}

public void drawLeftStick(int x, int y) {
  pushMatrix();
  translate(x, y);  
  noStroke();
  fill(120, 100, 220);
  ellipse(LstickPosX, LstickPosY, stickSize, stickSize);
  fill(255,0,0);
  ellipse(LstickPosX, LstickPosY, L3btnSize, L3btnSize);
  popMatrix();
}

public void drawRightStick(int x, int y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(120, 100, 220);
  ellipse(RstickPosX, RstickPosY, stickSize, stickSize);
  fill(255,0,0);
  ellipse(RstickPosX, RstickPosY, R3btnSize, R3btnSize);
  popMatrix();
}

public void drawVK(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,107,255);
  ellipse(x, y, vkBtnSize, vkBtnSize);
  popMatrix();
}

public void drawKruis(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(66,154,255);
  ellipse(x, y, kruisBtnSize, kruisBtnSize);
  popMatrix();
}

public void drawRond(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,58,65);
  ellipse(x, y, rondBtnSize, rondBtnSize);
  popMatrix();
}

public void drawDriehoek(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(12,255,61);
  ellipse(x, y, driehoekBtnSize, driehoekBtnSize);
  popMatrix();
}

public void drawL1(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,255,0);
  rect(x, y, L1btnSize + 20, L1btnSize);  
  popMatrix();
}

public void drawR1(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,205,0);
  rect(x, y, R1btnSize + 20, R1btnSize);  
  popMatrix();
}

public void drawL2(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,155,0);
  rect(x, y, L2btnSize + 25, L2btnSize);
  popMatrix();
}

public void drawR2(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,105,0);
  rect(x, y, R2btnSize + 25, R2btnSize);  
  popMatrix();
}
public void drawShare(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, shareBtnSize, shareBtnSize);
  popMatrix();
}

public void drawOptions(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, optionsBtnSize, optionsBtnSize);
  popMatrix();
}

public void drawPSbtn(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, PSbtnSize, PSbtnSize);
  popMatrix();
}

public void drawTouch(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  rect(x, y, touchBtnSize + 150, touchBtnSize);
  popMatrix();
}

public void drawLeft(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, stickSize * 0.6f, stickSize * 0.6f);
  popMatrix();
}

public void drawDown(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, stickSize * 0.6f, stickSize * 0.6f);
  popMatrix();
}

public void drawRight(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, stickSize * 0.6f, stickSize * 0.6f);
  popMatrix();
}

public void drawUp(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, stickSize * 0.6f, stickSize * 0.6f);
  popMatrix();
}
