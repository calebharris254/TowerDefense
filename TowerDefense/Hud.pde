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
    rect((width-hudSizeX)-1,0,hudSizeX,height-1);
    return;
  }
}


 
