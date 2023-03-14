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
//level about to be loaded can be changed if .changeLevel is used 
int levelPlaying = 1;



//setup 
Map level = new Map();
Hud h = new Hud();

void setup()
{
  fullScreen();
  textSize(100);
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
}
void mouseDragged()
{
  if(mouseX >= width - (width / 4) + 40 && mouseX <= width - (width / 4) + 200  && mouseY >= height/4 && mouseY <= (height/4)+150)
  {
    fill(0,0,0,100);
    ellipse(mouseX,mouseY,150,150);
  }
}
