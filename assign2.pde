//You should implement your assign2 here.

final int gameStart=1, gameWin=2, gameLose=3, gameRun=4;
int gameState=0;

//fighter hp value
int hpValue=100;
//int hpValue=floor(random(101)); 
//int hpValue=20;
int treasurePosX=floor(random(width-90))+50;
int treasurePosY=floor(random(height-90))+50;
int enemy1PosX=0;
int enemy1PosY=floor(random(height-90))+50;
int fighterPosX=floor(random(width-90))+50;
int fighterPosY=floor(random(height-90))+50;
int bg1PosX=0;
// int bg1PosY=0;
int bg2PosX=-641;
// int bg2PosY=0;
int enemySpeedX=20;
int enemySpeedY=20;
int treasureSpeedX=10;
PImage backgroundImg1;
PImage backgroundImg2;
PImage fighterimg;
PImage hpImg;
PImage enemyImg;
PImage treasureImg;

void setup(){
size (640, 480);
gameState=gameStart;

PImage backgroundImg1=loadImage("img/bg1.png");
PImage backgroundImg2=loadImage("img/bg2.png");
PImage fighterimg = loadImage("img/fighter.png");
PImage hpImg=loadImage("img/hp.png");
PImage enemyImg = loadImage("img/enemy.png");
PImage treasureImg = loadImage("img/treasure.png");

image (backgroundImg1, bg1PosX, 0);
image (backgroundImg2, bg2PosX, 0);
image(fighterimg, fighterPosX, fighterPosY);
image(hpImg,10,10);
println("hpValue=", hpValue);
stroke(0,0,50);fill(0,0,50);
rect(21, 15, 190, 20); //full hp == 190 hp

}

void draw (){
switch (gameState){

case gameStart:
mousePressed();{
gameState = gameRun;
}
break;

case gameWin:
println("win");
break;
case gameLose:
println("lose");

// canvas gray to black
noStroke();
for (int fillColor=100; fillColor <255; fillColor+=10){
fill (fillColor);
}
break;

case gameRun:

// background run
image (backgroundImg1, bg1PosX++, 0);
image (backgroundImg2, bg2PosX++, 0);
if (bg1PosX>641){bg1PosX=-640;};
if (bg2PosX>641){bg2PosX=-640;};


// figher position = mouse position

if (mouseX>=0 && mouseX<=width){
fighterPosX=mouseX;
}
else if(mouseX<0){
fighterPosX=0;
}
else {
fighterPosX=width;
}

if (mouseY>=0 && mouseY<=height){
fighterPosY=mouseY;
}
else if(mouseY<0){
fighterPosY=0;
}
else{
fighterPosY=height;
}

image(fighterimg, fighterPosX, fighterPosY);

// hp value
stroke(0,0,200);fill(0,0,200);
if (hpValue<40){stroke(250,20,20);fill(250,20,20);}
rect(21, 15, hpValue*1.9, 20);

// enemy position
if (enemy1PosX>width){
enemy1PosX=0;
}
image (enemyImg, enemy1PosX, enemy1PosY);

if (fighterPosX-enemy1PosX>20){
enemy1PosX+=enemySpeedX;
}

if (fighterPosY-enemy1PosY>20){
enemy1PosY+=enemySpeedY;
}

if (enemy1PosY-fighterPosY>20){
enemy1PosY-=enemySpeedY;
}

if ((Math.abs(fighterPosX-enemy1PosX)<20)&&Math.abs(fighterPosY-enemy1PosY)<20){
enemy1PosX=0;
enemy1PosY=floor(random(height-90))+50;
hpValue-=20;
}

//treasure position

if (fighterPosX-treasurePosX>20){
treasurePosX+=treasureSpeedX;
}

if ((Math.abs(fighterPosX-treasurePosX)<20)&&Math.abs(fighterPosY-treasurePosY)<20){
treasurePosX=floor(random(width-90))+50;
treasurePosY=floor(random(height-90))+50;
hpValue+=10;
}

//hp value <=0
if (hpValue<=0){
gameState=gameLose;
}

image (backgroundImg1, bg1PosX, 0);
image (backgroundImg2, bg2PosX, 0);
image(fighterimg, fighterPosX, fighterPosY);
image(hpImg,10,10);
println("hpValue=", hpValue);
stroke(0,0,50);fill(0,0,50);
rect(21, 15, 190, 20); 
//full hp == 190 hp


break;

}
}
