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
  
<<<<<<< HEAD
  public waterKnight(int towerX, int towerY)
=======
  public void sniperTowerd(int towerX, int towerY)
>>>>>>> fbfe7caecf072c6afd8aa60fa5eed4f50816af70
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
