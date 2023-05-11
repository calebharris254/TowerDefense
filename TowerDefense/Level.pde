/*
////////////////////////////////////////////////////
 Level class for the level 2d area attepmt
 By Caleb
 
 ///////////////////////////////////////////////////
 */
//1 = path that enemies walk on
//2 = grass Where towers can be placed
//3 = base where the enemies path to and kill
//4 = enemy spawn
//12x12 board
//X IS J
//Y IS I THIS IS HOW ITS SUPPOSED TO BE YOUS TUPID STIPIC ITCH

class Map
{
  //int levelPlaying = 1;
  int [][]currentLevel;// = returnedLevel[12][12];
  public int spawnX = -1;
  public int spawnY = -1;
  int mapSize;
  PImage grass;
  PImage grass2;
  PImage grass3;
  PImage path;
  //int destX = -1;
  //int destY = -1;

  public Map( int level )
  {
    currentLevel = loadLevel(level);
    findSpawnpoint();
    levelPlaying = level;
    determineStartAndEnd();
  }

  public int[][] loadLevel(int levelType)
  {
    mapSize = 88;
    //((height+width)/2)/17
    if (levelType == 1)
    {
      int [][]returnedLevel = {
      //  {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2},
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2},

      };
      return returnedLevel;
      } 
    else if (levelType == 2)
    {
      int [][]returnedLevel = {
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2},
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2},

      };
      return returnedLevel;
    }
    /*
    empty level for making a level 
    else if(levelType == 3 and so on)
    {
      int [][]returnedLevel = {
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},

      };
      return returnedLevel;
    }
    */
    


    //gives it nothing if level is nothing
    return new int[0][0];
  }
  //method for drwing level
  //fix better later because huds off a bit just a little messing and it will fix
  //draws level using level size variable
  public void drawLevel()
  {
    //assets
    grass = loadImage("grassTile3.png");    
    path = loadImage("pathTile.png");
    //--------------------------------------
    //for loop to scan stuff
    //imageMode(CENTER);
    for (int i = 0; i < 12; i++)
    {
      
      for (int j = 0; j < 12; j++)
      {
        
        stroke(12);
        if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 1)//path
        {
          path.resize(width/17,(mapSize));
          image(path,j*(mapSize), i*(mapSize));
        } else if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 4)// start
        {
          fill(0, 0, 255);
          rect(j*(mapSize), i*(mapSize), (width/17), (mapSize));
        } else if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 2)//grass
        {
          grass.resize(width/17,(mapSize));
          image(grass,j*(mapSize), i*(mapSize));
        } else if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 3)//base
        {
          fill(255, 0, 0);
          rect(j*(mapSize), i*(mapSize), (width/17), (mapSize));
        }
        
      }
      
    }
    imageMode(CORNER);
  }
  //changes levels so you can play on multiple diffrent levels
  
  public int changeLevel(int levelChange)
  {
    levelPlaying = levelChange;
    //replace with try catch
    if (levelChange == 0)
    {
      System.out.println("Error: No level");
    }
    if (levelChange == 1)
    {
      System.out.println("Loading level 1");
      return 1;
    }
    if (levelChange == 2)
    {
      System.out.println("Loading level 2");
      return 2;
    }
    return 0;
  }
  //Finds center of the squares so the enemy can move towards it
  //returnedLevel[int x][int y]
  // find center on actual game screen by having to given coordnates normally j and i
  public float findCenter(int x)
  {
    float newCoords;
    newCoords = (x*mapSize)+mapSize/2;
    return newCoords;
     
  }
  /*
   public float[] findCenter(int x, int y)
  {
    float[] newCoords = new float[2];
    newCoords[0] = (x*mapSize)+mapSize/2;
    newCoords[1] = (y*mapSize)+mapSize/2;
    return newCoords;
     
  }
  */
  //Finds the spawn point so the enemie can initally spawn and start pathfinding
  
  void findSpawnpoint()
  {
    for (int i = 0; i < 12; i++ )
    {
      for (int j = 0; j < 12; j++)
      {
        if( currentLevel[j][i] == 4 )
        {
          spawnX = i;
          spawnY = j;
          println("X: " + spawnX + "  Y:"+ spawnY);
          return;
        }
        /*
        if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 4)
        {
          Test.enemyX = level.loadLevel(levelPlaying)[j+mapY][i+mapX];
        }
        */
      }
    }
  }
  public void determineStartAndEnd()
  {
    for(int i = 0; i < 12; i++)
    {
      for(int j = 0; j < 12; j++)
      {
        if(currentLevel[j][i]==4)
        {
          spawnX=i;
          spawnY=j;
        }
        if(currentLevel[j][i]==3)
        {
          destX = j;
          destY = i;
        }
      }
    }
  }
}

  
