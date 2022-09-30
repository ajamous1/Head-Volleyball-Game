class Screen {
  int screen, s1, s2;


  void mainMenu() {
    textSize(50);
    image(title, 0, 0);
    textAlign(CENTER);
    rectMode(CENTER);
    fill(255);
    if (mouseX > 760 && mouseX < 1160 && mouseY > 490 && mouseY < 590) {
      fill(0, 255, 0);
    }
    hover();

    rect(width/2, height/2, 400, 100);


    fill(0);
    text("PLAY :)", width/2, height/2 + 15);
    fill(255);
    if (mouseX > 760 && mouseX < 1160 && mouseY > 690 && mouseY < 790) {

      fill(255, 0, 0);
    }
    rect(width/2, height/2 + 200, 400, 100);
    fill(0);

    text("QUIT", width/2, height/2 + 215);
  }


  void select() {
    image(select, 0, 0);
    hover();
    fill(255);
    rectMode(CENTER);
    textAlign(CENTER);
    rect(width/2, height/2, 200, 100, 30);
    fill(0);
    if (mouseX > 860 && mouseX < 1060 && mouseY > 490 && mouseY < 690) {

      fill(0, 255, 0);
    }
    text("START", width/2, height/2 + 15);
    image(p1select[s1], 0, 350, 850, 550);
    image(p2select[s2], 1050, 350, 850, 550);


    fill(0);
  }

  void p1win() {
    textSize(50);
    image(title, 0, 0);
    textAlign(CENTER);
    rectMode(CENTER);
    fill(255);
    if (mouseX > 760 && mouseX < 1160 && mouseY > 490 && mouseY < 590) {
      fill(0, 255, 0);
    }
    hover();

    rect(width/2, height/2, 400, 100);


    fill(0);
    text("PLAY :)", width/2, height/2 + 15);
    fill(255);
    if (mouseX > 760 && mouseX < 1160 && mouseY > 690 && mouseY < 790) {

      fill(255, 0, 0);
    }
    rect(width/2, height/2 + 200, 400, 100);
    fill(0);

    text("QUIT", width/2, height/2 + 215);
  }

  void p2win() {


    textAlign(CENTER);
    rectMode(CENTER);
    fill(255);
    textSize(100);
    text("PLAYER 2 WINS!", width/2, 150);

    hover();
    textSize(30);
    fill(255);
    if (mouseX > 760 && mouseX < 1160 && mouseY > 290 && mouseY < 390) {
      fill(0, 255, 0);
    }

    rect(width/2, height/2 - 200, 400, 100);
fill(0);
    text("PLAY AGAIN", width/2, height/2 - 185);
    fill(255);
    if (mouseX > 760 && mouseX < 1160 && mouseY > 490 && mouseY < 590) {
      fill(0, 255, 0);
    }
    
    rect(width/2, height/2, 400, 100);
   
 


    fill(0);
    text("CUSTOMIZE PLAYERS", width/2, height/2 + 15);
    fill(255);
    if (mouseX > 760 && mouseX < 1160 && mouseY > 690 && mouseY < 790) {

      fill(255, 0, 0);
    }
    rect(width/2, height/2 + 200, 400, 100);
    fill(0);

    text("QUIT", width/2, height/2 + 215);
  }
}
