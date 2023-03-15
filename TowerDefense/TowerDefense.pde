/*
////////////////////////////////////////////////////////////
          -Untitled Tower Defense Game-

                    Made by
     Caleb Harris, Will/James Mccallie, and Joshua Poppy 
///////////////////////////////////////////////////////////
*/
//Variables area
int mapX, mapY;
int health = 100;
int money = 500;
float diam;
//level about to be loaded can be changed if .changeLevel is used 
int levelPlaying = 1;



//setup 
Map level = new Map();
Hud h = new Hud();
Sprite ball = new Sprite();
class Sprite {
  float x;
  float y;
  float dx;
  float dy;
}
void setup()
{
  fullScreen();
  textSize(100);
  ball.x =  (width/1.22) ;
  ball.y = height/3.1;
  diam = 50;
  //level.changeLevel(levelPlaying);
}

void draw()
{
  //draws level
  level.drawLevel();
  //draws hud
  h.drawHud();
  text(health,width / 1.175, 120 );// displays health
  text(money,width / 1.175, 225 );// displays money
  fill(255, 0, 0);
  ellipse(ball.x, ball.y, diam, diam);
}
void mouseDragged()
{
  /*if(mouseX >= width - (width / 4) + 40 && mouseX <= width - (width / 4) + 200  && mouseY >= height/4 && mouseY <= (height/4)+150)
  {
    fill(0,0,0,100);
    ellipse(mouseX,mouseY,150,150);
  }*/
  if (pointInCircle(mouseX, mouseY, ball.x, ball.y, diam / 2)) {
    ball.x = mouseX;
    ball.y = mouseY;
  }
}
boolean pointInCircle(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r+25) {
    return true;
  } else {
    return false;
  }
}
