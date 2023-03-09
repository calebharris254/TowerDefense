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
//Variables

class Map
{
  // int [][]level = returnedLevel[12][12];

  public int[][] loadLevel(int level)
  {
    if (level == 1)
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
    } else if (level == 2)
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
    }


    //gives it nothing if level is nothing
    return new int[0][0];
  }
  //method for drwing level
  //fix better later because huds off a bit just a little messing and it will fix
  public void drawLevel()
  {
    //for loop to scan stuff
    for(int i = 0; i < 12; i++)
    {
      for(int j = 0 ; j < 12; j++)
      {
        stroke(12);
        if(level.loadLevel(1)[j+mapY][i+mapX] == 1)
        {
          fill(255,255,0);
          rect(i*(((height+width)/2)/16), j*(((height+width)/2)/16), (width/17), (((height+width)/2)/16));
        }
        else if(level.loadLevel(1)[j+mapY][i+mapX] == 2)
        {
          fill(0,255,0);
          rect(i*(((height+width)/2)/16), j*(((height+width)/2)/16), (width/17), (((height+width)/2)/16));
        }
        else if(level.loadLevel(1)[j+mapY][i+mapX] == 3)
        {
          fill(0,255,255);
          rect(i*(((height+width)/2)/16), j*(((height+width)/2)/16), (width/17), (((height+width)/2)/16));
        }
        else if(level.loadLevel(1)[j+mapY][i+mapX] == 4)
        {
          fill(0,0,255);
          rect(i*(((height+width)/2)/17), j*(((height+width)/2)/17), (width/17), (((height+width)/2)/17));
        }
      }
    }
  }
}
