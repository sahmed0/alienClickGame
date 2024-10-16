PImage space, home; //<>//
int sumAliens = 8, textSize = 80, score = 0, deathCount = 0, gameOverCount = 5;
earth e;
Player p;
enum gameMode    //game modes. start = splash screen, play = gameplay, gameOver = end screen after all lives lost
{
 start,
 play,
 gameOver
}
gameMode currentGameMode = gameMode.start; //set initial gameMode as start so game starts at splash screen

alien[] moog = new alien[sumAliens];

void setup()
{
 size(950, 700);
 e = new earth();
 p = new Player();
 for (int i = 0; i < moog.length; i++)
  moog[i] = new alien();
}

void draw()
{
 switch (currentGameMode)
 {
  case start:
   startMode();
  break;

  case play:
   play();
  break;

  case gameOver:
   gameOver();
  break;
 }
}

void startMode()
{
 space = loadImage("outerSpace.jpg");
 space.resize(width, height);
 image(space, 0, 0);

 textSize(textSize);
 textAlign(CENTER);
 text("Play", width / 2, height / 2);
 textSize(textSize / 4);
 textAlign(LEFT);
 text("Instructions:", 0, 20);
 text("Click on Aliens to shoot & destroy them before they reach the Earth, you have 5 lives.", 0, 40);
 text("Good Luck!", 0, 60);
 fill(255);
 
 for(int i = 0; i<moog.length; i++)    // to stop aliens whilst in splashScreen, so if game paused; aliens don't carry on moving
     moog[i].velocity = 0;
     
 if ((mousePressed == true) && (currentGameMode == gameMode.start) && (mouseX > width / 2 - textSize && mouseX < width / 2 + textSize) && (mouseY > height / 2 - textSize / 2 && mouseY < height / 2 + textSize / 2))
 {
  currentGameMode = gameMode.play;     //sets gameMode to play when Play button clicked
 }
}

void play()
{
 space = loadImage("outerSpace.jpg");
 space.resize(width, height);
 image(space, 0, 0);
  
 e.display();
 p.display();

 for (int i = 0; i < moog.length; i++)
 {
  moog[i].velocity = int(random(6) + 1);    //aliens get random velocity when in play
  moog[i].run();
  if ((moog[i].x > e.x && moog[i].x < e.x + e.earthSize) && (moog[i].y > e.y && moog[i].y < e.y + e.earthSize))
  {
   moog[i].x = width + moog[i].enemySize;
   moog[i].y = height + moog[i].enemySize;
   deathCount++;    // deathCounts adds one when an alien reaaches Earth
   if (deathCount >= gameOverCount)
    currentGameMode = gameMode.gameOver;  //gameOver when all lives lost
  }
 }

 textSize(textSize / 2);
 textAlign(LEFT);
 text("Lives: " + (gameOverCount - deathCount), 0, height - textSize / 1.3);  //current lives = initial lives - no of times aliens reached earth
 text("Score: " + score, 0, height - textSize / 4);  //score kept by clicking and killing aliens in Alien class
 fill(255);

 home = loadImage("home.png");  //home button icon to get to splash screen and pause game
 home.resize(60, 60);
 image(home, 40, 40);

 if ((mousePressed == true) && (mouseX > 60 && mouseX < 100) && (mouseY > 60 && mouseY < 100))
 {
  currentGameMode = gameMode.start;
  mousePressed = false;
 }
  if(mousePressed == true)
   {
    p.explosion();      // when mouse is clicked, rocket fires a shot (explosion)
    mousePressed = false;
   }
}


void gameOver()
{
 space = loadImage("outerSpace.jpg");
 space.resize(width, height);
 image(space, 0, 0);

 textSize(textSize);
 textAlign(CENTER);
 text("Game Over", width / 2, height / 2);
 textSize(textSize / 3);
 textAlign(CENTER);
 text("Exit", width / 2, height / 2 + textSize);
 fill(255);

 if ((mousePressed == true) && (mouseX > width / 2 - textSize / 2 && mouseX < width / 2 + textSize / 2) && (mouseY > height / 2 + textSize / 2 && mouseY < height / 2 + textSize * 1.5))
  exit();
}
