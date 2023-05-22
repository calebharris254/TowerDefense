/*
////////////////////////////////////////////////////////////
       -Goblin Smashers The Tower Defense Game-

                    Made by
     Caleb Harris, Will/James Mccallie, and Joshua Poppy 
///////////////////////////////////////////////////////////
Game is a proof of concept its very lame and doesn't have towers implemented yet and waves for the enemies still dont work
you can spawn a boss and a few other things are not working correctly but it has a lose scenrio and yeah 
FINAL DRAFT AS OF 5/22/23
*/

//Fnd a way to use a multi class spawn system that uses diffrent enemy types to make a wave of varied enemies
//Variables area
int mapX, mapY;
int playerHealth = 100;
int money = 500;
float diam;
//level about to be loaded can be changed if .changeLevel is used 
int levelPlaying;
int destX = -1, destY = -1;
int currentSec;
boolean bossActive = false;
//waves for things and such  
String waves[];
int currentWave;
boolean gameStarted = false;
int nextSecond = 1000;
int nextSpawn = 0; 
int nextRoundTimer = 5;
int wave = -1; //current wave
int spawnDelay = 0;  //time between spawns
int spawnIndex = 0;  //which enemy to spawn next
//ASSETS SECTION
 //types
  PImage mud;
  PImage rag;
  PImage farm;
  PImage clown;
  PImage fancy;
  PImage hawii;
  PImage dress;
  //Colors
  PImage redGoblin;
  PImage greenGoblin;
  PImage yellowGoblin;
  PImage pinkGoblin;
  PImage whiteGoblin;
  PImage blackGoblin;
  PImage blueGoblin;
  PImage boss;
  

//setup 
//change level by putting a 1 or a 2 in the map slot
Map level = new Map(1);
Hud h = new Hud();

ArrayList<RagGoblin> bads = new ArrayList<RagGoblin>(); //<>// //<>//
DressGoblin Test = new DressGoblin(); //<>// //<>// //<>//
RagGoblin Test2 = new RagGoblin(); //<>// //<>//
FancyGoblin Test3 = new FancyGoblin(); //<>// //<>//
HawiiGoblin Test4 = new HawiiGoblin(); //<>// //<>//
ClownGoblin Test5 = new ClownGoblin(); //<>// //<>//
FarmGoblin Test6 = new FarmGoblin(); //<>// //<>//
MudGoblin Test7 = new MudGoblin(); //<>// //<>//
Boss bossTest = new Boss(); //<>// //<>//
 //<>//
waterKnight snip = new waterKnight();

void setup()
{
  fullScreen();
  snip.towerX = (width/1.5);
  snip.towerY = height/3;
  snip.size = 88;
  textSize(100);
  frameRate(60);
  //establishes the images and assests used
  //------------------------------------------------------------------
  //mud = loadImage("Mud.png");
  redGoblin = loadImage("red.png");      //1 health
  blueGoblin = loadImage("blue.png");    //2 health
  pinkGoblin = loadImage("pink.png");    //3 health
  yellowGoblin = loadImage("yellow.png");//4 health
  greenGoblin = loadImage("green.png");  //5 health
  whiteGoblin = loadImage("white.png");  //6 health
  rag = loadImage("rag.png");
  mud = loadImage("Mud.png");
  farm = loadImage("farm.png");
  hawii = loadImage("hawii.png");
  clown = loadImage("clown.png");
  dress = loadImage("dress.png");
  fancy = loadImage("fancy.png");
  boss = loadImage("boss.png");
  healthIcon = loadImage("redHeart.png");
  moneyIcon = loadImage("currency.png");
  //-----------------------------------------------------------------------
}

void draw()
{
  if(gameStarted)
  {
    level.determineStartAndEnd();
    //test
    float newX = level.findCenter(level.spawnX);
    float newY = level.findCenter(level.spawnY);
    println("level x "+ newX+" level Y" + newY);
    background(255);
    //draws level
    level.drawLevel();
    //draws hud
    h.drawHud();
    text(playerHealth,width / 1.475, 120 );// displays health
    text(money,width / 1.475, 225 );// displays money
    fill(255, 0, 0);
    ellipse(snip.towerX, snip.towerY, snip.size, snip.size);
    //death mechanic
    if(playerHealth == 0)
    {
    text("GAME OVER",width/2.5,height/2);
    noLoop();
    } //<>//
    //checks to see if dude is dead
    if(bossActive == true && bossTest.isDead == false)
    {
      bossTest.drawGoblin();
      bossTest.pathfinding();
    }
    //draws enemy and does pathfinding
    //checks to see if dude is dead //<>//
    if(Test.isDead == false)
    {
      Test.pathfinding(); 
      Test.drawGoblin(); 
    }
    if(Test2.isDead == false)
    {
      Test2.pathfinding(); 
      Test2.drawGoblin(); 
    }
    if(Test3.isDead == false)
    {
      Test3.pathfinding(); 
      Test3.drawGoblin(); 
    }
    if(Test4.isDead == false)
    {
      Test4.pathfinding(); 
      Test4.drawGoblin(); 
    }
    if(Test5.isDead == false)
    {
      Test5.pathfinding(); 
      Test5.drawGoblin(); 
    }
    if(Test6.isDead == false)
    {
      Test6.pathfinding(); 
      Test6.drawGoblin(); 
    }
    if(Test7.isDead == false)
    {
      Test7.pathfinding(); 
      Test7.drawGoblin(); 
    }
    rectMode(CORNER); //<>//
    //Test.findDest();
     //<>//
    
   if (snip.towerX <= (level.mapSize*12)&& snip.towerY <= (level.mapSize*12))
   {
     snip.onBoard = true;
   }
   else
   {
     snip.onBoard = false;
   }
  }
  else
  {
    background(0,255,0);
    //draw main menu please something cool some decent box art type shiz also add a delay to start
    //place holder
    textSize(100);
    text("GOBLIN SMASHERS\n         PRESS A\n          WAVE 1\n       press W to wam bam",width/2-400,height/2);
  }
}

//-------------------------------------------------------------------------------------------------------------------------------------
//METHODS AND KEYPRESSED

void keyPressed()
{
  //kills player 
  if(key == 'k')
  {
   playerHealth=0;
  }
  //Takes damage from all spawned enemies including boss
  if(key == 'w' || key == 'W')
  {
    Test.takeDamage(1);
    Test2.takeDamage(1);
    Test3.takeDamage(1);
    Test4.takeDamage(1);
    Test5.takeDamage(1);
    Test6.takeDamage(1);
    Test6.takeDamage(1);
    Test7.takeDamage(1);
    bossTest.takeDamage(5);
    //Test.health-- ;
  }
  //spawns enemy  *doesn't work*
  if(key == 'e' || key == 'E')
  {
    bads.add( new RagGoblin() );
  }
  //spawns boss because theres no way to have the boss spawn naturally 
  if(key == 'q' || key == 'Q' && bossActive == false)
  {
    bossActive = true;
  }
  //starts game
  if(key == 'a' || key == 'A')
  {
     gameStarted = true; 
  }
}
void mouseDragged()
{
  if (pointInSniper(mouseX, mouseY, snip.towerX, snip.towerY, snip.size / 2) && snip.placed == false&& money >= 100) 
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
    money -= 100;
  }
}
//---------------------------------------------------------------------------------------------------------------------------
//checks if cursor is in the icon
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
//script for spawning the bad guys mostly borrowed from ritchie********
/*
**COULDNT FINSIH WAVES IN TIME**

void SpawnScript()
{
  //waves = new String[20];
  if(nextSecond < millis())
  {
    nextSecond += 250;
  }
  else
  {
    nextSecond += 1000; 
  }
  
  if(nextRoundTimer > 0)
  {
    nextRoundTimer--;
  }
  else if(nextRoundTimer == 0)
  {
    wave++;                                    //select next wave (currently will cause out-of-bounds)
    spawnDelay = level.waves[wave].charAt(0)-'0';  //get delay from front of string (had to subtract '0' to convert)
    nextSpawn = spawnDelay;                    //set delay of first enemy
    spawnIndex = 1;                            //set index to second number in string
    nextRoundTimer = -1;             
  }
  else //process wave
    {
      if(nextSpawn>0)
      {
        nextSpawn--;
      }
      if(nextSpawn==0)
      {
        nextSpawn = spawnDelay;
        //bads.add(new Enemy(m.waves[wave].charAt(spawnIndex)-'0'));
        spawnIndex++;
        if(spawnIndex>=level.waves[wave].length())
          nextSpawn=-1;
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
   */
