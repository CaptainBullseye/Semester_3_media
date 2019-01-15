import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;

float LstickPosX, LstickPosY;
float RstickPosX, RstickPosY;
float upBtnSize;

float StickRotRad = 80, stickRotSize = StickRotRad * 2;
float stickRad = 42, stickSize = stickRad * 2;

public void setup() {
  size(1000, 600);
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  gpad = control.getMatchedDevice("gamepad_eyes");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
}

public void draw() {
  background(255, 200, 255);
  // Events bij het indrukken van knoppen
  boolean VK = gpad.getButton("PUPILSIZE1").pressed();
  upBtnSize = VK ? stickSize * 0.6f : stickSize * 0.0f;
  
  boolean kruis = gpad.getButton("PUPILSIZE1").pressed();
  upBtnSize = kruis ? stickSize * 0.6f : stickSize * 0.0f; 
  
  boolean rond = gpad.getButton("PUPILSIZE1").pressed();
  upBtnSize = rond ? stickSize * 0.6f : stickSize * 0.0f; 
  
  boolean driehoek = gpad.getButton("PUPILSIZE1").pressed();
  upBtnSize = driehoek ? stickSize * 0.6f : stickSize * 0.0f; 
  
  LstickPosX =  0.9f * map(gpad.getSlider("XPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  LstickPosY =  0.9f * map(gpad.getSlider("YPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  RstickPosX =  0.9f * map(gpad.getSlider("XPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  RstickPosY =  0.9f * map(gpad.getSlider("YPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  drawLeftStick(width/2 - 100, 500);
  drawRightStick(width/2 + 100, 500);
  
  drawVK(100,180);
  drawKruis(75,100);
  drawRond(125,180);
  drawDriehoek(175,100);

}

public void drawLeftStick(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  noStroke();
  fill(120, 100, 220);
  ellipse(LstickPosX, LstickPosY, stickSize, stickSize);
  
  popMatrix();
}

public void drawRightStick(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  noStroke();
  fill(120, 100, 220);
  ellipse(RstickPosX, RstickPosY, stickSize, stickSize);
  
  popMatrix();
}

public void drawVK(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255,0,0);
  ellipse(x, y, upBtnSize, upBtnSize);
  
  popMatrix();
}

public void drawKruis(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(0,255,0);
  ellipse(x, y, upBtnSize, upBtnSize);
  
  popMatrix();
}

public void drawRond(int x, int y) {
  pushMatrix();
  //translate(x, y);
  fill(0,0,255);
  ellipse(x, y, upBtnSize, upBtnSize);
  
  popMatrix();
}

public void drawDriehoek(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255);
  ellipse(x, y, upBtnSize, upBtnSize);
  
  popMatrix();
}
