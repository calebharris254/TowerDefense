//Theme Goblins
class sniperTower
{
  
  float towerX;
  float towerY;
  int size;
  float fireRate;
  float range;
  int damage;
  boolean placed = false;
  
  public void sniperTowerd(int towerX, int towerY)
  {
    //damage, size, fireRate, and range are all going to change 
    damage = 5;
     size = 50; 
     fireRate = 4.0;
     range = 9.0;
     this.towerX = towerX;
     this.towerY = towerY;
     return;
  }
}


class bazookaTower
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;
  
  public bazookaTower(int towerX, int towerY)
  {
    //damage, size, fireRate, and range are all going to change 
    damage = 5;
    size = 10;
    fireRate = 3.0;
    range = 3.0;
    this.towerX = towerX;
    this.towerY = towerY;
  }
}

class rifleTower
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;
  
  public rifleTower(int towerX, int towerY)
  {
    //damage, size, fireRate, and range are all going to change 
    damage = 5;
    size = 10;
    fireRate = 5.0;
    range = 10.0;
    this.towerX = towerX;
    this.towerY = towerY;
  }
}

class smgTower
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;

  public smgTower(int towerX, int towerY)
  {
    //damage, size, fireRate, and range are all going to change 
    damage = 2;
    size = 10;
    fireRate = 5.0;
    range = 10.0;
    this.towerX = towerX;
    this.towerY = towerY;
  }
}

class iceTower
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;

  public iceTower(int towerX, int towerY)
  {
    //damage, size, fireRate, and range are all going to change 
    damage = 2;
    size = 10;
    fireRate = 5.0;
    range = 10.0;
    this.towerX = towerX;
    this.towerY = towerY;
  }
}
