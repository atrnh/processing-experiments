/* Project Name: Enigmatic Chat
 * Author: Ashley Trinh
 * Date: 10/30/2014
 * Description: Enigmatic Chat is an asynchronous instant messenger
 * that allows users to transcend time and space.
 */

import controlP5.*;
import java.util.Properties;
import java.awt.Frame;
import java.awt.BorderLayout;

static final int USER = 1;
static final int BOT = 2;
static final int SYSTEM = 3;

ControlP5 gui;
ListBox listbox;
Button button;
CColor colors;
Textfield field;
Textfield name;
ControlTimer timestmp;

BufferedReader defaultReader;

int lineNum = 1;
int iteration = 0;
boolean listboxUpdated = false;
float timeElapsed;

String username;
String filename;



void setup() {
  size(630,570);
  createGUI();
  addMouseWheelListener();
  defaultReader = createReader("default_replies.txt");
}

void draw() {
  background(color(75));

  if(gui.isMouseOver(gui.getController("submit"))) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

 // parseChatlog();

  keyEvent();

  if(listboxUpdated) {
    if(millis() > timeToReply) {
      botReply();
      listboxUpdated = false;
    }
  }

}





