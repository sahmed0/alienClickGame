class earth
{

 PImage earth;
 int earthSize = 120;
 int x;
 int y;

 earth()
 {
  earth = loadImage("earth.png");
  earth.resize(earthSize, earthSize);
 }

 // method to display earth
 void display()
 {
  x = (width / 2 - earthSize / 2);
  y = (height / 2 - earthSize / 2);
  image(earth, x, y);
 }
}
