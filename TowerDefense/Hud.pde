/*
///////////////////////////////////////////

HUD the user interface
by Joshua

///////////////////////////////////////////
*/
class Hud
{
  int hudSizeX;
  public Hud()
  {
    hudSizeX = width/6;
    fill(242,190,56);
    rect(hudSizeX,height,width/6,0);
  }
}
