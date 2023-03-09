/*
///////////////////////////////////////////

HUD the user interface
by Joshua

///////////////////////////////////////////
*/
int hudSizeX = 0;
class Hud
{
  
  public void drawHud()
  {
    hudSizeX = width/4;
    fill(242,190,56);
    rect((width-hudSizeX)-1,0,hudSizeX,height-1); // main hud
    fill(255);
    rect((width - hudSizeX) + 40 , height / 4, hudSizeX / 2.7, hudSizeX / 2.7);//boxes to hold towers
    rect((width - hudSizeX) + hudSizeX / 1.8, height / 4, hudSizeX / 2.7, hudSizeX / 2.7);
    rect((width - hudSizeX) + 40, (height / 4) + hudSizeX / 2.7 + 50, hudSizeX / 2.7, hudSizeX / 2.7);
    rect((width - hudSizeX) + hudSizeX / 1.8, (height / 4 ) + hudSizeX / 2.7 + 50, hudSizeX / 2.7, hudSizeX / 2.7);
    rect((width - hudSizeX) + 40, (height / 2.2)+ hudSizeX / 2.7 + 50, hudSizeX / 2.7, hudSizeX / 2.7);
    rect((width - hudSizeX) + hudSizeX / 1.8, (height / 2.2)+ hudSizeX / 2.7 + 50, hudSizeX / 2.7, hudSizeX / 2.7);
    return;
  }
  
}


 
