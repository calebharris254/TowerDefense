//find out how pathing works make a for loop to look for if the array equals 4 at that index then spawn the dude if the variables for spawning are true
class redEnemy
{
  int health;
  float speed;
  int size;
  int enemyX;
  int enemyY;
  boolean isSpawning;
  
  public redEnemy(int enemyX, int enemyY)
  {
    health = 1;
    speed = 1.25;
    size = 10; 
    isSpawning = true;
    this.enemyX = enemyX;
    this.enemyY = enemyY;
  }
  //draw variable
  void drawRedEnemy()
  {
    if(isSpawning == true)
    {
      fill(255,0,0);
      rect(enemyX, enemyY, size, size); 
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
