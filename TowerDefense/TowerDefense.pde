/*
////////////////////////////////////////////////////////////
          -Untitled Tower Defense Game-

                    Made by
     Caleb Harris, Will/James Mccallie, and Joshua Poppy 
///////////////////////////////////////////////////////////
*/
//Variables area
int mapX, mapY;





//setup 

Map level = new Map();
Hud h = new Hud();
void setup()
{
  fullScreen();
}

void draw()
{
  //draws level
  level.drawLevel();
  //draws hud
   h.drawHud();
  
}
