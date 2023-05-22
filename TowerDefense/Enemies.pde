
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
       
try to get a delay to the waves so you have to time to prepare before death
*/
//PARENT CLASS FOR ENEMIES
class Goblin
{
  //Direction: 1-up  2-down  3-left  4-right
  int health;
  float speed;
  int size;
  int enemyX;
  int spawnType;
  int enemyY;
  int type;
  boolean isSpawning;
  boolean isHit;
  boolean isDead;
  boolean attack;
  boolean firstMove;
  int moneyGiven;
  int originX;
  int originY;
  int enemyXG;
  int enemyYG;
  int direction;
  int destX = level.spawnX, destY = level.spawnY+1;
  boolean tookPlayerHealth;
  int damage;
  //char = '';
 // -----------------------------------------------------
  
  
  public Goblin()
  {
    //default values stay unchanged unless child class changes it
    //still buggy fix when you can and stress test
    //translate the array coords into a coord on the actual plane
    enemyX = (level.spawnX*level.mapSize)+level.mapSize/2; //<>//
    enemyY = (level.spawnY*level.mapSize) + level.mapSize/2;
    
    //ANNOYING FIX
    int temp = enemyX;
    enemyX = enemyY;
    enemyY = temp;
    
    type = 1;
    damage = 1;
    health = 6;
    size = 70; 
    moneyGiven = 0;
    isSpawning = true;
    isDead = false;// variable to see if its dead
    attack = false;//if it got to the base take damage and delete the dude
    firstMove = true;
    speed = 1;
    direction = 2;
    isHit = false;
    tookPlayerHealth = false;
   
    //drawMudEnemy();
    
    
  }
  //draw variable
  void drawGoblin()
  {
    //checks to see if spawning 
    if(isDead == false && tookPlayerHealth == false)
    {
      println("is dead "+ isDead+"\n took health"+tookPlayerHealth);
      imageMode(CORNER);
      
     
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
     
    }
  }
  //<>//
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
        System.out.println("Enemy X "+enemyX+"\t Enemy Y "+ enemyY);
      }
      switch(direction)
      {
        case 1: enemyY -= speed; break;
        case 2: enemyY += speed; break;
        case 3: enemyX -= speed; break;
        case 4: enemyX += speed; break;
      }
     }
   }
    
     
  //finds where to pathfind to
  void findDest()
  {
    if(isDead == false)
    {
       if( destX > 0 && direction != 4 && (level.currentLevel[destX-1][destY]==1)) //Look left
      {
        System.out.println("Left");
        destX--;
        direction = 3;
        return;
      }
      if( destX < level.mapSize && direction != 3 && (level.currentLevel[destX+1][destY]==1)) //Look right
      {
        System.out.println("right");
        destX++;
        direction = 4;
        return;
      }
      if( destY > 0 && direction != 2 && (level.currentLevel[destX][destY-1]==1)) //Look up
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
      else
      {
        isDead = true;
        //takeDamage(100);
        playerHealth -= damage;
        System.out.println("At base take health "+ playerHealth);
        tookPlayerHealth = true;
      }
    }
    
  }
  //makes method to check is hit
  void ifHit()
  {
    if(health == 0)
    {
      isDead = true;
      //isSpawning = false;
      System.out.println("That dude dead");
      money += moneyGiven;
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
  }
  
//test on inhearitance lol it works super cool
class RagGoblin extends Goblin
{
  public RagGoblin()
  {
    health = 2;
    speed = 2;
    damage = 2;
    moneyGiven = 5;
    type = 1;
  }
  void drawGoblin()
  {
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
    damage = 1;
    moneyGiven = 1;
    type = 2;
  }
  void drawGoblin()
  {
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
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
    damage = 4;
    moneyGiven = 10;
  }
  void drawGoblin()
  { 
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
    damage = 5;
    moneyGiven = 15;
    type = 3;
  }
  void drawGoblin()
  {
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
    damage = 3;
    moneyGiven = 20;
    type = 4;
  }
  void drawGoblin()
  {
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
    moneyGiven = 10;
    type = 5;
  }
  void drawGoblin()
  {
    imageMode(CENTER);
    if(health == 1)
      {
        redGoblin.resize(size,size);
        image(redGoblin, enemyX, enemyY);
      }
      if(health > 0)
      {
        imageMode(CENTER);
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
    health = 6;
    speed = 8;
    damage = 8;
    moneyGiven = 25;
    type = 6;
  }
  void drawGoblin()
  {
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
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        fancy.resize(size,size);
        image(fancy, enemyX, enemyY);
      }
      imageMode(CORNER);
        
  }
}
//BOSS CLASS CHILD OF GOBLIN CLASS GIVE SPECIAL STUFF AND SHIZ
class Boss extends Goblin//Child Class
{
  public Boss()
  {
    health = 20;
    speed = 1;
    damage = 50;
    moneyGiven = 100;
    type = 7;
  }
  void drawGoblin()
  {
    imageMode(CENTER);
      if(health > 0)
      {
        drawHealthBar();
        imageMode(CENTER);
        //image(redGoblin, enemyX, enemyY);
        boss.resize(size,size);
        image(boss, enemyX, enemyY);
      }  
      imageMode(CORNER);
      noStroke();
        
  }
  void drawHealthBar()
  {
     if(health > 0)
   {
     fill(50,255*(health/20.0),0); 
     noStroke();
     rect(width/2-80,20,200*(health/20.0),20);
     fill(0);
     textSize(20);
     text("BOSS HEALTH",width/2-80,18);
     textSize(100);
   }
   noFill(); 
   stroke(170); 
   strokeWeight(3);
   rect(width/2-80,20,200,20);
   noStroke();
   //stroke();
  }
}
