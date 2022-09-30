

class Ball {
  float ballx = 300, bally = 150, gravity = 0.13, speed, speedx;
  int ballSize = 100, aligner = -ballSize + 50, score1, score2;
  void score() {
    if (bally > 930 && ballx > width/2 /*|| p2.touches == 0*/) {

      score1 += 1;
      bally = 90;
      ballx = 400;
      speedx = 0;
     
    } else  if(bally > 930 && ballx < width/2 /*|| player.touches == 0*/){
      
      score2 += 1;
      bally = 90;
      ballx = 1200;
      speedx = 0;
    }
  
  }
  Ball() {
  }



  void show() {

    fill(255, 0);

    ellipse(ballx, bally, ballSize, ballSize);
    // does the ball have a powerup?
    if (ballnum != 3) {
      image(vball, ballx + aligner, bally + aligner, ballSize, ballSize);
    }
    if (ballnum == 4) {
      aligner = -ballSize + 100;

      // aligns image with the ball
    } else if (ballnum == 5) {
      aligner = -ballSize + 25;
    }
    bally += speed; 
    speed += gravity;
    ballx += speedx;
    if (ballnum == 3) {
      fill(195, 45, 229);
      image(superball, ballx + aligner, bally + aligner, ballSize, ballSize);
      
      if (num == 5) {
        aligner = -ballSize;
      } else if (ballnum == 4) {
        aligner = -ballSize + 50;
      }
    }

    if (speed > 10) {
      speed -= gravity;
    }
    if(speedx > 20){
      speedx = 20;
      
    }
    score();
  }

  // makes it easier to call all the functions at once
  void draw() {
    textSize(50);
    fill(255);
    text(score1, 100, 100);
    text(score2, width - 100, 100);
    update();
    show();
  }



  void update() {

    if (hit() == true && ithit == 1) {
      speedx += 6;
      speed *= -1;
    } else if (hit2() == true) {
      speedx -= 6;
      speed *= -1;
    }
    if (ballx > width) {
      speedx *= -1; 
      speedx += -0.2;
    } else if (ballx < 0) {
      speedx *= -1;
      speedx += 0.2;
    } else if (bally > 540 && ballx >= 945 && ballx <= 970){
      speedx *= -1;
      
      
    } else if (bally > 540 && ballx <= 945 && ballx >= 970){
      speedx *= -1;
      
      
    }
  }
  
 
}
