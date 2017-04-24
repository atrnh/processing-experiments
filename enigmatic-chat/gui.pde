/* Project Name: Enigmatic Chat
 * Author: Ashley Trinh
 * Date: 10/30/2014
 * Description: Enigmatic Chat is an asynchronous instant messenger
 * that allows users to transcend time and space.
 */

// All GUI elements are here

void createGUI() {
  gui = new ControlP5(this);

  CColor pink = new CColor(color(255,31,244),color(157,2,142),color(232,0,205),color(255),color(255));
  colors = gui.getColor();

  Group chat = gui.addGroup("chat")
                  .setPosition(220,20)
                  .setWidth(400)
                  .setBackgroundHeight(540)
                  .setBackgroundColor(color(0))
                  ;

  field = gui.addTextfield("input",5,515,335,20)
             .setGroup(chat)
             .setAutoClear(true)
             .setCaptionLabel("Type your reply & hit ENTER or press SEND to chat")
             ;
  field.captionLabel().align(LEFT, ControlP5.TOP_OUTSIDE);


  button = gui.addButton("submit",0,345,515,50,20)
              .setGroup(chat)
              ;

  button.captionLabel().set("SEND");
  button.captionLabel().align(CENTER, CENTER);

  listbox = gui.addListBox("output",5,5,390,510)
               .setUpdate(true)
               .setGroup(chat)
               .setOpen(true)
               .setItemHeight(20)
               .hideBar()
               .toUpperCase(false)
               ;

  listbox.captionLabel().hide();
  //listbox.setBehavior(new TimedReply());

  Group options = gui.addGroup("options")
                     .setPosition(10,(height/2)-125)
                     .setWidth(200)
                     .setBackgroundHeight(250)
                     .setBackgroundColor(color(0,0,0,70))
                     ;

  name = gui.addTextfield("name",5,16,190,20)
            .setGroup(options)
            .setAutoClear(false)
            .setFocus(true)
            .setCaptionLabel("What is your name?")
            ;
  name.captionLabel().toUpperCase(false);
  name.captionLabel().align(LEFT,ControlP5.TOP_OUTSIDE);

//  ControlFont labelfont = label.getValueLabel().getFont();
//  PFont pfont = labelfont.getFont();
//
//  name.captionLabel().setFont(labelfont);

  // bg (2,52,77), fg (1,108,158), active (0,180,234)
  // bg (255,31,244), fg (157,2,142), active (232,0,205)

  gui.addButton("startchat",2,65,45,70,20)
     .setGroup(options)
     .setCaptionLabel("Start Chat")
     .getCaptionLabel().align(CENTER, CENTER)
     ;
  timestmp = new ControlTimer();

}



