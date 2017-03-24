public class Square implements Updateable {
  int d=-1;
  int x;
  int y;
  int w;
  boolean isWall;
  public Square(int x1, int y1, int w1) {
    x=x1;
    y=y1;
    w=w1;
  }
  public void update() {
    if (isWall) {
      fill(0);
      rect(x, y, w, w);
      fill(255);
      text(""+d, x, y+gridSize);
    } else if(d==0){
      fill(0,255,0);
      rect(x, y, w, w);
      fill(255,0,255);
      text(""+d, x, y+gridSize);
    } 
    else{
      fill(255);
      rect(x, y, w, w);
      fill(0);
      text(""+d, x, y+gridSize);
    }
  }
  public ArrayList<Square> children() {
    ArrayList<Square> out = new ArrayList<Square>();
    for (int i=-1; i<2; i++)
      for (int j=-1; j<2; j++)
      try {
        if(i==0||j==0)
        if (!grid[i+y/gridSize][j+x/gridSize].isWall)
          if (grid[i+y/gridSize][j+x/gridSize].d==-1||grid[i+y/gridSize][j+x/gridSize].d>d+1) {
            grid[i+y/gridSize][j+x/gridSize].d=d+1;
            out.add(grid[i+y/gridSize][j+x/gridSize]);
          }
      }
    catch(Exception e) {
    }
    return out;
  }
}
