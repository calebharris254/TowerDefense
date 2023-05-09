

/*//make this a copy of enemies then use scripts to make it spawn under specific condition                                                                                
class Boss
{
  //Direction: 1-up  2-down  3-left  4-right
  //currentLevel[j][i] == 1
  int health;
  float speed;
  int size;
  int bossX;
  int bossY;
  boolean isSpawning;
  boolean isDead;
  boolean attack;
  boolean firstMove;
  int originX;
  int originY;
  int enemyXG;
  int enemyYG;
  int direction;
  int destX = level.spawnX, destY = level.spawnY+1;
  public Boss()
  {
    //still buggy fix when you can and stress test
    //translate the array coords into a coord on the actual plane
    enemyX = (level.spawnX*level.mapSize)+level.mapSize/2;
    //(level.spawnX*92)+5
    enemyY = (level.spawnY*level.mapSize) + level.mapSize/2;
    
    //ANNOYING FIX
    int temp = bossX;
    bossX = bossY;
    bossY = temp;
    
    //enemyXG = level.spawnX;
    //enemyYG = level.spawnY;
    //(level.spawnY*92)+35
    health = 1;
    size = 50; 
    isSpawning = true;
    isDead = false;// variable to see if its dead
    attack = false;//if it got to the base take damage and delete the dude
    firstMove = true;
    speed = 3;
    direction = 2;
    //this.enemyX = enemyX;
    //this.enemyY = enemyY;
    findDest();
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
  /*
  //moves enemy to given coords
  void moveEnemy(int ogX , int ogY , int dX , int dY)
  {
   
     enemyX = (dX*level.mapSize)+level.mapSize/2;
     enemyX = (dX*level.mapSize)+level.mapSize/2; 
     enemyY = (dY*level.mapSize)+level.mapSize/2;
     drawRedEnemy();
     originX = dX;
     originY = dY;
  }
  */
  //pathfinding method uses the 2d array to find its way around
  /*
  void pathfinding()
  {
    if( reachedDest() )
    {
      //snap to grid
      enemyX = destX*level.mapSize+level.mapSize/2;
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
}
/*
