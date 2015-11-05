PImage 
 bg1Img,
 bg2Img,
 enemyImg,
 fighterImg,
 hpImg,
 start1Img,
 start2Img,
 treasureImg;

final int 
 GAME_START = 0,
 GAME_PLAYING = 1,
 FIRST_WAVE=1,
 SECOND_WAVE=2,
 THIRD_WAVE=3;

int gameState = GAME_START;
int enemyWave = FIRST_WAVE;



int c;
int a , b =30, e, f;
{a=floor(random(420));
 b=floor(random(400));
 e=floor(random(420));
 f=floor(random(400));}
int d = 40;

int bg;

float x;
float y;
float speed = 5;

boolean 
 upPressed = false,
 downPressed = false,
 leftPressed = false,
 rightPressed = false;

void setup () {
  gameState = GAME_START;
  size(640, 480) ;
  c = 0;
  bg = 0;
  x = width/2;
  y = height/2;
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  enemyImg = loadImage("img/enemy.png");
  fighterImg = loadImage("img/fighter.png");
  hpImg = loadImage("img/hp.png");
  start1Img = loadImage("img/start1.png");
  start2Img = loadImage("img/start2.png");
  treasureImg = loadImage("img/treasure.png");
}

void draw() {
  image (start1Img, bg, 0);
  switch (gameState) {
  case GAME_START:
    if (mouseX > 200 && mouseX < 440 && mouseY > 370 && mouseY < 420) {
      if (mousePressed) {
        image (start2Img, bg, 0);
        gameState = GAME_PLAYING;
      } else {
        noStroke();
        fill(255, 255, 0, 100);
        rect(210, 380, 240, 30);
      }
    }
    break;

  case GAME_PLAYING:
    image(bg1Img, bg, 0);
    image(bg2Img, bg-bg1Img.width, 0);
    image(bg1Img, bg-bg1Img.width-bg2Img.width, 0);
    bg +=1;
    bg %=(bg1Img.width+bg2Img.width);

    image(treasureImg, a, b);
    
    stroke(0);
    fill(255, 0, 0);
    rect(20, 15, d, 15);
    if (d >= 0 && d<10){
      d = 40;
    }
    
    image(hpImg, 10, 10);

    float spacingX = 70;
    float spacingY = 70;
    float x1 = 0,x2 = 0, x3 = 0, y1 =random(40,height) , y2 =1/2*height, y3 =200;
    
 switch(enemyWave){    
 case FIRST_WAVE:        
 for(int i=0;i<5;i++){
 x1=spacingX*i;
 image(enemyImg,x1,y1);
 x1 += speed;
 if(x1 >= width)
 {enemyWave = SECOND_WAVE;}  
 }
 break;
 
 case SECOND_WAVE:  
 for(int j=0;j<5;j++){
 x2=spacingX*j; 
 image(enemyImg,x2,y2);
 y2-= spacingY;
 x2 += speed;
 if(x2 >= width)
 {enemyWave = THIRD_WAVE;}  
 }
 break;
 
 case THIRD_WAVE:  
 for(int k=0;k<3;k++){
 x3=spacingX*k;
 image(enemyImg,x3,y3);
 y3-= spacingY;
 image(enemyImg,x3,y3+210);
 y3+= spacingY;
 image(enemyImg,x3+190,y1-140); 
 y3+= spacingY;
 image(enemyImg,x3+190,y1-70);  
 y3-= spacingY;
 if(x3 >= width)
 {enemyWave = FIRST_WAVE;}  
 }  
 break;  
 }  
     
    image(fighterImg, x, y);
    if (upPressed) {
      y -= speed;
    }
    if (downPressed) {
      y += speed;
    }
    if (leftPressed) {
      x -= speed;
    }
    if (rightPressed) {
      x += speed;
    }

    // boundary detection
    if (x > width) {
      x = 0;
    }
    if (x < 0) {
      x = width;
    }
    if (y > height) {
      y = 0;
    }
    if (y < 0) {
      y = height;
    }
    if (x >= a-30 &&  x <= a+30 && y >= b-30 && y <=b+30){
      d = d+20;
      a=floor(random(420));
      b=floor(random(400));
    }
    
    if (d >=200){
      d =200;
    }
    
    if (x >= c-50 &&  x <= c+50 && y >= 100 && y <=200){ 
      x = width/2;
      y = height/2;
      d = d-40;
      c = 0;
    }
  }
}
  
  void keyPressed() {
    if (key == CODED) {
      switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      }
    }
  }
  void keyReleased() {
    if (key == CODED) {
      switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      }
    }
  }
