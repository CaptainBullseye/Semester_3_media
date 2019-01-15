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

float LstickPosX, LstickPosY, pupilSize;
float RstickPosX, RstickPosY;

float StickRotRad = 80, stickRotSize = StickRotRad * 2;
//float browSize =  stickRotSize * 1.2f, browFactor;
float stickRad = 42, stickSize = stickRad * 2;
//float lidPos, restLid = PI * 0.3f, minLid = restLid/1.5f, maxLid = PI * 0.92f;

public void setup() {
  size(400, 240);
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
  // Either button will dilate pupils
  boolean dilated = gpad.getButton("PUPILSIZE1").pressed() || gpad.getButton("PUPILSIZE2").pressed();
  pupilSize = dilated ? stickSize * 0.6f : stickSize * 0.45f; 
  
  LstickPosX =  0.9f * map(gpad.getSlider("XPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  LstickPosY =  0.9f * map(gpad.getSlider("YPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  RstickPosX =  0.9f * map(gpad.getSlider("XPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  RstickPosY =  0.9f * map(gpad.getSlider("YPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  // Eyebrow first
  //lidPos = gpad.getSlider("EYELID").getValue();
  //browFactor = (lidPos >= 0) ? 1 : map(lidPos, 0, -1, 1.1f, 1.3f);
  
  // Now the actual lids
  //lidPos = map(lidPos, -0.12f, 1, restLid, maxLid);
  //lidPos = constrain(lidPos, minLid, maxLid);
  
  // DRaw a pir of eyes
  drawLeftStick(100, 140);
  drawRightStick(300, 140);
  //drawEye(300, 140);
  
  //print(LstickPosX);
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
  ellipse(LstickPosX, LstickPosY, stickSize, stickSize);
  
  popMatrix();
}
