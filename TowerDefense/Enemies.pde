
//find out how pathing works make a for loop to look for if the array equals 4 at that index then spawn the dude if the variables for spawning are true
////Theme Goblins
class redEnemy
{
  //currentLevel[j][i] == 1
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;
  boolean isSpawning;
  boolean isDead;
  boolean attack;
  boolean firstMove;
  int destX;
  int destY;
  int originX;
  int originY;
  int enemyXG;
  int enemyYG;
  
  
  public redEnemy()
  {
    //still buggy fix when you can and stress test
    //translate the array coords into a coord on the actual plane
    enemyX = (level.spawnX*level.mapSize)+level.mapSize/2;
    //(level.spawnX*92)+5
    enemyY = (level.spawnY*level.mapSize) + level.mapSize/2;
    enemyXG = level.spawnX;
    enemyYG = level.spawnY;
    //(level.spawnY*92)+35
    health = 1;
    speed = 1.25;
    size = 50; 
    isSpawning = true;
    isDead = false;// variable to see if its dead
    attack = false;//if it got to the base take damage and delete the dude
    firstMove = true;
    speed = 1;
    //this.enemyX = enemyX;
    //this.enemyY = enemyY;
  }
  //draw variable
  void drawRedEnemy()
  {
    //checks to see if spawning 
    if(isSpawning == true)
    {
      rectMode(CENTER);
      fill(255,0,0);
      rect(enemyX, enemyY, size, size); 
      print(" enemyX "+ enemyX+" , "+ "enemyY "+enemyY );
      rectMode(CORNER);
      
    }
  }
  //moves enemy to given coords
  void moveEnemy(int ogX , int ogY , int dX , int dY)
  {
     
     enemyX = (dX*level.mapSize)+level.mapSize/2; //<>//
     enemyY = (dY*level.mapSize)+level.mapSize/2;
     drawRedEnemy();
     originX = dX;
     originY = dY;
  }
  //pathfinding method uses the 2d array to find its way around
  void pathfinding()
  {
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
     }
    
     
  }
}

class blueEnemy
{
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;
  
  public blueEnemy(int enemyX, int enemyY)
  {
    health = 1;
    speed = 1.50;
    size = 10;
    this.enemyX = enemyX;
    this.enemyY = enemyY;
  }
}

class greenEnemy
{
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;
  
  public greenEnemy(int enemyX, int enemyY)
  {
    health = 2;
    speed = 1.75;
    size = 10;
    this.enemyX = enemyX;
    this.enemyY = enemyY;
  }
}

class yellowEnemy
{
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;  
  
  public yellowEnemy(int enemyX, int enemyY)
  {
    health = 5;
    speed = 2;
    size = 10;
    this.enemyX = enemyX;
    this.enemyY = enemyY;
  }
}

class pinkEnemy
{
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY; 
  
  public pinkEnemy(int enemyX, int enemyY)
  {
    health = 10;
    speed = 2.25;
    size = 10;
    this.enemyX = enemyX;
    this.enemyY = enemyY;
  }
}

class blackEnemy
{
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;
  
  public blackEnemy(int enemyX, int enemyY)
  {
    health = 20;
    speed = 1.5;
    size = 10;
    this.enemyX = enemyX;
    this.enemyY = enemyY;
  }
}

class whiteEnemy
{
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;
  
  public whiteEnemy(int enemyX, int enemyY)
  {
    health = 40;
    speed = 0.75;
    size = 10;
    this.enemyX = enemyX;
    this.enemyY = enemyY;
  }
}
