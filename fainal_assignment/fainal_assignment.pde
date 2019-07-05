//PImage img;
int number_of_object= 5;
float[] object_x;
float[] object_y;
float object_radius=50;
float player_x,player_y;
float player_width;
int score;

void setup() {
  size(1600, 900);
  object_x = new float[number_of_object];
  object_y = new float[number_of_object];
  //img = loadImage("wood.jpg");
  init_object();
  init_player();
  score=0;
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0,255,0);  
  if(frameCount<60*5){
    //image(img,0,0);
    display_object();
    fall_object();
    display_player();
    move_player();
    check_hit();
    textSize(100);
    text(score,200,100);
  }else{
    textSize(150);
    text(score, width/2, height/2);
  }
}

void init_object() {
  for (int i=0; i<number_of_object; i+=1 ) {
    object_x[i] = (width/(number_of_object+1))*(i+1);
    object_y[i] =100;
  }
}

void display_object() {
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  for (int i=0; i<number_of_object; i+=1) {
    ellipse(object_x[i], object_y[i], object_radius, object_radius);
  }
}

void fall_object() {
  for(int i=0; i<number_of_object; i+=1){
    object_y[i]+= 10;
    if(object_y[i] > height){
      object_y[i]=100;
    }
  }
}

void init_player(){
  player_x = (width/2);
  player_y = (height-200);
  player_width = 200;
}

void display_player(){
  fill(255);
  rect(player_x,player_y,player_width,50);
}

void move_player(){
 if (keyPressed==true){
   if(key =='a'){
     player_x -= 20;     
   }
   if(key =='d'){
       player_x +=20;
   }   
 }
}

void check_hit(){
  for(int i=0; i<number_of_object; i+=1){
    if(object_x[i]+object_radius > player_x){
      if(object_y[i]+object_radius > player_y){
        if(player_x+player_width > object_x[i]-object_radius){
          object_y[i] = 100;
         score +=100;
        }
      }
    }
  }
  
}
