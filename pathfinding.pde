int squares = 25;
int pathfinders=100;
int gridSize;
int goalx=0;
int goaly=0;
int startx;
int starty;
Square[][] grid = new Square[squares][squares];
ArrayList<Updateable> objs = new ArrayList<Updateable>();
ArrayList<Pathfinder> ps = new ArrayList<Pathfinder>();
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
  for(int i=0;i<pathfinders;i++){
    startx=(int)(Math.random()*squares);
    starty=(int)(Math.random()*squares);
    if (!grid[starty][startx].isWall){
      Pathfinder p=new Pathfinder(startx*gridSize,starty*gridSize);
      ps.add(p);
    }
    else{
      i--;
    }
  }
}
void draw(){
  background(0);
  for (Updateable i:objs)
    i.update();
  for (Pathfinder p:ps){
    p.update();
    if(p.isDone){
      int k=(int)(Math.random()*squares);
      int l=(int)(Math.random()*squares);
      while(grid[k][l].isWall){
      k = (int)(Math.random()*squares);
      l = (int)(Math.random()*squares);
      }
      p.x=k*gridSize;
      p.y=l*gridSize;
      p.isDone=false;
    }
  }
}
void mousePressed(){
  int i = (int) (mouseY/gridSize);
  int j = (int) (mouseX/gridSize);
  grid[i][j].isWall=!grid[i][j].isWall;
  dInit();
}
void keyPressed(){
  if (key=='a'){
    goalx=(int) (mouseX/gridSize);
    goaly=(int) (mouseY/gridSize);
    dInit();
  }
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
