/*
////////////////////////////////////////////////////////////
          -Goblin Smashers The Tower Defense Game-

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
int levelPlaying;
int destX = -1, destY = -1;


//setup 
//change level by putting a 1 or a 2 in the map slot
Map level = new Map(1);
Hud h = new Hud();
ArrayList<redEnemy> bads = new ArrayList<redEnemy>();

redEnemy Test = new redEnemy(); //<>// //<>//
//redEnemy Test = new redEnemy();
waterKnight snip = new waterKnight();

void setup()
{
  fullScreen();
  //size(1600,1000);
  snip.towerX = (width/1.5);
  snip.towerY = height/3;
  snip.size = 50;
  textSize(100);
 

  //level.changeLevel(levelPlaying);
}

void draw()
{
  level.determineStartAndEnd();
  //test
  float newX = level.findCenter(level.spawnX);
  float newY = level.findCenter(level.spawnY);
  println("level x "+ newX+" level Y" + newY);
  //println("enemyX "+"enemyY ");
  //
  
  background(255);
  //redEnemy();
  //draws level
  level.drawLevel();
  //draws hud
  h.drawHud();
  text(health,width / 1.475, 120 );// displays health
  text(money,width / 1.475, 225 );// displays money
  fill(255, 0, 0);
  ellipse(snip.towerX, snip.towerY, snip.size, snip.size);
  //death mechanic
  if(health == 0)
  {
  text("GAME OVER",width/2.5,height/2);
  noLoop();
  } //<>//
  //draws enemy and does pathfinding
  Test.drawRedEnemy(); //<>//
  rectMode(CORNER);
  //Test.findDest();
  Test.pathfinding();
 // Test.reachedDest();
 if (snip.towerX <= (level.mapSize*12)&& snip.towerY <= (level.mapSize*12))
 {
   snip.onBoard = true;
 }
 else
 {
   snip.onBoard = false;
 }
}
void keyPressed()
{
  if(key == 'k')
  {
   health=0;
  }
  if(key == 'e')
  {
    bads.add( new redEnemy() );
  }
}
void mouseDragged()
{
  if (pointInSniper(mouseX, mouseY, snip.towerX, snip.towerY, snip.size / 2) && snip.placed == false) 
  {
    snip.towerX = mouseX;
    snip.towerY = mouseY;
   
  }
}

void mouseReleased()
{
 if (pointInSniper(mouseX, mouseY, snip.towerX, snip.towerY, snip.size / 2) && snip.placed == false && snip.onBoard == true) 
  {
    snip.placed = true;
  }
}
boolean pointInSniper(float x, float y, float a, float b, float r) 
{
  if (dist(x, y, a, b) <= r+25) 
  {
    return true;
  } else 
  {
    return false;
  }
}
