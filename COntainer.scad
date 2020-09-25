// the objective of this print is to make an enclosure for my 19 titles that i will make each hexagon 5mm tall and have a costom lid on it the total hight will be
//and the amount of space before the start of titles is 5mm


// faces/function
$fn = 6;
//The tablets/slabs that will have the bible stuff on them
SR = 79.9;
SH = 150;
//base radious
BRRR = 88.9;
//Base hight
BHHH = 114.3;
//Cut out for the lid to fit on
LCR = 84;
LCH = 5;
//the inner lid for the container
LR = 84;
LH = 6;
// outter lid
LOR = 88.9;
LOH = 8;
// outter lid ring
LRR = 86.9;
LRH = 3;
//Text alignment, sizing, and font.

font = "Stencil";
//c= [[30],[20],[10]];
//text = ["Here lies","thy 19","tablets"];



//The base for the container
difference()
{
  translate([0,0,0])
  cylinder(h=BHHH,r=BRRR, center=false);

  translate([0,0,5])
  cylinder(h=SH, r=SR, center=false);

  translate([0,0,109.3])
  cylinder(h=LCH,r=LCR,center= false);
}

// lid system
translate([0,0,50])
union()
{

  //lowwer lid that connects to the container
  translate([0,0,120.3])
  cylinder(r=LR, h=LH, center=false);

  // the top lid with the ring cutout for the text
  difference()
  {
    translate([0,0,126.3])
    cylinder(r=LOR, h=LOH, center=false);

    translate([0,0,132.3])
    cylinder(r=LRR, h=LRH,center=false);
  }

  // the text system

  for (c= 30,40,50) {
    translate([-55,c,140.3]) {
      linear_extrude(height = 2) {
        text(text = str(text,"Here lies"," thy 19 ","tablets"), font = font, size = 15, direction = "", $fn=100, spacing = 1.11);
      }
    }
  }


}
