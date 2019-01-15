/**
 Basic demonstration of using a gamepad.
 
 When this sketch runs it will try and find
 a game device that matches the configuration
 file 'gamepad' if it can't match this device
 then it will present you with a list of devices
 you might try and use.
 
 The chosen device requires 3 sliders and 2 button.
 */

import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;

float LstickPosX, LstickPosY;
float RstickPosX, RstickPosY;

float vkBtnSize;
float kruisBtnSize;
float rondBtnSize;
float driehoekBtnSize;

float StickRotRad = 80, stickRotSize = StickRotRad * 2;
//float browSize =  stickRotSize * 1.2f, browFactor;
float stickRad = 50, stickSize = stickRad * 2;
//float lidPos, restLid = PI * 0.3f, minLid = restLid/1.5f, maxLid = PI * 0.92f;

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
  //background(255, 200, 255);
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
//******************************** Joy-Sticks ***************************************************************************//  
  LstickPosX =  0.9f * map(gpad.getSlider("XPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  LstickPosY =  0.9f * map(gpad.getSlider("YPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  RstickPosX =  0.9f * map(gpad.getSlider("XPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  RstickPosY =  0.9f * map(gpad.getSlider("YPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
//************************************************************************************************************************//   
  // Aanroepen functies
  drawLeftStick(width/2 - 120, 500);
  drawRightStick(width/2 + 120, 500);
  
  drawVK(370,190);
  drawKruis(400,220);
  drawRond(430,190);
  drawDriehoek(400,160);

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
  ellipse(x, y, vkBtnSize, vkBtnSize);
  
  popMatrix();
}

public void drawKruis(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(0,255,0);
  ellipse(x, y, kruisBtnSize, kruisBtnSize);
  
  popMatrix();
}

public void drawRond(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(0,0,255);
  ellipse(x, y, rondBtnSize, rondBtnSize);
  
  popMatrix();
}

public void drawDriehoek(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255);
  ellipse(x, y, driehoekBtnSize, driehoekBtnSize);
  
  popMatrix();
}
