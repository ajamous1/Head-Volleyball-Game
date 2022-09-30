class Powerups {
  int counter = (round(random(9000)+100));
  int []powernum = new int[4];
  int powerno = (round(random(4)+1)), powerx =(round(random(1000))+400), powery=(round(random(350))+200);

  Powerups() {
  }
  void show() {


    if (pwrup() == true && pwrhit == true) {
      if (powerno == 1) {
        bigBall();
        ballnum = 4;
      } else if (powerno == 2) {
        fill(195, 45, 229, 80);
        superBall();
        ballnum = 3;
      } else if (powerno == 3) {
        largePlayer();
        num = 1;
        if (lasthit == 1) {
          multiplier = 1.4;
          num1 = 1;
        } else if (lasthit == 2) {
          num2 = 1;
          multiplier1 = 1.4;
        }
      } else if (powerno == 4) {
        smallPlayer();
        num = 2;

        if (lasthit == 1) {
          num1 = 2;
          multiplier = 0.48;
        } else if (lasthit == 2) {
          num2 = 2;
          multiplier1 = 0.48;
        }
      } else if (powerno == 5) {
        smallBall();
        ballnum = 5;
      }
    }
  }

  void draw() {
    if (pwrhit == false) {
      if (powerno == 1 && powerno < 2) {
        image(bball, powerx - 50, powery - 50, 100, 100);
      } else if (powerno == 2 && 1 < powerno && powerno < 3) {
        image(sball, powerx - 50, powery - 50, 100, 100);
      } else if (powerno == 3) {
        image(bplayer, powerx - 50, powery -50, 100, 100);
      } else if (powerno == 4) {
        image(splayer, powerx - 50, powery - 50, 100, 100);
      } else if (powerno == 5) {
        image(smball, powerx - 50, powery - 50, 100, 100);
      }
    }
   
  }

 


  void bigBall() {

    ball.ballSize = 200;
  }

  void superBall() {

    if (ball.speedx > 0) {
      ball.speedx += 10;
    } else if (ball.speedx < 0) {
      ball.speedx -= 10;
    }
    ball.gravity = 0.01;
  }

  void smallBall() {

    ball.ballSize = 50;
  }
  /*lasthit tells me who was the last player to hit the ball. Based on that, I can give the qualities to the player who last hit it to get the powerup. 
   If the last player to hit the ball was player 1 and player 1 got the bigger powerup, then player 1 will get bigger.
   */

  void smallPlayer() {
    if (lasthit == 1) {
      player.player1SizeX = 300;
      player.player1SizeY = 200;
      player.player1Y = player.lineY;
      //adjusts the height accordingly
      player.lineY = height - 250;
    } else if (lasthit == 2) {

      p2.player2SizeX = 300;
      p2.player2SizeY = 200;
      p2.player2Y = height - 250;
      p2.player2Y = player.lineY;
      p2.lineY = height - 250;
      
    }
  }

  void largePlayer() {
    if (lasthit == 1) {
      player.player1SizeX = 900;
      player.player1SizeY = 600;
      player.player1Y =  player.lineY;
      player.lineY =  height - 550;
    } else if (lasthit == 2) {

      p2.player2SizeX = 900;
      p2.player2SizeY = 600;
      p2.player2Y =  player.lineY;
      p2.lineY =  height - 550;
    }
  }
}
