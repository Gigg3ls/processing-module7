final color LIGHT_GRAY = #D6D6D6;
final color GRAY = #ADADAD;
final color BLUE = #00439D;
final color WHITE = #ffffff;
final color BLACK = #000000;

float grafX = 25;
float grafY = 25;
float grafWidth, grafHeight;
float dotSize = 10;
int startYear = 1995;
float yearY;
int[] numbersOfGraduated;
int[] dateYear;

void setup() {
  size(500, 300);  
  smooth();    
  numbersOfGraduated = loadInts("numbers of students graduated.txt");
  dateYear = new int[numbersOfGraduated.length];
  for (int i = 0; i < numbersOfGraduated.length; i++) {
    dateYear[i] = startYear + i;
  }    
}

void draw() {
  background(LIGHT_GRAY);
  drawGraf();
  drawDots();  
}

void drawGraf() {
  grafWidth = width - grafX;
  grafHeight = height - 2 * grafY;
  yearY = grafY + grafHeight;
  fill(GRAY);
  stroke(BLACK);
  rectMode(CORNERS);
  rect(grafX, grafY, grafWidth, grafHeight);
}

void drawDots() {
  float dotOffSet = (grafWidth - grafX) / (numbersOfGraduated.length - 1);
  
  for(int i = 0; i < numbersOfGraduated.length; i++){    
    float dotX = grafX + i * dotOffSet;
    float dotY = map(numbersOfGraduated[i], min(numbersOfGraduated),
                     max(numbersOfGraduated), grafHeight, grafY);                 
    if (dist(dotX, dotY, mouseX, mouseY) < dotSize / 2) {          
      fill(BLACK);
      stroke(BLACK);
      drawText(dotX, dotY,numbersOfGraduated[i]);     
    }
    else {
       fill(BLUE);
       stroke(BLUE);
    }       
    ellipse(dotX, dotY, dotSize, dotSize);
    drawDateYear(dotX, dateYear[i]);
  }  
}

void drawText(float dotX, float dotY, int value) {
   int textRectWidth = 25;
   int textRectHeight = 25;
   int textRectOffSet = 20;
   int textYOffSet = 15;
   
   rectMode(CENTER);
   rect(dotX, dotY - textRectOffSet, textRectWidth, textRectHeight);
   fill(WHITE);
   stroke(WHITE);
   text(value, dotX , dotY - textYOffSet);
   fill(BLACK);
   stroke(BLACK);  
}

void drawDateYear(float dotX, int year) {
  fill(BLACK);
  stroke(BLACK);
  textAlign(CENTER);
  text(year, dotX, yearY);
}
