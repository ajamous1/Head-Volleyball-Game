

// Here, I'm inheriting the Player Class Qualities from Player 2 since they have virtually the same variables
class Player2 extends Player {
  int player2SizeX = 600, player2SizeY = 400;
  float player2X, player2Y;

  boolean canMove() {
    // different restrictions since the player is on the other side of the net
    if (player2X > width - 250 && num2 == 0) {
      ax = 0;
      speedX = 0;
      player2X = width - 250;  
      return false;
    } else if (player2X < width/2 - 100 && num2 == 0) {
      ax = 0;
      speedX = 0;
      player2X = width/2 - 100;
      return false;
    } else if (player2X < width/2 - 200 && num2 == 1) {
      ax = 0;
      speedX = 0;
      player2X = width/2 - 200;
      return false;
    } else if (player2X > width  - 500 && num2 == 1) {
      ax = 0;
      speedX = 0;
      player2X = width - 500;
      println(num2);

      return false;
    } else if (player2X < width/2 - 50 && num2 == 2) {
      ax = 0;
      speedX = 0;
      player2X = width/2 - 50;
      return false;
    } else if (player2X >  width - 150 && num2 == 2) {
      ax = 0;
      speedX = 0;
      player2X = width - 150;

      return false;
    }

    return true;
  }

  Player2() {
    // inherited qualities from player 1
    lineY = 700;
    player2X = 800;
    player2Y = lineY;
    speedY = 0;
    ay = 0;
    ax = 0;
    speedX = 0;

    speed = 0.001;
    canJump = true;
    Jumping = false;
  }

// if the player touches the ball more than 3 times on their side, the other team gets a point
  /*void touch() {
    if (hit2() == true && ball.ballx > width/2) {
      touches = touches -1;
    } else if (ball.ballx < width/2) {
      touches = 3;
    } 
    fill(255);
    for (int i = 1; i < touches + 1; i = i + 1) {
      ellipse(width - 75 * i, 50, 50, 50);
      if (hit2() == true) {
        i = 3;
      }
    }
  }
 */


  void draw() {
    // makes it easier to call functions
    speedY += ay;
   // touch();
    player2Y += speedY;
    speedX += ax;
    player2X += speedX;
    landed();
    image(p2select[screen.s2], player2X, player2Y, player2SizeX, player2SizeY);
  }

  void jump() {
    if (canJump) {
      // prevents double jumping
      canJump = false;
      Jumping = true;
      speedY = -10;
      ay = 0.32;
    }
  }
  void landed() {
    // checks if you are at the floor and uses that to determine whether you can jump or not
    if ( player2Y >= lineY) {
      player2Y = lineY;
      speedY = 0;
      ay = 0;
      Jumping = false;
      canJump = true;
    }
  }

  void moveForward() {
    // if you are within boundaries, then you can move forward when you call this function
    if (canMove() == true) {
      speedX = 10;
      ax = 0.22;
    } else {

      speedX = 0;
      ax = 0;
    }
  }

  void moveBackward() {
    //  if you are within boundaries, then you can move backwards when you call this function
    if (canMove() == true) {
      speedX = -10;
      ax = 0.22;
    } else {
      speedX = 0;
      ax = 0;
    }
  }
}
