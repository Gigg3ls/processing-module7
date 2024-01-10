final color LIGHT_GRAY = #D6D6D6;
final color GRAY = #ADADAD;
final color BLUE = #00439D;
final color WHITE = #ffffff;
final color BLACK = #000000;

float grafXLeft = 25;
float grafYLeft = 25;
float grafXRight, grafYRight;
float dotSize = 10;
int[] numbersOfGraduated;

void setup() {
  size(500, 300);  
  smooth();    
  numbersOfGraduated = loadInts("numbers of students graduated.txt");    
}

void draw() {
  background(LIGHT_GRAY);
  drawGraf();
  drawDots();  
}

void drawGraf() {
  grafXRight = width - grafXLeft;
  grafYRight = height - 2 * grafYLeft;
  
  fill(GRAY);
  stroke(BLACK);
  rectMode(CORNERS);
  rect(grafXLeft, grafYLeft, grafXRight, grafYRight);
}

void drawDots() {
  float dotOffSet = (grafXRight - grafXLeft) / (numbersOfGraduated.length - 1);
  
  for(int i = 0; i < numbersOfGraduated.length; i++){    
    float dotX = grafXLeft + i * dotOffSet;
    float dotY = map(numbersOfGraduated[i], min(numbersOfGraduated),
                     max(numbersOfGraduated), grafYRight, grafYLeft);  
                     
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
  }  
}

void drawText(float dotX, float dotY, int value) {
   int textRectWidth = 25;
   int textRectHeight = 25;
   int textRectOffSet = 20;
   int textXOffSet =  8;
   int textYOffSet = 15;
   
   rectMode(CENTER);
   rect(dotX, dotY - textRectOffSet, textRectWidth, textRectHeight);
   fill(WHITE);
   stroke(WHITE);
   text(value, dotX - textXOffSet, dotY - textYOffSet);
   fill(BLACK);
   stroke(BLACK);  
}
