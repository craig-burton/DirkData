ArrayList<Game> games;
Mode mode;
int modeCount;
enum Mode {
  PTS,PTSPM,STL,RB,FGP,PARALLEL;
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
  size(1000,600);
  modeCount = 0;
  mode = Mode.PTS;
}

void draw() {
  background(0);
  switch(mode) {
    case PTS: 
      drawPoints();
      break;
    case PTSPM:
      drawPointsPerMin();
      break;
    case STL:
      drawSteals();
      break;
    case RB:
      drawRebounds();
      break;
    case FGP:
      drawFGP();
      break;
    case PARALLEL:
      break;
  }
}

void drawPoints() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Points",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    //games.get(i).displayPoints(i,games.size(),color(0,255,0),color(255,0,0),60f,300f); 
    games.get(i).display(i,games.size(),color(0,255,0),color(255,0,0),games.get(i).PTS,60f,games.get(i).TP,18f,300f);
  }  
}

void drawPointsPerMin() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Points Per Minute",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    //games.get(i).displayPointsPerMinute(i,games.size(),color(0,255,0),color(255,0,0),1.5f,50f); 
    games.get(i).display(i,games.size(),color(0,255,0),color(255,0,0),games.get(i).pointsPerMinute(),1.5f,games.get(i).PTS,53f,75f);
  }  
}

void drawSteals() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Steals",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displaySteals(i,games.size(),color(0,255,0),color(255,0,0),8f,300f);
  }   
}

void drawFGP() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Field Goal Percentage",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayFGPercentage(i,games.size(),color(0,255,0),color(255,0,0),100f);
  }
}

void drawRebounds() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("Dirk's Rebounds",width/2,25f);
  for(int i = 0; i < games.size(); i++) {
    games.get(i).displayRebounds(i,games.size(),color(0,255,0),color(255,0,0),30f,100f);
  }    
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
  modeCount++;
  modeCount = modeCount % Mode.values().length;
  mode = Mode.values()[modeCount];  
}