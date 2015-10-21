//You should implement your assign2 here.

final int gameStart=1, gameWin=2, gameLose=3, gameRun=4;
int gameState=0;

//fighter hp value
int hpValue=20;
//int hpValue=floor(random(101)); 
//int hpValue=20;
int treasurePosX;
int treasurePosY;
int enemy1PosX=0;
int enemy1PosY;
int fighterPosX;
int fighterPosY;

int bg1PosX=0;
// int bg1PosY=0;
int bg2PosX=-641;
// int bg2PosY=0;
int enemySpeedX=2;
int enemySpeedY=2;
int treasureSpeedX=3;
//distance between fighter and enemy
int fEDis=55;
//distance between fighter and treasure
int fTDis=45;

PImage backgroundImg1;
PImage backgroundImg2;
PImage fighterimg;
PImage hpImg;
PImage enemyImg;
PImage treasureImg;
PImage startImg1;
PImage startImg2;
PImage endImg1;
PImage endImg2;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup(){
size (640, 480);
gameState=gameStart;



backgroundImg1=loadImage("img/bg1.png");
backgroundImg2=loadImage("img/bg2.png");
fighterimg = loadImage("img/fighter.png");
hpImg=loadImage("img/hp.png");
enemyImg = loadImage("img/enemy.png");
treasureImg = loadImage("img/treasure.png");
startImg1 = loadImage("img/start1.png");
startImg2 = loadImage("img/start2.png");
endImg1 = loadImage("img/end1.png");
endImg2 = loadImage("img/end2.png");

/*
image (backgroundImg1, bg1PosX, 0);
image (backgroundImg2, bg2PosX, 0);
image(fighterimg, fighterPosX, fighterPosY);
image(hpImg,10,10);
image (treasureImg, treasurePosX, treasurePosY);
println("hpValue=", hpValue);
stroke(0,0,50);fill(0,0,50);
rect(21, 15, 190, 20); //full hp == 190 hp
*/

}

void mousePressed(){
println("mousePressed");
if (gameState==gameStart){gameState=gameRun;hpValue=20;}
else if (gameState==gameLose){gameState=gameStart;}
else if (gameState==gameWin){gameState=gameStart;}
else{println("mousePressed else");}
}


//fighter position controlled by keyboard
void keyPressed() {
if (key == CODED) {
switch (keyCode) {
case UP:
upPressed = true;
println("upPressed");
break;
case DOWN:
downPressed = true;
println("downPressed");
break;
case LEFT:
leftPressed = true;
println("leftPressed");
break;
case RIGHT:
rightPressed = true;
println("rightPressed");
break;
}
}
}

void keyReleased() {
if (key == CODED) {
switch (keyCode) {
case UP:
upPressed = false;
break;
case DOWN:
downPressed = false;
break;
case LEFT:
leftPressed = false;
break;
case RIGHT:
rightPressed = false;
break;
}
}
}


void draw (){
switch (gameState){

case gameStart:
println("gameStart");
image (startImg1, 0, 0);
treasurePosX=floor(random(width-90))+50;
treasurePosY=floor(random(height-90))+50;
enemy1PosX=0;
enemy1PosY=floor(random(height-90))+50;
fighterPosX=floor(random(width-90))+50;
fighterPosY=floor(random(height-90))+50;
break;

case gameWin:
println("gameStart");
break;
case gameLose:
image (endImg1, 0, 0);
println("gameLose");

// canvas gray to black
noStroke();
for (int fillColor=100; fillColor <255; fillColor+=10){
fill (fillColor);
}
break;

case gameRun:
println("gameRun");
// background run
image (backgroundImg1, bg1PosX++, 0);
image (backgroundImg2, bg2PosX++, 0);
if (bg1PosX>641){bg1PosX=-640;}
if (bg2PosX>641){bg2PosX=-640;}

/*
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
*/

//fighter position controlled by keyboard
if(upPressed==true && fighterPosY-3>0){fighterPosY-=3;}
if(downPressed==true&&fighterPosY+3<height-51){fighterPosY+=3;}
if(leftPressed==true&&fighterPosX-3>0){fighterPosX-=3;}
if(rightPressed==true&&fighterPosX+3<width-51){fighterPosX+=3;}
image(fighterimg, fighterPosX, fighterPosY);
println("fighterPosX=", fighterPosX);
println("fighterPosY=", fighterPosY);

// hp value
stroke(0,0,50);fill(0,0,50);
rect(21, 15, 190, 20); //full hp == 190 point
println("hpValue=", hpValue);
stroke(0,0,200);fill(0,0,200);
if (hpValue<40){stroke(250,20,20);fill(250,20,20);}
if(hpValue>0){
rect(21, 15, hpValue*1.9, 20); //full hp == 190 point
image(hpImg,10,10);
}

// enemy position
if (enemy1PosX>width){
enemy1PosX=0;
}
if (fighterPosX-enemy1PosX>fEDis){
enemy1PosX+=enemySpeedX;
}
if (fighterPosX-enemy1PosX<0){
enemy1PosX+=enemySpeedX;
}
if (fighterPosY-enemy1PosY>fEDis){
enemy1PosY+=enemySpeedY;
}
if (enemy1PosY-fighterPosY>fEDis){
enemy1PosY-=enemySpeedY;
}
if ((Math.abs(fighterPosX-enemy1PosX)<=fEDis)&&Math.abs(fighterPosY-enemy1PosY)<=fEDis){
enemy1PosX=0;
enemy1PosY=floor(random(height-90))+50;
hpValue-=20;
}
image (enemyImg, enemy1PosX, enemy1PosY);

//hp value <=0
if (hpValue<=0){
gameState=gameLose;
}

//treasure position
//if (fighterPosX-treasurePosX>fTDis){
treasurePosX+=treasureSpeedX;
//}
if ((Math.abs(fighterPosX-treasurePosX)<fTDis)&&Math.abs(fighterPosY-treasurePosY)<fTDis){
treasurePosX=floor(random(width-90))+50;
treasurePosY=floor(random(height-90))+50;
hpValue+=10;
if (hpValue>100){hpValue=100;}
}
image (treasureImg, treasurePosX, treasurePosY);
if (treasurePosX>640){treasurePosX=0;}






break;

}
}
