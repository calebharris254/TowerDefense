
//find out how pathing works make a for loop to look for if the array equals 4 at that index then spawn the dude if the variables for spawning are true
////Theme Goblins
/*
--Checklist--
1. try to figure out how enemies actually act when damage etc*done*
2. decide againsit other classes or nott *done*
3.for the future get this working on other maps**
4. figure a spawning system out rounds or specfic level scripts 
5. color and look*done*
6.finally polish and comment
7.get the enemies to react to damage **
8.when done with this help with other parts of the game get finished
9. make the enemies into goblin **
10. SPAWN SCRIPT NEEDS TO WORK HAVE TO USE CLASS SWITCH CASE DONT WORK BECAUSE MAN IDK JUST USE TYPE AND MAKE EACH CLASS EQUAL TO A TYPE AND HAVE A SWITCH CASE THAT CAN SPAWN EACH OF THAT CLASS
player = loadImage("geogersBack.png");
       imageMode(CENTER);
       player.resize(400,400);
       image(player, pokePlayerX, pokePlayerY);
       imageMode(CORNER);
       
       health denominations
       1 = red
       
*/
//PARENT CLASS FOR ENEMIES
class Goblin
{
  //Direction: 1-up  2-down  3-left  4-right
  //currentLevel[j][i] == 1
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;
  int type;
  //PImage redGoblin;
  boolean isSpawning;
  boolean isHit;
  boolean isDead;
  boolean attack;
  boolean firstMove;
  int originX;
  int originY;
  int enemyXG;
  int enemyYG;
  int direction;
  int destX = level.spawnX, destY = level.spawnY+1;
 // -----------------------------------------------------
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
  
  
  public Goblin()
  {
    //still buggy fix when you can and stress test
    //translate the array coords into a coord on the actual plane
    enemyX = (level.spawnX*level.mapSize)+level.mapSize/2; //<>//
    //(level.spawnX*92)+5
    enemyY = (level.spawnY*level.mapSize) + level.mapSize/2;
    
    //ANNOYING FIX
    int temp = enemyX;
    enemyX = enemyY;
    enemyY = temp;
    
    //enemyXG = level.spawnX;
    //enemyYG = level.spawnY;
    //(level.spawnY*92)+35
    type = 1;
    health = 6;
    size = 70; 
    isSpawning = true;
    isDead = false;// variable to see if its dead
    attack = false;//if it got to the base take damage and delete the dude
    firstMove = true;
    speed = 1;
    direction = 2;
    isHit = false;
    //this.enemyX = enemyX;
    //this.enemyY = enemyY;
    //pathfinding();
    findDest();
    //drawMudEnemy();
    
    
  }
  //draw variable
  void drawGoblin()
  {
    //checks to see if spawning 
    if(isDead == false)
    {
      imageMode(CORNER);
      
      //establishes the images and assests used
      //mud = loadImage("Mud.png");
      redGoblin = loadImage("red.png");      //1 health
      blueGoblin = loadImage("blue.png");    //2 health
      pinkGoblin = loadImage("pink.png");    //3 health
      yellowGoblin = loadImage("yellow.png");//4 health
      greenGoblin = loadImage("green.png");  //5 health
      whiteGoblin = loadImage("white.png");  //6 health
     // blackGoblin = loadImage("black.png");  //7 health
     
      imageMode(CENTER);
      //Color changer for health
      if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      else if(health == 2)
      {
        blueGoblin.resize(size,size);
        image(blueGoblin, enemyX, enemyY);
      }
      else if(health == 3)
      {
        pinkGoblin.resize(size,size);
        image(pinkGoblin, enemyX, enemyY);
      }
      else if(health == 4)
      {
        yellowGoblin.resize(size,size);
        image(yellowGoblin, enemyX, enemyY);
      }
      else if(health == 5)
      {
        greenGoblin.resize(size,size);
        image(greenGoblin, enemyX, enemyY);
      }
      else if(health == 6)
      {
        whiteGoblin.resize(size,size);
        image(whiteGoblin, enemyX, enemyY);
      }
      imageMode(CORNER); 
      /*
      mud = loadImage("Mud.png");
      redGoblin = loadImage("red.png");
      imageMode(CENTER);
      if(type == 1 && health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
        mud.resize(size,size);
        image(mud, enemyX, enemyY);
        imageMode(CORNER);
      }
      ifHit();
      */
      /*
      switch(type)
      {
        case 1: redGoblin.resize(size,size); image(redGoblin, enemyX, enemyY); mud.resize(size,size); image(mud, enemyX, enemyY);                                            //fill(030,030,250,transAmount); stroke(030,030,250); break;
        case 2: 
        case 3: 
        case 4: 
        case 5: 
        case 6: 
        case 7: 
        case 8: 
        case 9: 
      }
      ifHit();
      pop();
      */
      
      /*
      mud.resize(size,size);
      image(mud, enemyX, enemyY);
      imageMode(CORNER);
      ifHit();
      */
      //takeDamage(0); use when towers can shoot
      /*
      rectMode(CENTER);
      fill(255,0,0);
      rect(enemyX, enemyY, size, size); 
      print(" enemyX "+ enemyX+" , "+ "enemyY "+enemyY );
      rectMode(CORNER);
      */
    }
  }
  /*
  //moves enemy to given coords
  void moveEnemy(int ogX , int ogY , int dX , int dY)
  {
   
     enemyX = (dX*level.mapSize)+level.mapSize/2;
     enemyX = (dX*level.mapSize)+level.mapSize/2;  //<>//
     enemyY = (dY*level.mapSize)+level.mapSize/2;
     drawRedEnemy();
     originX = dX;
     originY = dY;
  }
  */
  //pathfinding method uses the 2d array to find its way around
  void pathfinding()
  {
    if(isDead == false)
    {
      if( reachedDest() )
      {
        //snap to grid
        enemyX = destX*level.mapSize+level.mapSize/2; //<>//
        enemyY = destY*level.mapSize+level.mapSize/2;
        findDest();
        System.out.println("try move");
      }
      switch(direction)
      {
        case 1: enemyY -= speed; break;
        case 2: enemyY += speed; break;
        case 3: enemyX -= speed; break;
        case 4: enemyX += speed; break;
      }
    
      /*
      //sets origin as the spawnpoint so it knows where its coming from
      if(firstMove == true)
      {
        originY = level.spawnY;
        originX = level.spawnX;
        firstMove = false;
      }
      
      //for loop to scan array 
      
      
       for(int i = originY; i < 12 ; i++)
       {
         for(int j = originX-1; j < 12 ; j++)
         {
           if(level.loadLevel(levelPlaying)[j+mapX][i+mapY] == 1 && originX != -1 && originY != -1 && originX != 12 && originY != 12 ||
              level.loadLevel(levelPlaying)[j+mapX][i+mapY] == 3 && originX != -1 && originY != -1 && originX != 12 && originY != 12)//checks for base 
           {
             //enemyXG = (enemyX/level.mapSize)-level.mapSize*2;
             //enemyYG = (enemyY/level.mapSize)-level.mapSize*2;
             destX = j;
             destY = i;
             //originX = en;
             //originY = enemyYG;
             moveEnemy(originX, originY , j , i);
             System.out.println(" dest X: "+destX+" dest Y: " + destY);
             System.out.println("origin X: "+originX+ " origin Y: "+originY);
             System.out.println("Enemy grid X " + enemyXG + "enemy grid Y" + enemyYG );
             
           }
         }
         */
       }
     }
    
     
  
  void findDest()
  {
     if( destX > 0 && direction != 4 && (level.currentLevel[destX-1][destY]==1) ) //Look left
    {
      System.out.println("Left");
      destX--;
      direction = 3;
      return;
    }
    if( destX < level.mapSize && direction != 3 && (level.currentLevel[destX+1][destY]==1) ) //Look right
    {
      System.out.println("right");
      destX++;
      direction = 4;
      return;
    }
    if( destY > 0 && direction != 2 && (level.currentLevel[destX][destY-1]==1) ) //Look up
    {
      System.out.println("UP");
      destY--;
      direction = 1;
      return;
    }
    if( destY < level.mapSize && direction != 1 && (level.currentLevel[destX][destY+1]==1) ) //Look down
    {
      System.out.println("down");
      destY++;
      direction = 2;
      return;
    }
      
    //originX = xPos;
    //originY = yPos;
  }
  void ifHit()
  {
    if(health == 0)
    {
      isDead = true;
      //isSpawning = false;
      System.out.println("That dude dead");
      //noLoop();
    }
    
  }
  void takeDamage(double amount)
  {
    health -= amount;
    System.out.println("Goblin hit health: " + health);
    ifHit();
    //return true;
  }
  public boolean reachedDest()
  {
    if( direction == 1 && enemyY <= destY*level.mapSize+level.mapSize/2 )
      return true;
   if( direction == 2 && enemyY >= destY*level.mapSize+level.mapSize/2 )
      return true;
    if( direction == 3 && enemyX <= destX*level.mapSize+level.mapSize/2 )
      return true;
    if( direction == 4 && enemyX >= destX*level.mapSize+level.mapSize/2 )
      return true;
    System.out.println("havent reached dest");
    return false;
  }
  void attackBase()
  {
     //psudeo cose when the pathfinder finds a 4 it goes onto it and counts down the health then the goblin force kills itself so it can be despawned
  }
  }
  
//test on inhearitance lol it works super cool
class RagGoblin extends Goblin
{
  public RagGoblin()
  {
    health = 2;
    speed = 2;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    blueGoblin = loadImage("blue.png");    //2 health
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      else if(health == 2)
      {
        blueGoblin.resize(size,size);
        image(blueGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        rag = loadImage("rag.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        rag.resize(size,size);
        image(rag, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
class MudGoblin extends Goblin//Child Class
{
  public MudGoblin()
  {
    health = 1;
    speed = 1;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        mud = loadImage("Mud.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        mud.resize(size,size);
        image(mud, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
class FarmGoblin extends Goblin
{
  public FarmGoblin()
  {
    health = 3;
    speed = 3;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    blueGoblin = loadImage("blue.png");    //2 health
    pinkGoblin = loadImage("pink.png");    //3 health
    
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      else if(health == 2)
      {
        blueGoblin.resize(size,size);
        image(blueGoblin, enemyX, enemyY);
      }
      else if(health == 3)
      {
        pinkGoblin.resize(size,size);
        image(pinkGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        farm = loadImage("farm.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        farm.resize(size,size);
        image(farm, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
class HawiiGoblin extends Goblin
{
  public HawiiGoblin()
  {
    health = 6;
    speed = 1;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    blueGoblin = loadImage("blue.png");    //2 health
    pinkGoblin = loadImage("pink.png");    //2 health
    yellowGoblin = loadImage("yellow.png");    //2 health
    greenGoblin = loadImage("green.png");    //2 health
    whiteGoblin = loadImage("white.png");    //2 health
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      else if(health == 2)
      {
        blueGoblin.resize(size,size);
        image(blueGoblin, enemyX, enemyY);
      }
      else if(health == 3)
      {
        pinkGoblin.resize(size,size);
        image(pinkGoblin, enemyX, enemyY);
      }
      else if(health == 4)
      {
        yellowGoblin.resize(size,size);
        image(yellowGoblin, enemyX, enemyY);
      }
      else if(health == 5)
      {
        greenGoblin.resize(size,size);
        image(greenGoblin, enemyX, enemyY);
      }
      else if(health == 6)
      {
        whiteGoblin.resize(size,size);
        image(whiteGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        hawii = loadImage("hawii.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        hawii.resize(size,size);
        image(hawii, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
class ClownGoblin extends Goblin
{
  public ClownGoblin()
  {
    health = 5;
    speed = 7;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    blueGoblin = loadImage("blue.png");    //2 health
    pinkGoblin = loadImage("pink.png");    //3 health
    yellowGoblin = loadImage("yellow.png");    //4 health
    greenGoblin = loadImage("green.png");    //5 health
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      else if(health == 2)
      {
        blueGoblin.resize(size,size);
        image(blueGoblin, enemyX, enemyY);
      }
      else if(health == 3)
      {
        pinkGoblin.resize(size,size);
        image(pinkGoblin, enemyX, enemyY);
      }
      else if(health == 4)
      {
        yellowGoblin.resize(size,size);
        image(yellowGoblin, enemyX, enemyY);
      }
      else if(health == 5)
      {
        greenGoblin.resize(size,size);
        image(greenGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        clown = loadImage("clown.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        clown.resize(size,size);
        image(clown, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
class DressGoblin extends Goblin
{
  public DressGoblin()
  {
    health = 1;
    speed = 10;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        dress = loadImage("dress.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        dress.resize(size,size);
        image(dress, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
class FancyGoblin extends Goblin//Child Class
{
  public FancyGoblin()
  {
    health = 1;
    speed = 1;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        fancy = loadImage("fancy.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        mud.resize(size,size);
        image(mud, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
//BOSS CLASS CHILD OF GOBLIN CLASS GIVE SPECIAL STUFF AND SHIZ
class Boss extends Goblin//Child Class
{
  public Boss()
  {
    health = 1;
    speed = 1;
  }
  void drawGoblin()
  {
    redGoblin = loadImage("red.png");      //1 health
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        mud = loadImage("Mud.png");
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        mud.resize(size,size);
        image(mud, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
