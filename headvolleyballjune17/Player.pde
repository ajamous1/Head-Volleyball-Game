

class Player {
  float player1X, player1Y, speedY, ay, speedX, ax, speed;
  boolean canJump, Jumping, twoplayer;
  int touches, player1SizeX = 600, player1SizeY = 400, lineY;







  boolean canMove() {
    // boundary checks for different sizes of player
    if (player1X > width/2 - 480 && num1 == 0) {
      ax = 0;
      speedX = 0;
      player1X = width/2 - 480;  
      return false;
    } else if (player1X < -330 && num1 == 0) {
      ax = 0;
      speedX = 0;
      player1X = -330;
      return false;
    } else if (player1X > width/2 - 700 &&  num1 == 1) {
      ax = 0;
      speedX = 0;
      player1X = width/2 - 700;
      return false;
    } else if (player1X < -500 && num1 == 1) {
      ax = 0;
      speedX = 0;
      player1X = -500;

      return false;
    } else if (player1X > width/2 - 210 && num1 == 2) {
      ax = 0;
      speedX = 0;
      player1X = width/2 - 210;
      return false;
    } else if (player1X < -210 && num1 == 2) {
      ax = 0;
      speedX = 0;
      player1X = -210;

      return false;
    } else 

    return true;
  }


  Player() {
    // makes player2 inherit player1 qualities; I don't have to call every int and float again
    super();
    lineY = 700;
    player1X = -100;
    player1Y = 700;
    speedY = 0;
    ay = 0;
    ax = 0;
    speedX = 0;
    speed = 0.001;
    canJump = true;
    Jumping = false;
    touches = 3;
  }

  //how many touches can the player hit on each side?
  /*void touch() {
   if(hit() == true && ball.ballx < width/2){
   touches = touches -1;
   
   
   } else if (ball.ballx > width/2){
   touches = 3;
   
   }
   
   fill(255);
   for (int i = 1; i < touches + 1; i = i + 1) {
   ellipse( 75 * i, 50, 50, 50);
   if (hit() == true) {
   i = 3;
   }
   }
   } 
   */


  void draw() {
    // so I don't have to call every function once 
    // touch();
    speedY += ay;
    player1Y += speedY;
    speedX += ax;
    player1X += speedX;
    landed();
    // text(touches, 200, 50);
    image(p1select[screen.s1], player1X, player1Y, player1SizeX, player1SizeY);
  }

  void jump() {
    // prevents double jump
    if (canJump) {
      canJump = false;
      Jumping = true;
      speedY = -10;
      ay = 0.32;
    }
  }
  void landed() {
    // checks if you can jump again
    if ( player1Y >= lineY) {
      player1Y = lineY;
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
    // if you are within boundaries, then you can move backward when you call this function
    if (canMove() == true) {
      speedX = -10;
      ax = 0.22;
    } else {
      speedX = 0;
      ax = 0;
    }
  }
}
