/*
////////////////////////////////////////////////////////////
          -Goblin Smashers The Tower Defense Game-

                    Made by
     Caleb Harris, Will/James Mccallie, and Joshua Poppy 
///////////////////////////////////////////////////////////
*/

//Fnd a way to use a multi class spawn system that uses diffrent enemy types to make a wave of varied enemies
//Variables area
int mapX, mapY;
int health = 100;
int money = 500;
float diam;
//level about to be loaded can be changed if .changeLevel is used 
int levelPlaying;
int destX = -1, destY = -1;
int currentSec;

//waves for things and such  
String waves[];
int currentWave;


//setup 
//change level by putting a 1 or a 2 in the map slot
Map level = new Map(1);
Hud h = new Hud();

ArrayList<Goblin> bads = new ArrayList<Goblin>(); //<>//
Goblin Test = new Goblin(); //<>// //<>//

//ArrayList<redEnemy> bads = new ArrayList<redEnemy>();


//redEnemy Test = new redEnemy(); //<>// //<>//
//redEnemy Test = new redEnemy();
waterKnight snip = new waterKnight();

void setup()
{
  fullScreen();
  //size(1600,1000);
  snip.towerX = (width/1.5);
  snip.towerY = height/3;
  snip.size = 88;
  textSize(100);
  frameRate(60);
 

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
  Test.drawGoblin(); //<>//
  rectMode(CORNER); //<>//
  //Test.findDest();
  Test.pathfinding(); //<>//
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
  //kill enemy
  if(key == 'w')
  {
    Test.takeDamage(1);
    //Test.health-- ;
  }
  if(key == 'e')
  {
    bads.add( new Goblin() );
  }
}
void mouseDragged()
{
  if (pointInSniper(mouseX, mouseY, snip.towerX, snip.towerY, snip.size / 2) && snip.placed == false) 
  {
    snip.towerX =  round(mouseX / snip.size) * snip.size + snip.size/2;
    snip.towerY =  round(mouseY / snip.size) * snip.size + snip.size/2;
   
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

void SpawnScript()
{
  waves = new String[20];
  
}

/* ritchie way
void runRoundCounter() //counts to next round, spawns enemies for the round, starts next round
{
  if(nextSecond < millis())
  {
    if(nextSpawn>0)  //give spawn timer ability to spawn faster
      nextSecond += 250;
    else
      nextSecond += 1000;
    
    if(nextRoundTimer>0) //count down
      nextRoundTimer--;
    else if(nextRoundTimer==0) //begin wave
    {
      wave++;                                    //select next wave (currently will cause out-of-bounds)
      spawnDelay = m.waves[wave].charAt(0)-'0';  //get delay from front of string (had to subtract '0' to convert)
      nextSpawn = spawnDelay;                    //set delay of first enemy
      spawnIndex = 1;                            //set index to second number in string
      nextRoundTimer = -1;                       //disable round timer so that the else will trigger
    }
    else //process wave
    {
      if(nextSpawn>0)
        nextSpawn--;
      if(nextSpawn==0)
      {
        nextSpawn = spawnDelay;
        bads.add(new Enemy(m.waves[wave].charAt(spawnIndex)-'0'));
        spawnIndex++;
        if(spawnIndex>=m.waves[wave].length())
          nextSpawn=-1;
      }
    }
  }
  if( nextSpawn == -1 && bads.size() == 0 ) //time for next round
  {
    nextRoundTimer = 15;
    nextSpawn = 0;
    spawnIndex = 0;
    spawnDelay = 0;
  }
}

EXAMPLE WAVES
 waves = new String[20];
        waves[0] = "5111111";
        waves[1] = "3111111";
        waves[2] = "11111111111";
        waves[3] = "3121212";
        waves[4] = "3222222";
        waves[5] = "63113113";
        waves[6] = "4123123123";
        waves[7] = "12222222222";
        waves[8] = "5313131114";
        waves[9] = "54141414";
        waves[10] = "211111";
        waves[11] = "111111";
        waves[12] = "222222";
        waves[13] = "122222";
        waves[14] = "233333";
        waves[15] = "133333";
        waves[16] = "244444";
        waves[17] = "255555";
        waves[18] = "266666";
        waves[19] = "123456789";
        break;
*/
