class Game {
 boolean win;
 boolean started;
 //Minutes Played
 float MP;
 //Field Goals
 float FG;
 //Field Goal Attempts
 float FGA;
 //Three Points
 float TP;
 //Three Point Attempts
 float TPA;
 //Free Throws
 float FT;
 //Free Throw Attempts
 float FTA;
 //Offensive Rebounds
 float ORB;
 //Defensive Rebounds
 float DRB;
 //Assists
 float AST;
 //Steals
 float STL;
 //Blocks
 float BLK;
 //Turnovers
 float TOV;
 //Personal Fouls
 float PF;
 //Points
 float PTS;
 Game(boolean _win,boolean _started,float _MP,float _FG,float _FGA,float _TP,float _TPA,float _FT,float _FTA,float _ORB,float _DRB,float _AST,float _STL,float _BLK,float _TOV,float _PF,float _PTS) {
   win = _win;
   started = _started;
   MP = _MP;
   FG = _FG;
   FGA = _FGA;
   TP = _TP;
   TPA = _TPA;
   FT = _FT;
   FTA = _FTA;
   ORB = _ORB;
   DRB = _DRB;
   AST = _AST;
   STL = _STL;
   BLK = _BLK;
   TOV = _TOV;
   PF = _PF;
   PTS = _PTS;
 }
 
 float freeThrowPercentage() {
   return (FT/FTA);
 }
 
 float totalRebounds() {
   return (DRB+ORB); 
 }
 
 float pointsPerMinute() {
   return PTS/MP; 
 }
 
 float threePointPercentage() {
   return ((float)TP/TPA); 
 }
 
 float fieldGoalPercentage() {
   return (FG/((float)FGA)); 
 }
 
 float points() {
   return PTS; 
 }
 
 float efficiency() {
   return (PTS+(ORB+DRB) +AST+STL+BLK-((FGA-FG)+(FTA-FT)+TOV)); 
 }
 
 float assistTurnoverRatio() {
    return (AST/TOV); 
 }
 
 void print() {
   println("Win: " + win + " Started: " +started+"FTP :" + freeThrowPercentage() + " Rebounds: " + totalRebounds() + " PPM: " + pointsPerMinute() + " TPP: " +threePointPercentage() + " FGP: " + fieldGoalPercentage() + " Efficiency: " + efficiency());
 }
 
 void displayPoints(float gameCount, float maxGameCount, color winColor, color lossColor, float maxY, float maxRadius) {
   ellipseMode(CENTER);
   if(PTS==Float.NaN) {return;}
   if(win) {
     fill(winColor);
   } else {
     fill(lossColor);
   }
   float x = map(gameCount,0f,maxGameCount,10f,width+10);
   float y = height-map(PTS,0,maxY,0,height);
   float rad = map(TP,0,18,0,maxRadius); 
   ellipse(x,y,sqrt(rad),sqrt(rad));
 }
 
  void displayPointsPerMinute(float gameCount, float maxGameCount, color winColor, color lossColor, float maxY, float maxRadius) {
    if(PTS/MP == Float.NaN || PTS==Float.NaN) {return;}
    ellipseMode(CENTER);
   if(win) {
     fill(winColor);
   } else {
     fill(lossColor);
   }
   float x = map(gameCount,0f,maxGameCount,10f,width+10);
   float y = height-map(PTS/MP,0,maxY,0,height);
   float rad = map(PTS,0,60f,0,maxRadius); 
   ellipse(x,y,sqrt(rad),sqrt(rad));
 }

  void displayRebounds(float gameCount, float maxGameCount, color winColor, color lossColor, float maxY, float maxRadius) {
    ellipseMode(CENTER);
    if(totalRebounds()==Float.NaN || PTS==Float.NaN) {return;}
    if(win) {
      fill(winColor);
    } else {
      fill(lossColor);
    }
    float x = map(gameCount, 0f, maxGameCount, 10f, width+10f);
    float y = height-map((DRB+ORB),0f,maxY,0,height);
    float rad = map(PTS,0f,60f,0f,maxRadius);
    ellipse(x,y,sqrt(rad),sqrt(rad));
  }
  
  void displayFGPercentage(float gameCount, float maxGameCount, color winColor, color lossColor, float maxRadius) {
    if(fieldGoalPercentage()==Float.NaN || PTS==Float.NaN) {return;}
    ellipseMode(CENTER);
    if(win) {
      fill(winColor);
    } else {
      fill(lossColor);
    }
    float x = map(gameCount, 0f, maxGameCount, 10f, width+10f);
    float y = height-map(fieldGoalPercentage(),0f,1f,0,height);
    float rad = map(PTS,0f,60f,0f,maxRadius);
    ellipse(x,y,sqrt(rad),sqrt(rad));
  }
  
  void displayFTPercentage(float gameCount, float maxGameCount, color winColor, color lossColor, float maxRadius) {
    if(freeThrowPercentage()==Float.NaN || PTS==Float.NaN) {return;}
    ellipseMode(CENTER);
    if(win) {
      fill(winColor);
    } else {
      fill(lossColor);
    }
    float x = map(gameCount,0f,maxGameCount,10f,width+10f);
    float y = height-map(freeThrowPercentage(),0f,1.2f,0,height);
    float rad = map(PTS,0f,60f,0f,maxRadius);
    ellipse(x,y,sqrt(rad),sqrt(rad));
    
  }
  
  void displayTPPercentage(float gameCount, float maxGameCount, color winColor, color lossColor, float maxRadius) {
    if(threePointPercentage() == Float.NaN || PTS==Float.NaN) {return;}
    ellipseMode(CENTER);
    if(win) {
      fill(winColor);
    } else {
      fill(lossColor);
    }
    float x = map(gameCount,0f,maxGameCount,10f,width+10f);
    float y = height-map(threePointPercentage(),0f,1.2f,0,height);
    float rad = map(PTS,0f,60f,0f,maxRadius);
    ellipse(x,y,sqrt(rad),sqrt(rad));
    
  }  
  
  void display(float gameCount, float maxGameCount, color winColor, color lossColor, float yToMap, float maxY, float radToMap, float maxRadMap, float maxRadius) {
    ellipseMode(CENTER);
    if(win) {
      fill(winColor);
    } else {
      fill(lossColor);
    }
    float x = map(gameCount, 0f, maxGameCount, 10f, width+10f);
    float y = height-map(yToMap,0f,maxY,0,height);
    float rad = map(radToMap,0f,maxRadMap,0f,maxRadius);
    ellipse(x,y,sqrt(rad),sqrt(rad));
  }
};