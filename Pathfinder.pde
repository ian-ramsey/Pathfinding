public class Pathfinder implements Updateable {
  float x;
  float y;
  int dx=0;
  int dy=0;
  boolean isDone=false;
  public Pathfinder(int x1, int y1){
    x=x1;
    y=y1;
  }
  public void update() {
    boolean ctrl=false;
    for (int i=-1; i<2; i++)
      for (int j=-1; j<2; j++)
      try {
        if ((i==0||j==0)&&grid[(int)(y/gridSize)+i][(int)(x/gridSize)+j].d!=-1)
          if (grid[(int)(y/gridSize)][(int)(x/gridSize)].d>grid[(int)(y/gridSize)+i][(int)(x/gridSize)+j].d) {
            dy=i;
            dx=j;
            ctrl = true;
          }
      }
    catch(Exception e) {
    }
    if(!ctrl){
    isDone=true;
    }
    x+=dx;
    y+=dy;
    fill(255,0,0);
    ellipse(x,y,10,10);
  }
}
