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

class Map
{
  //int levelPlaying = 1;
  int [][]currentLevel;// = returnedLevel[12][12];
  public int spawnX;
  public int spawnY;
  float mapSize;

  public Map( int level )
  {
    currentLevel = loadLevel(level);
    findSpawnpoint();
    levelPlaying = level;
  }

  public int[][] loadLevel(int levelType)
  {
    mapSize = 88;
    //((height+width)/2)/17
    if (levelType == 1)
    {
      int [][]returnedLevel = {
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
    //for loop to scan stuff
    for (int i = 0; i < 12; i++)
    {
      
      for (int j = 0; j < 12; j++)
      {
        
        stroke(12);
        if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 1)
        {
          fill(255, 255, 0);
          rect(i*(mapSize), j*(mapSize), (width/17), (mapSize));
        } else if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 4)
        {
          fill(0, 0, 255);
          rect(i*(mapSize), j*(mapSize), (width/17), (mapSize));
        } else if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 2)
        {
          fill(0, 255, 0);
          rect(i*(mapSize), j*(mapSize), (width/17), (mapSize));
        } else if (level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 3)
        {
          fill(255, 0, 0);
          rect(i*(mapSize), j*(mapSize), (width/17), (mapSize));
        }
        
      }
      
    }
    
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
  
  void findCenter()
  {
    
    
    
     
  }
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
  
}
