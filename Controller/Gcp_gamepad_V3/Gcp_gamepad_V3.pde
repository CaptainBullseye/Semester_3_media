import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;

float LstickPosX, LstickPosY;
float RstickPosX, RstickPosY;

float StickRotRad = 80, stickRotSize = StickRotRad * 2;
float stickRad = 42, stickSize = stickRad * 2;

public void setup() {
  size(400, 240);
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
  background(255, 200, 255);
  
  LstickPosX =  0.9f * map(gpad.getSlider("XPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  LstickPosY =  0.9f * map(gpad.getSlider("YPOSL").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  RstickPosX =  0.9f * map(gpad.getSlider("XPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  RstickPosY =  0.9f * map(gpad.getSlider("YPOSR").getValue(), -1, 1, -(StickRotRad - stickRad), StickRotRad - stickRad);
  
  drawLeftStick(100, 140);
  drawRightStick(300, 140);

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
