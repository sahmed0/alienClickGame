class alien
{
 int x;
 int y;
 int counter, splatCounter;
 PImage img1, img2, img3, img4, splat;
 int enemySize = 50;
 int velocity;

 alien()
 {
  this.x = int(random(width) + e.earthSize);
  this.y = int(random(height) + e.earthSize);

  img1 = loadImage("alien1.png");
  img1.resize(enemySize, enemySize);
  img2 = loadImage("alien2.png");
  img2.resize(enemySize, enemySize);
  img3 = loadImage("alien3.png");
  img3.resize(enemySize, enemySize);
  img4 = loadImage("alien4.png");
  img4.resize(enemySize, enemySize);
 }

 //method to animate, move and remove the alien
 void run()
 {
  move();
  animate();
  mouseClicked();
 }

 // method to move the alien to Earth at centre (target)
 void move()
 {
  int eX = e.x + e.earthSize / 4;
  int eY = e.y + e.earthSize / 4;
  int dX = eX - x;
  int dY = eY - y;

  // use pythagoras's theorem to find distance to Earth from any position and the amount needed to move towards it (vX and vY)
  double hypoteneuse = Math.sqrt((dX * dX) + (dY * dY));
  double vX = Math.round(dX / (hypoteneuse / velocity));
  double vY = Math.round(dY / (hypoteneuse / velocity));

  // adds on vX and vY to x & y of alien to move it towards Earth
  x += vX;
  y += vY;
 }

 //animate aliens to rotate whilst moveing towards target
 void animate()
 {
  if (counter >= 0 && counter < 3)
   image(img1, x, y);

  else if (counter >= 3 && counter < 6)
   image(img2, x, y);

  else if (counter >= 6 && counter < 9)
   image(img3, x, y);

  else if (counter >= 9 && counter < 12)
   image(img4, x, y);

  else counter = 0; //reset counter back to 1st image

  counter++;
 }

 //method to cause explosion, alien to splat, score to be increased and for alien to be moved elsewhere
 void mouseClicked()
 {
  if ((mousePressed == true) && (mouseX >= x && mouseX <= x + enemySize) && (mouseY >= y && mouseY <= y + enemySize))
  {
   splat();
   p.explosion();
   score++;
   x = int(random(width) + e.earthSize);
   y = int(random(height) + e.earthSize);
   mousePressed = false;
  }
 }

 void splat()    // alien gets splatted when clicked (hit with rocket explosion)
 {
  splat = loadImage("splat.png");
  splat.resize(enemySize * 2, enemySize * 2);
  image(splat, x, y);
 }
}
