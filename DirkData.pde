ArrayList<Game> games;
Mode mode;
int modeCount;
boolean first;
enum Mode {
  INTRO,PTS,PTSPM,RB,FGP,FTP,TPP,PARALLEL,MAX;
};

void setup() {
  games = readGameTable("dirk98-99.csv",true);
  games.addAll(readGameTable("dirk99-00.csv",true));
  games.addAll(readGameTable("dirk00-01.csv",true));
  games.addAll(readGameTable("dirk01-02.csv",true));
  games.addAll(readGameTable("dirk02-03.csv",true));
  games.addAll(readGameTable("dirk03-04.csv",true));
  games.addAll(readGameTable("dirk04-05.csv",true));
  games.addAll(readGameTable("dirk05-06.csv",true));
  games.addAll(readGameTable("dirk06-07.csv",true));
  games.addAll(readGameTable("dirk07-08.csv",true));
  games.addAll(readGameTable("dirk08-09.csv",true));
  games.addAll(readGameTable("dirk09-10.csv",true));
  games.addAll(readGameTable("dirk10-11.csv",true));
  games.addAll(readGameTable("dirk11-12.csv",true));
  games.addAll(readGameTable("dirk12-13.csv",true));
  games.addAll(readGameTable("dirk13-14.csv",true));
  games.addAll(readGameTable("dirk14-15.csv",true));
  games.addAll(readGameTable("dirk15-16.csv",true));
  games.addAll(readGameTable("dirk16-17.csv",true));
  size(1300,700);
  modeCount = 0;
  mode = Mode.INTRO;
  first = true;
  noLoop();
}

void draw() {
  background(0);
  switch(mode) {
    case INTRO:
      if(first) {
        drawIntro();
        first = false;
      } else {
        mode = Mode.PTS;
      }
      break;
    case PTS: 
      drawPoints();
      break;
    case PTSPM:
      drawPointsPerMin();
      break;
    case RB:
      drawRebounds();
      break;
    case FGP:
      drawFGP();
      break;
    case FTP:
      drawFTP();
      break;
    case TPP:
      drawTPP();
      break;
    case PARALLEL:
      drawParallel();
      break;
    case MAX:
      drawMax();
      break;
  }
}

void drawIntro() {
  textSize(30);
  fill(255);
  textAlign(CENTER);
  text("This is a visualization of Dirk Novitzki's career data, written by Craig Burton",width/2,200f);
  textSize(25);
  text("Click to move through each different graph",width/2,300f);
  text("The scatterplot's radii are scaled by Dirk's points unless otherwise specified",width/2,350f);
}

void drawPoints() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Points (scaled by three pointers)",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayPoints(i,games.size(),color(0,255,0),color(255,0,0),60f,300f); 
    //games.get(i).display(i,games.size(),color(0,255,0),color(255,0,0),games.get(i).PTS,60f,games.get(i).TP,18f,300f);
  }
  fill(color(255));
  float y = map(mouseY,0,height,0,60f);
  textSize(15);
  text("Mouse at: " + (int)(60-y)+ " points",mouseX,40f);
}

void drawPointsPerMin() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Points Per Minute",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayPointsPerMinute(i,games.size(),color(0,255,0),color(255,0,0),1.5f,100f); 
    //games.get(i).display(i,games.size(),color(0,255,0),color(255,0,0),games.get(i).pointsPerMinute(),1.6f,games.get(i).PTS,53f,75f);
  }
  fill(color(255));
  float y = map(mouseY,0,height,0,1.6f);
  textSize(15);
  text("Mouse at: " + (1.6-y) +"points per minute",mouseX,40f);
}

void drawFGP() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Field Goal Percentage",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayFGPercentage(i,games.size(),color(0,255,0),color(255,0,0),100f);
  }
  fill(color(255));
  float y = map(mouseY,0,height,0,1f);
  textSize(15);
  text("Mouse at: " + (int)(100-(y*100f))+" percent",mouseX,40f);
}

void drawRebounds() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Rebounds",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayRebounds(i,games.size(),color(0,255,0),color(255,0,0),30f,100f);
  }
  fill(color(255));
  float y = map(mouseY,0,height,0,30f);
  textSize(15);
  text("Mouse at: " + (int)(30-y)+ " rebounds",mouseX,40f);
}

void drawFTP() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Free Throw Percentage",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayFTPercentage(i,games.size(),color(0,255,0),color(255,0,0),100f); 
  }
  fill(color(255));
  float y = map(mouseY,0,height,0,1.2f);
  textSize(15);
  text("Mouse at: " + (int)(120-(y*100f))+" percent",mouseX,40f);
}

void drawTPP() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Three Point Percentage",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayTPPercentage(i,games.size(),color(0,255,0),color(255,0,0),100f); 
  }
  fill(color(255));
  float y = map(mouseY,0,height,0,1.2f);
  textSize(15);
  text("Mouse at: " + (int)(120-(y*100f))+" percent",mouseX,40f);
}

void drawParallel() {
  textSize(20);
  fill(255);
  text("Parallel Coordinates",width/2,25f);
  float winX = 50;
  float winY = 250;
  float lossY = 450;
  float PTSX = 450;
  float ASTX = 850;
  float RBX = 1250;
  //fill(255);
  stroke(255);
  strokeWeight(5);
  textAlign(CENTER);
  line(winX,50f,winX,650f);
  text("Win/Loss",winX,675f);
  line(PTSX,50f,PTSX,650f);
  text("Points",PTSX,675f);
  line(ASTX,50f,ASTX,650f);
  text("Assists",ASTX,675f);
  line(RBX,50f,RBX,650f);
  text("Rebounds",RBX,675f);
  strokeWeight(2);
  for(int i = 0; i < games.size(); i++) {
    Game g = games.get(i);
    float wy;
    if(g.win) {
      wy = winY;
      stroke(color(0,255,0));
    } else {
      wy = lossY;
      stroke(color(255,0,0));
    }
    line(winX,wy,PTSX,height-(map(g.PTS,0f,60f,50f,650f)+20f));
    line(PTSX,height-(map(g.PTS,0f,60f,50f,650f)+20f),ASTX,height-(map(g.AST,0f,13f,50f,650f)+20f));
    line(ASTX,height-(map(g.AST,0f,13f,50f,650f)+20f),RBX,height-map(g.totalRebounds(),0f,25f,50f,650f));
    
  }
  
  
}

void drawMax() {
  textSize(20);
  fill(255);
  text("Maximums",width/2,25f);
}

ArrayList<Game> readGameTable(String str, boolean header) {
  Table games;
  ArrayList<Game> ret = new ArrayList<Game>();
  if(header) {
    games = loadTable(str, "header");
  } else {
    games = loadTable(str);
  }
  int rows = games.getRowCount();
  for(int i = 0; i<rows; i++) {
    String winString = games.getString(i,7);
    boolean win = (split(winString,' ')[0]).equals("W");
    int startedInt = games.getInt(i,8);
    boolean started = startedInt == 1;
    String minutesString = games.getString(i,9);
    int minutes;
    try {
       minutes = Integer.parseInt((split(minutesString,':')[0]));
    } catch (Exception e) {
      minutes = 0;
    }
    float FG = games.getFloat(i,10);
    float FGA = games.getFloat(i,11);
    float TP = games.getFloat(i,13);
    float TPA = games.getFloat(i,14);
    float FT = games.getFloat(i,16);
    float FTA = games.getFloat(i,17);
    float ORB = games.getFloat(i,19);
    float DRB = games.getFloat(i,20);
    float AST = games.getFloat(i,22);
    float STL = games.getFloat(i,23);
    float BLK = games.getFloat(i,24);
    float TOV = games.getFloat(i,25);
    float PF = games.getFloat(i,26);
    float PTS = games.getFloat(i,27);
    Game add = new Game(win,started,minutes,FG,FGA,TP,TPA,FT,FTA,ORB,DRB,AST,STL,BLK,TOV,PF,PTS);
    ret.add(add);
  }
  return ret; 
}

void mousePressed() {
  loop();
  modeCount++;
  modeCount = modeCount % Mode.values().length;
  mode = Mode.values()[modeCount];  
}