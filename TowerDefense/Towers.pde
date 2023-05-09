//Theme Goblins
class waterKnight
{
  
  float towerX;
  float towerY;
  int size;
  float fireRate;
  float range;
  int damage;
  boolean placed = false;
  boolean onBoard = false;
  


  public void waterKnightVoid(int towerX, int towerY)
  {
    //damage, size, fireRate, and range are all going to change 
     damage = 5;
     size = 88; 
     fireRate = 4.0;
     range = 9.0;
     this.towerX = towerX;
     this.towerY = towerY;
     return;
  }
 
}
class fireKnight
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;
  
  public fireKnight(int towerX, int towerY)
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

class airKnight
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;
  
  public airKnight(int towerX, int towerY)
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

class earthKnight
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;

  public earthKnight(int towerX, int towerY)
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

class iceKnight
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;

  public iceKnight(int towerX, int towerY)
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
  class energyKnight
{
  int towerX;
  int towerY;
  int size;
  float fireRate;
  float range;
  int damage;
  
  public energyKnight(int towerX, int towerY)
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
