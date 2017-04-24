/* Project Name: Hex Display
 * Author: Ashley Trinh
 * Date: 12/3/2013
 * Description: An applet to convert decimal input to binary
 */

import processing.serial.*;

PFont f; //font
String input = ""; //store input
String output = ""; //store binary output
String binary = "";
char[] binArray;
int inputInt;

Serial port;

void setup() {
  size(300, 200);
  f = createFont("Arial", 12, true);

  // List all the available serial ports in the output pane.
  // You will need to choose the port that the Arduino board is
  // connected to from this list. The first port in the list is
  // port #0 and the third port in the list is port #2.
  println(Serial.list());

  // Open the port that the Arduino board is connected to (in this case #0)
  // Make sure to open the port at the same speed Arduino is using (9600bps)
  port = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  background(0);
  int indent = 10;

  //Set up font and color
  textFont(f);
  fill(191, 255, 0);

  //Display
  text("Enter a number from 0 to 15, \nHit return to get the binary equivalent.", indent, 40);
  text("Number: " + input, indent, 90);
  text("Binary: " + output, indent, 130);


}

void keyPressed() {
  if (key >= '0' && key <= '9') {
    input = input + key; //Concatenate string
  }

  else if (key == '\n') {
    inputInt = Integer.parseInt(input); //Convert String to int for calculation
    if (inputInt > 15) {
      output = "Invalid number. \nPlease enter a number between 0 and 15."; //Prompt user again
      input = ""; //Clear input
    }

    else {
      //Convert input to binary
      binary = Integer.toBinaryString(inputInt);
      int length = binary.length();
      //Add zeroes where appropriate
      switch (length) {
        case 1:
          output = "000" + binary;
          //Parse string to char[] to start writing data to port
          binArray = output.toCharArray();
          this.writeToPort();
          break;
        case 2:
          output = "00" + binary;
          binArray = output.toCharArray();
          this.writeToPort();
          break;
        case 3:
          output = "0" + binary;
          binArray = output.toCharArray();
          this.writeToPort();
          break;
        case 4:
          output = binary;
          binArray = output.toCharArray();
          this.writeToPort();
          break;
      }
      input = ""; //Clear input
    }
  }
}

void writeToPort() {
  //port.write('A');
  int j = 7;
  for (int i = 0; i < binArray.length; i++) {
    if (binArray[i] == '1') {
      //port.write((char)((j-i) + '1'));
      println((char)('D'-i));
      port.write((char)('D'-i));
    }
    else {
      //port.write((char)((j-i) + '0'));
      println((char)('H'-i));
      port.write((char)('H'-i));
    }
  }
}








