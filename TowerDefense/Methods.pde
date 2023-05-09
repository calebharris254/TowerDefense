//level.loadLevel(levelPlaying)[j+mapY][i+mapX] == 4
/*
void spawnScript()
{
    for( int i = 0; i < bads.size(); i++ )
  {
    bads.get(i).drawMudEnemy();
    if(bads.get(i).pathfinding())
    {
      //player.loseLives((bads.get(i).type-1)/3+1); // 1 1 1 2 2 2 3 3 3 4
      bads.remove(i);
      i--;
    }
    else if( bads.get(i).health <= 0 )
    {
      //player.cash++;
      bads.remove(i);
      i--;
    }
  }
}
/*
RITCHIE SPAWN CODE
 for( int i = 0; i < bads.size(); i++ )
  {
    bads.get(i).drawEnemy();
    if(bads.get(i).move())
    {
      player.loseLives((bads.get(i).type-1)/3+1); // 1 1 1 2 2 2 3 3 3 4
      bads.remove(i);
      i--;
    }
    else if( bads.get(i).health <= 0 )
    {
      player.cash++;
      bads.remove(i);
      i--;
    }
  }
*/
