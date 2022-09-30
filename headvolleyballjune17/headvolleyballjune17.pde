
// Head Volleyball by Ahmad 
int counter;
PImage player1, player2, superball, bball, sball, smball, bplayer, splayer, vball, background, title, netpic, select;
float multiplier, multiplier1, lineY;
int rando = round(random(5000)+1500);
int num, num1, num2, ballnum, lasthit, time, ithit;
PImage p1select[] = new PImage[3];
PImage p2select[] = new PImage[3];
Ball ball;
Player2 p2;
Player player;
Powerups powerups;
Net net;
Screen screen;
// hit detection for player 1
boolean pwrhit;
boolean hit() {

  if (dist(player.player1X + 375 * multiplier, player.player1Y + 110 * multiplier, ball.ballx, ball.bally)< 50) {

    lasthit = 1;
    ithit = 1;

    return true;
  } else if(ithit == 1){
    return false;
    
  } else
   


  return false;
}
// hit detection for player 2
boolean hit2() {
  if (dist(p2.player2X + 225 * multiplier1, p2.player2Y + 110 * multiplier1, ball.ballx, ball.bally)< 50) {
    lasthit = 2;
    ithit = 1;

    return true;
  } 
  if (ithit == 1) {
    return false;
  } else 


  return false;
}


// powerup detection
boolean pwrup() {
  if (dist(ball.ballx, ball.bally, powerups.powerx, powerups.powery)< 75) {
    println("SUPER");
    pwrhit = true;

    return true;
  } else if (pwrhit == false) {

    return false;
  } else

    return false;
}
// powerup detection: bigger
boolean bigger() {
  if (powerups.powerno == 3) {

    num = 1;
    return true;
  } else
    return false;
}
//powerup detection: smaller
boolean smaller() {
  if (powerups.powerno == 4) {
    num = 2;
    return true;
  } else
    return false;
}

void setup() {
  multiplier1 = 1;
  // multiplier for player 2
  multiplier = 1;
  // multiplier for player 1
  time = 100;
  frameRate(120);
  size(1920, 1080);
  //defining all objects, ints, etc.
  net = new Net();
  ball = new Ball();
  player = new Player();
  p2 = new Player2();
  powerups = new Powerups();
  screen = new Screen();
  superball = loadImage("sball.png");
  vball = loadImage("ball.png");
  player1 = loadImage("player1.png");
  player2 = loadImage("player2.png");
  bball = loadImage("bigball.png");
  sball = loadImage("superball.png");
  bplayer = loadImage("bigplayer.png");
  splayer = loadImage("smallplayer.png");
  smball = loadImage("smallball.png");
  background = loadImage("bg.png");
  title = loadImage("title.png");
  netpic = loadImage("net.png");
  select = loadImage("playerselect.png");
  p1select[0] = loadImage("player1.png");
  p1select[1] = loadImage("player1candy.png");
  p1select[2] = loadImage("player1formal.png");
  p2select[0] = loadImage("player2.png");
  p2select[1] = loadImage("player2candy.png");
  p2select[2] = loadImage("player2formal.png");

  lineY = 700;
  counter = round(random(1000));
  noStroke();
}

void draw() {
  background(90, 210, 235);
  if (screen.screen == 0) {
    screen.mainMenu();
  } else if (screen.screen == 1) {
    screen.select();
  } else if (screen.screen == 2) {

    // text(time, 1000, 50);
    // text(counter, 900, 50);


    fill(255);
    // draws floor
    ground();
    //shows powerups
    powerups.show();
    // calls hit detection function
    hit();
    hit2();
    // fill(255, 0, 0);
    //  ellipse(p2.player2X + 225 * multiplier1, p2.player2Y + 110 * multiplier1, 25, 25);
    // fill(0, 255, 0);
    // ellipse(player.player1X + 375 * multiplier, player.player1Y + 110 * multiplier, 75, 75);

    // fill(255, 0, 0);
    //ellipse(player.player1X + 375, player. player1Y + 110, 25, 25);

    //ellipse(player.player1X + 190, player. player1Y + 60, 25, 25);

    // ellipse(player.player1X + 550, player. player1Y + 180, 25, 25);
    // draws ball, powerups, player 2, etc,
    ball.draw();
    powerups.draw();
    p2.draw();
    player.draw();
    //text(ithit, 300, 50);
    //checks if player are within the boundaries
    p2.canMove();
    player.canMove();
    net.show();
    timer();
    // ellipse(powerups.powerx, powerups.powery, 75, 75);
    // fill(255);
    // text(powerups.powerno, powerups.powerx, powerups.powery);

    fill(255);
    textSize(30);
    /*  text(p2.player2X, 50, 50);
     text(width/2, 400, 50);
     text(375 * multiplier, 600, 50);
     */
    // text(mouseX + "," + mouseY, 800, 50);
    //text(num, 1000, 50);

    if (ball.score1 > 10) {
      screen.screen = 3;
    } else if (ball.score2 > 10) {
      screen.screen = 4;
    }
  } else if (screen.screen == 3) {
    screen.p1win();
    ball.score1 = 0;
    ball.score2 = 0;
  } else if (screen.screen == 4) {
    screen.p2win();
    ball.score1 = 0;
    ball.score2 = 0;
  }
}

void ground() {
  image(background, 0, 0);
  //net
  fill(255);
  //rect(rectx, recty, rectw, rectl);
  //sand
  fill(210, 180, 140);
  //rect(0, 980, 1920, 100);
}


/*void cooldown() {
 time -= 10;
 if (time <= 0) {
 time = 100;
 counter = 100;
 }
 } */
//randomizes if/when powerups spawn
void timer() {
  counter += round(random(15));
  if (counter > rando) {
    resetpos();
    counter = 0;
    pwrhit = false;
  } 
  if (counter < rando && pwrhit == true) {
    //sets the powerups to the side if you've hit it
    powerups.powerx = width + 100;
    powerups.powery = height + 100;
  }
}
/*
void reset() {
 // for testing purposes
 ball.ballx = 400;
 player.player1X = -130;
 ball.bally = 150;
 ball.gravity = 0.13;
 ball.speedx = 0;
 powerups.powerx = (round(random(1000))+400);
 powerups.powery = (round(random(350))+200);
 powerups.powerno = (round(random(4)+1));
 }
 */
//resets position of powerups
void resetpos() {
  powerups.powerx = (round(random(1000))+400);
  powerups.powery = (round(random(350))+200);
  powerups.powerno = (round(random(4)+1));
}
void keyPressed() {
  if (key == 'w' || key == 'W') {
    //calling functions
    player.jump();
    player.canMove();
  } else if (key == 'd' || key == 'D') {
    player.moveForward();
    player.canMove();
  } else if (key == 'a' || key == 'A') {
    player.moveBackward();
    player.canMove();
  }

  if (keyCode == UP) {
    p2.jump(); 
    p2.canMove();
  } else if (keyCode == RIGHT) {
    p2.moveForward();
    p2.canMove();
  } else if (keyCode == LEFT) {
    p2.moveBackward();
    p2.canMove();
  }
}

void hover() {
  
}

void keyReleased() {
  if (key == 'd' || key == 'D') {
    // so you can control when to start/stop
    player.ax = 0;
    player.speedX = 0;
    player.canMove();
  } else if (key == 'a' || key == 'A') {

    player.ax = 0;
    player.speedX = 0;
    player.canMove();
  } else if (key == 'r' || key == 'R') {
    //  reset();
  }

  if (keyCode == UP) {
    p2.ax = 0; 
    p2.speedX = 0;
    p2.canMove();
  } else if (keyCode == RIGHT) {
    p2.ax = 0; 
    p2.speedX = 0;
    p2.canMove();
  } else if (keyCode == LEFT) {
    p2.ax = 0; 
    p2.speedX = 0;
    p2.canMove();
  }
}

void mousePressed() {
  //mainly player customization, but also button functions
  if (screen.screen == 0) {
    if (mouseX > 760 && mouseX < 1160 && mouseY > 690 && mouseY < 790) {
      exit();
    } else if (mouseX > 760 && mouseX < 1160 && mouseY > 490 && mouseY < 590) {
      fill(0, 255, 0);
      screen.screen = 1;
    }
  } else if (screen.screen == 1) {
    if (mouseX > 50 && mouseX < 180 && mouseY > 580 && mouseY < 740) {
      screen.s1 -= 1;
      if (screen.s1 < 0) {
        //helps cycle and prevents an out of bounds exception
        screen.s1 = 2;
      }
    } else if (mouseX > 660 && mouseX < 790 && mouseY > 580 && mouseY < 740) {
      screen.s1 += 1;
      if (screen.s1 > 2) {
        screen.s1 = 0;
      }
    } else if (mouseX > 1100 && mouseX < 1230 && mouseY > 580 && mouseY < 740) {
      screen.s2 -= 1;
      if (screen.s2 < 0) {
        screen.s2 = 2;
      }
    } else if (mouseX > 1720 && mouseX < 1850 && mouseY > 580 && mouseY < 740) {

      screen.s2 += 1;
      if (screen.s2 > 2) {
        screen.s2 = 0;
      }
    } else if (mouseX > 860 && mouseX < 1060 && mouseY > 490 && mouseY < 690) {

      screen.screen = 2;
    }
  } else if (screen.screen == 3) {
    if (mouseX > 760 && mouseX < 1160 && mouseY > 690 && mouseY < 790) {
      screen.screen = 1;
    } else if (mouseX > 760 && mouseX < 1160 && mouseY > 490 && mouseY < 590) {
      fill(0, 255, 0);
      screen.screen = 2;
    }
  } else if (screen.screen == 4) {
    if (mouseX > 760 && mouseX < 1160 && mouseY > 290 && mouseY < 390) {
      screen.screen = 2;
    } else if (mouseX > 760 && mouseX < 1160 && mouseY > 490 && mouseY < 590) {
      fill(0, 255, 0);
      screen.screen = 1;
    } else if (mouseX > 760 && mouseX < 1160 && mouseY > 690 && mouseY < 790) {
      exit();
    }
  }
}
