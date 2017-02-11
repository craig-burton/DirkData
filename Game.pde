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
   println("FG: " + FG + " FGA: " + FGA);
   return ((float)FG/FGA); 
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
 
 void displayPointsMinutes(float gameCount, float maxGameCount, color winColor, color lossColor, float maxY, float maxRadius) {
   ellipseMode(CENTER);
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
 
 void displaySteals(float gameCount, float maxGameCount, color winColor, color lossColor, float maxY, float maxRadius) {
    ellipseMode(CENTER);
    if(win) {
      fill(winColor);
    } else {
      fill(lossColor);
    }
    float x = map(gameCount, 0f, maxGameCount, 10f, width+10f);
    float y = height-map(STL,0f,maxY,0,height);
    float rad = map(PTS,0f,60f,0f,maxRadius);
    ellipse(x,y,sqrt(rad),sqrt(rad));
     
  }
  
  void displayRebounds(float gameCount, float maxGameCount, color winColor, color lossColor, float maxY, float maxRadius) {
    ellipseMode(CENTER);
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
};