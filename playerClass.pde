class Player
{
 PImage player, explosion;
 int playerSize = 100;
 int x, y;

 Player()
 {
  player = loadImage("rocket.png");
  player.resize(playerSize, playerSize);
 }

 // display & move player  
 void display()
 {
  x = mouseX - playerSize / 2;    // rocket is character that follows mouse movements
  y = mouseY;
  image(player, x, y);
 }
 
 void explosion()
 {
  explosion = loadImage("explode.png");    // explosion from rocket when mouse pressed
  explosion.resize(p.playerSize, p.playerSize);
  image(explosion, mouseX-p.playerSize / 2, mouseY-p.playerSize / 1.5);
 }
}
