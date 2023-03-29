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
  int destX;
  int destY;
  int originX;
  int originY;
  
  public redEnemy()
  {
    //still buggy fix when you can and stress test
    //translate the array coords into a coord on the actual plane
    enemyX = (level.spawnX*92)+5;
    enemyY = (level.spawnY*92)+35;
    health = 1;
    speed = 1.25;
    size = 50; 
    isSpawning = true;
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
  //pathfinding method uses the 2d array to find its way around
  void pathfinding()
  {
    //sets origin as the spawnpoint so it knows where its coming from
    originY = level.spawnY;
    originX = level.spawnX;
    System.out.println("origin X: "+originX+ " origin Y: "+originY);
    //for loop to scan array 
     for(int i = originY; i < 12 ; i++)
     {
       for(int j = originX-1; j < 12 ; j++)
       {
         if(level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 1 && originX != -1 && originY != -1 && originX != 12 && originY != 12)
         {
           destX = j;
           destY = i;
           System.out.println(" dest X: "+destX+" dest Y: " + destY);
           return;
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
