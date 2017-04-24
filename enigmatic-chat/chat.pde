/* Project Name: Enigmatic Chat
 * Author: Ashley Trinh
 * Date: 10/30/2014
 * Description: Enigmatic Chat is an asynchronous instant messenger
 * that allows users to transcend time and space.
 */

// Displays any text to the chat window
void writeToOutput(String time, String author, String toWrite, int ID) {
    switch(ID) {
      case SYSTEM:
        ListBoxItem lbi = listbox.addItem(time+"     "+author + ":  " + toWrite, lineNum);
        lbi.setColorBackground(color(0));
        println("****FUNCTION writeToOutput******");
        println("Phrase: "+toWrite+"  @ line number"+lineNum);
        lineNum++;
        break;
      case USER:
        ListBoxItem lbi2 = listbox.addItem(time+"     "+author + ":  " + toWrite, lineNum);
        UserResponse ur = new UserResponse(lineNum,time,author,toWrite);
        ur.remember();
        println("****FUNCTION writeToOutput******");
        println(ur.toString());
        lineNum++;
        break;
      case BOT:
        ListBoxItem lbi3 = listbox.addItem(time+"     "+author + ":  " + toWrite, lineNum);
        lbi3.setColorBackground(colors.getForeground());
        lbi3.setColorForeground(colors.getBackground());
        println("****FUNCTION writeToOutput******");
        println("Phrase: "+toWrite+"@ line number"+lineNum);
        lineNum++;
        break;
    }
}

void botReply() {
  String reply;
  if (iteration == 1) {
    try {
    reply = defaultReader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      reply = null;
    } if (reply != null) {
      writeToOutput(timestmp.toString(),"Ghost", reply, BOT);
    } else {

    }
  } else {
    println("Iteration" + iteration);
    BufferedReader br = createReader(filename);
    String[] past = parseReply(br);
    writeToOutput(past[1],past[2],past[3],BOT);
  }

}

String[] parseReply(BufferedReader b) {
  String s;
  String[] list = new String[4];
  try {
    s = b.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    s = null;
  } if (s != null) {
    list = split(s,"|");
    return list;
  } else {return list;}
}

// Hitting enter/return and submit button do the same thing
// Maybe try using plugTo() instead
public void input(String theText) {
  submit();
}

long timeToReply;
public void submit() {
  if (username != null) {
    String inputText = field.getText(); // Get input from textfield
    gui.get(Textfield.class,"input").clear();
    writeToOutput(timestmp.toString(),username, inputText, USER);
    timeToReply = millis() + 500; // the time bot's reply should appear on screen
    listboxUpdated = true;
  } else {
    writeToOutput(timestmp.toString(),"SYSTEM", "You did not enter a username.", SYSTEM);
    writeToOutput(timestmp.toString(),"SYSTEM", "Please enter your username in the OPTIONS box to the left.", SYSTEM);
  }
}

public void name(String theText) {

}

public void startchat() {
  if(iteration >= 1) {
    writeToFile();
    reset();
    println("Chat with past");
  } else {
    println("Default chat");
    reset();
  }
  username = name.getText();
  writeToOutput(timestmp.toString(),"SYSTEM", "Welcome, "+username+"!", SYSTEM);
  name.clear();
}

// Enable mouse scroll functionality
void addMouseWheelListener() {
  frame.addMouseWheelListener(new java.awt.event.MouseWheelListener() {
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent e) {
      gui.setMouseWheelRotation(e.getWheelRotation());
    }
  }
  );
}

// Make the submit button flash when you press ENTER
void keyEvent() {
  if(keyPressed == true) {
    if(key == ENTER || key == RETURN) {
      button.setColorBackground(colors.getForeground());
    }
  } else { button.setColorBackground(colors.getBackground()); }
}







