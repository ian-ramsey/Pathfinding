int squares = 10;
Square[][] grid = new Square[squares][squares];
int gridSize;
ArrayList<Updateable> objs = new ArrayList<Updateable>();
int goalx=0;
int goaly=0;
int startx=9;
int starty=9;
Pathfinder p;
void setup(){
  textSize(15);
  size(1000,1000);
  gridSize=width/squares;
  for(int i=0;i<squares;i++)
    for(int j=0;j<squares;j++){
      grid[i][j]=new Square(j*gridSize,i*gridSize,gridSize);
      objs.add(grid[i][j]);
    }
  dInit();
  p=new Pathfinder(startx*gridSize,starty*gridSize);
  objs.add(p);
}
void draw(){
  background(0);
  for (Updateable i:objs)
    i.update();
}
void mousePressed(){
  int i = (int) (mouseY/gridSize);
  int j = (int) (mouseX/gridSize);
  grid[i][j].isWall=!grid[i][j].isWall;
  dInit();
}
// Start at goal, create an initial arrayList of children of distance d=1
// find children of d=1 arrayList to obtain d=2 arrayList
// repeat until arrayList is empty
void dInit(){
  for(Square[] i:grid)
    for(Square j:i)
      j.d=-1;
  grid[goaly][goalx].d=0;
  ArrayList<Square> childs = grid[goaly][goalx].children();
  while(childs.size()!=0){
    for(int i=childs.size()-1;i>=0;i--){
      ArrayList<Square> k = childs.get(i).children();
      for(int j=0; j<k.size();j++)
        childs.add(k.get(j));
      childs.remove(i);
    }
  }
}