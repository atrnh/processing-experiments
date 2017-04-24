/* Project Name: Dada Poetry Generator
 * Author: Ashley Trinh
 * Date: 12/5/2014
 */

PFont f;
String[] words;
String storeWord = "";
String currWord = "";
color black;

// Stuff for the save button
int savX, savY; // Position of save button (600x449)
int savWidth = 82; // Button width
int savHeight = 33; // Button height
color savColor, savHover; // Button colors
boolean savOver = false;

// Stuff for changing font color
int redX, redY;
int blueX, blueY;
int greenX, greenY;
int blackX, blackY; // Position of color buttons
int colorSize = 20; //Diameter of color buttons
color redColor, blueColor, greenColor;
color redHover, blueHover, greenHover, blackHover;
boolean redOver, blueOver, greenOver, blackOver = false;
boolean colorIsRed, colorIsGreen, colorIsBlue, colorIsBlack = false;

// Stuff for changing font size
PFont smFont, medFont, lgFont;
int smX, smY;
int medX, medY;
int lgX, lgY; // Position of size buttons
int szSize = 20; // Width and height of size buttons
color szColor, szHover;
boolean smOver, medOver, lgOver = false;
boolean fontIsSm, fontIsMed, fontIsLg = false;


void setup() {
  size(700, 500);
  background(255);
  f = createFont("Arial", 12, true);
  black = color(0);

  // Load text from file into an array
  String[] loadedWords = loadStrings("words.txt");
  // Join lines into one String for parsing
  String longString = join(loadedWords, " ");
  // Parse longString into words[]
  words = splitTokens(longString, " .,:;!?\"");

  // Draw GUI
  noStroke();
  fill(210);
  rect(0, 433, 700, 67);

  // Save button setup
  savColor = color(91, 210, 100);
  savHover = color(187, 224, 41);
  savX = 600;
  savY = 449;

  // Color change buttons setup
  redColor = color(238, 33, 47);
  blueColor = color(2, 127, 192);
  greenColor = color(13, 161, 17);
  redHover = color(238, 84, 95);
  greenHover = color(73, 193, 77);
  blueHover = color(64, 164, 216);
  blackHover = color(40);
  ellipseMode(CENTER);
  redX = 225;
  greenX = 250;
  blueX = 275;
  blackX = 300;
  redY = greenY = blueY = blackY = 454;

  // Size change buttons setup
  szColor = color(210);
  szHover = color(220);
  rectMode(CENTER);
  smX = 225;
  medX = 250;
  lgX = 275;
  smY = medY = lgY = 480;


  fill(0);
  text("Current word:", 10, 20);
  text("Click to change color of current word:", 10, 459);
  text("Click to change size of current word:", 10, 480);


}

void draw() {
  // Change button to hover color if mouse is hovered
  // over the button
  updateSav(mouseX, mouseY);

  if (savOver) {
    fill(savHover);
  } else {
    fill(savColor);
  }
  stroke(0);
  rect(savX, savY, savWidth, savHeight);
  fill(0);
  text("Save", 628, 470);

  updateColor(mouseX, mouseY);

  stroke(255);
  if (redOver) {
    fill(redHover);
  } else {
    fill(redColor);
  }
  ellipse(redX, redY, colorSize, colorSize);

  if (greenOver) {
    fill(greenHover);
  } else {
    fill(greenColor);
  }
  ellipse(greenX, greenY, colorSize, colorSize);

  if (blueOver) {
    fill(blueHover);
  } else {
    fill(blueColor);
  }
  ellipse(blueX, blueY, colorSize, colorSize);

  if (blackOver) {
    fill(blackHover);
  } else {
    fill(black);
  }
  ellipse(blackX, blackY, colorSize, colorSize);



}

/* MOUSE CLICK LISTENER */
void mousePressed() {
  if (mouseButton == RIGHT) {
    storeWord = getRandomWord();
    currWord = storeWord;
    fill(getCurrColor());
    text(currWord, 102, 20);
  }

  else if (mouseButton == LEFT) {

    updateColor(mouseX, mouseY);
    if (redOver) {
      colorIsRed = true;
      colorIsGreen = false;
      colorIsBlue = false;
      colorIsBlack = false;
      clearCurr();
      // update current word color
      fill(redColor);
      text(currWord, 102, 20);
    } else if (greenOver) {
      colorIsRed = false;
      colorIsGreen = true;
      colorIsBlue = false;
      colorIsBlack = false;
      clearCurr();
      fill(greenColor);
      text(currWord, 102, 20);
    } else if (blueOver) {
      colorIsRed = false;
      colorIsGreen = false;
      colorIsBlue = true;
      colorIsBlack = false;
      clearCurr();
      fill(blueColor);
      text(currWord, 102, 20);
    }
      else if (blackOver) {
      colorIsRed = false;
      colorIsGreen = false;
      colorIsBlue = false;
      colorIsBlack = true;
      clearCurr();
      fill(0);
      text(currWord, 102, 20);
    } else {
      placeWord(mouseX, mouseY);
    }
    //text(storeWord, mouseX, mouseY);

    // Save button functionality
    if (savOver) {
      //save as image file
    }

  }



}

/* GENERATE RANDOM WORD
 */
String getRandomWord() {

 return words[int(random(words.length))];

}

/* PLACE WORD WITH APPROPRIATE COLOR
 */
void placeWord(int x, int y) {
  if (colorIsRed) {
    fill(redColor);
  } else if (colorIsGreen) {
    fill(greenColor);
  } else if (colorIsBlue) {
    fill(blueColor);
  } else if (colorIsBlack) {
    fill(0);
  } else {
    fill(0);
  }
  text(storeWord, x, y);
  clearCurr();
}

/* CLEAR CURRENT WORD
 */
void clearCurr() {
  noStroke();
  fill(255);
  rect(100, 0, 394, 23);
}

/* GET CURRENT COLOR
 */
color getCurrColor() {
  if (colorIsRed) {
    return redColor;
  } else if (colorIsGreen) {
    return greenColor;
  } else if (colorIsBlue) {
    return blueColor;
  } else if (colorIsBlack) {
    return black;
  } else {
    return black;
  }
}

/* CHECK IF MOUSE IS ON SAVE BUTTON, RETURN TRUE IF MOUSE IS OVER BUTTON
 */
boolean overSav(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

/* CHECK IF MOUSE IS OVER A GIVEN CHANGE COLOR BUTTON, RETURN TRUE IF MOUSE
 * IS OVER THE BUTTON
 */
boolean overColor(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2) {
    return true;
  } else {
    return false;
  }
}

/* UPDATE MOUSE, IF MOUSE IS OVER ANY OF THOSE BUTTONS SOMETHING HAPPENS
 */
void updateSav(int x, int y) {
  if (overSav(savX, savY, savWidth, savHeight)) {
    savOver = true;
  } else {
    savOver = false;
  }
}

void updateColor(int x, int y) {
  // Mouse is over red button
  if (overColor(redX, redY, colorSize)) {
    redOver = true;
    greenOver = false;
    blueOver = false;
    blackOver = false;
  } else if (overColor(greenX, greenY, colorSize)) {
    redOver = false;
    greenOver = true;
    blueOver = false;
    blackOver = false;
  } else if (overColor(blueX, blueY, colorSize)) {
    redOver = false;
    greenOver = false;
    blueOver = true;
    blackOver = false;
  } else if (overColor(blackX, blackY, colorSize)) {
    redOver = false;
    greenOver = false;
    blueOver = false;
    blackOver = true;
  } else {
    redOver = greenOver = blueOver= blackOver = false;
  }
}


