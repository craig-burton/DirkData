import java.util.*;

//Game arraylist
ArrayList<Game> games;

//Maximum variables
//max->Pts,Asts,Thrs,Rbs,Blks
ArrayList<HashSet<Float>> max;
ArrayList<Float> ptsmax;
ArrayList<Float> astmax;
ArrayList<Float> thrmax;
ArrayList<Float> rbsmax;
ArrayList<Float> blkmax;

//Dealing with mode control
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
  max = prepMax();
  ptsmax = new ArrayList<Float>(max.get(0));
  astmax = new ArrayList<Float>(max.get(1));
  thrmax = new ArrayList<Float>(max.get(2));
  rbsmax = new ArrayList<Float>(max.get(3));
  blkmax = new ArrayList<Float>(max.get(4));
  java.util.Collections.sort(ptsmax);
  println("ptsmax : " + ptsmax.get(0) + " " + ptsmax.get(1) + " " + ptsmax.get(2) + " " + ptsmax.get(3) + " " + ptsmax.get(4) + " ");
  java.util.Collections.sort(astmax);
  java.util.Collections.sort(thrmax);
  java.util.Collections.sort(rbsmax);
  java.util.Collections.sort(blkmax);
}

void draw() {
  noStroke();
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
  text("This is a visualization of Dirk Nowitzki's career data, written by Craig Burton",width/2,200f);
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
  }
  fill(color(255));
  float y = map(mouseY,0,height,0,1.6f);
  textSize(15);
  text("Mouse at: " + (1.6-y) +" points per minute",mouseX,40f);
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
    if(g.PTS==Float.NaN || g.AST == Float.NaN || g.totalRebounds() == Float.NaN) {continue;}
    line(winX,wy,PTSX,height-(map(g.PTS,0f,60f,50f,650f)+20f));
    line(PTSX,height-(map(g.PTS,0f,60f,50f,650f)+20f),ASTX,height-(map(g.AST,0f,13f,50f,650f)+20f));
    line(ASTX,height-(map(g.AST,0f,13f,50f,650f)+20f),RBX,height-map(g.totalRebounds(),0f,25f,50f,650f));
    
  }
  
  
}

void drawMax() {
  textSize(20);
  fill(255);
  text("Maximums",width/2,25f); 
  
  //Pts,Asts,Tps,Rbs,Blks
  ellipseMode(CENTER);
  float maxRad =150f;
  noStroke();
  text("Threes",100,50);
  drawCircsMax(100,thrmax,maxRad,8f,color(0,100,255));
 
  fill(255);
  text("Assits",375,50);
  drawCircsMax(375,astmax,maxRad,12f,color(255,0,0));
  
  fill(255);
  text("Points",650f,50f);
  drawCircsMax(650,ptsmax,maxRad,53f,color(0,255,0));

  fill(255);
  text("Rebounds",925,50);
  drawCircsMax(925,rbsmax,maxRad,23f,color(255,0,255));
  
  fill(255);
  text("Blocks",1200,50);
  drawCircsMax(1200,blkmax,maxRad,7f,color(255,255,0));
  
}

void drawCircsMax(float x, ArrayList<Float> m,float rad, float mapTo, color col) {
  drawCircMax(x,170,m.get(4),mapTo,rad,col);
  drawCircMax(x,290,m.get(3),mapTo,rad,col);
  drawCircMax(x,410,m.get(2),mapTo,rad,col);
  drawCircMax(x,530,m.get(1),mapTo,rad,col);
  drawCircMax(x,650,m.get(1),mapTo,rad,col);
}

void drawCircMax(float x, float y, float val, float maxMap, float maxRad, color fillCol) {
  ellipseMode(CENTER);
  fill(fillCol);
  float r = map(val,0f,maxMap,0f,maxRad);
  ellipse(x,y,r,r);
  fill(255);
  textAlign(CENTER);
  textSize(15);
  fill(0);
  text(str(val),x,y);
}

ArrayList<HashSet<Float>> prepMax() {
  ArrayList<Float> points = new ArrayList<Float>(games.size());
  ArrayList<Float> assists = new ArrayList<Float>(games.size());
  ArrayList<Float> threes = new ArrayList<Float>(games.size());
  ArrayList<Float> rebounds = new ArrayList<Float>(games.size());
  ArrayList<Float> blocks = new ArrayList<Float>(games.size());
  for(int i = 0; i < games.size(); i++) {
    Game g = games.get(i);
    points.add(g.PTS);
    assists.add(g.AST);
    threes.add(g.TP);
    rebounds.add(g.totalRebounds());
    blocks.add(g.BLK);
  }
  java.util.Collections.sort(points);
  java.util.Collections.sort(assists);
  java.util.Collections.sort(threes);
  java.util.Collections.sort(rebounds);
  java.util.Collections.sort(blocks);
  HashSet<Float> ptsmax = new HashSet<Float>();
  HashSet<Float> astmax = new HashSet<Float>();
  HashSet<Float> thrmax = new HashSet<Float>();
  HashSet<Float> rbsmax = new HashSet<Float>();
  HashSet<Float> blkmax = new HashSet<Float>();
  int i = games.size()-1;
  while(ptsmax.size()<=5 && i >=0) {
    ptsmax.add(points.get(i)); 
    i--;
  }
  i = games.size()-1;
  while(astmax.size()<=5 && i >=0) {
    astmax.add(assists.get(i));  
    i--;
  }
  i = games.size()-1;
  while(thrmax.size()<=5 && i >=0) {
    thrmax.add(threes.get(i));  
    i--;
  }
  i = games.size()-1;
  while(rbsmax.size()<=5 && i >=0) {
    rbsmax.add(rebounds.get(i));  
    i--;
  }
  i = games.size()-1;
  while(blkmax.size()<=5 && i >=0) {
    blkmax.add(blocks.get(i)); 
    i--;
  }
  ArrayList<HashSet<Float>> ret = new ArrayList<HashSet<Float>>();
  ret.add(ptsmax);
  ret.add(astmax);
  ret.add(thrmax);
  ret.add(rbsmax);
  ret.add(blkmax);
  return ret;
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