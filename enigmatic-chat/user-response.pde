/* Project Name: Enigmatic Chat
 * Author: Ashley Trinh
 * Date: 10/30/2014
 * Description: Enigmatic Chat is an asynchronous instant messenger
 * that allows users to transcend time and space.
 */

ArrayList<String> userIn = new ArrayList<String>();
PrintWriter chatlogWriter;

void writeToFile() {
  String newfile = "Chat"+String.valueOf(iteration)+".txt";
  chatlogWriter = createWriter(newfile);

  for(String str: userIn) {
    chatlogWriter.println(str);
    println(str+" written");
  }
  filename = newfile;
  println("file written at"+filename);
  chatlogWriter.flush();
  chatlogWriter.close();
}

void reset() {
  userIn.clear();
  listbox.clear();
  iteration++;
}

/* Stores all info about user response including date/time of
 * response, username, line number, and response text.
 */
class UserResponse {

  int linenum;
  String time;
  String username;
  String text;
  int count = 0;

  UserResponse() {
    time = "00:00:00";
    username = "Name";
    linenum = 0;
    text = "N/A";
  }

  UserResponse(int linenum, String time, String username, String text) {
    this.time = time;
    this.username = username;
    this.linenum = linenum;
    this.text = text;
    count++;
  }

  String toString() {
    String s = String.valueOf(this.linenum)+"|"+this.time+"|"+this.username+"|"+this.text;
    return s;
  }

  void remember() {
    userIn.add(this.toString());
  }
}
