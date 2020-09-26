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
//Text alignment, sizing, and font are after the base and lid, with acutally text for easy changing.



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



// lid system with text
translate([0,0,150])

union()
{

  //lowwer lid that connects to the container
    translate([0,0,109.3])
    cylinder(r=LR, h=LH, center=false);


  // the top lid with the ring cutout for the text
    difference()
      {
        // make sure that the z axis is set to 114.3 before print or lid will not fit!!!
        translate([0,0,114.3])
        cylinder(r=LOR, h=LOH, center=false);

        translate([0,0,120.3])
        cylinder(r=LRR, h=LRH,center=false);
      }



// the text system new, more efficint with the for loop acting as the repeat for text.

    // front for the whole text system unless scripted otherwise
     font = "Playbill:style=Regular";
    // spacing between the letters
      spacing = 1.12;
    // size for all text
      size = 23;
    //halign is the horizontal alightment for any text
     halign = "center";
    // valign is the vertical alignment for any text
     valign = "center";
    // undefined pre text for the 3 lines
     text="";
    // the text put into a dictionary for storage
     move = [
              [32, "HERE HOLDS"],
              [0, "THY 19"],
              [-32, "TABLETS"]
            ];



    for (a = move) {
      translate([0, a[0], 120.3]) {
        linear_extrude(height = 2) {
          text(text = str(text,"",a[1]), font = font, spacing = spacing, size = size, halign = halign, valign = valign, $fn=100);
        }
      }
    }
}



// Old system less efficent and less productive twords chaning things.
//  translate([0,30,140.3])
//  linear_extrude(height = 2)
//  text("Thy 19", font = font, size = 15, direction = "", $fn=100, spacing = 1.11, halign = "center", valign = "center");
//  translate([0,0,140.3])
//  linear_extrude(height = 2)
//  text("tablets", font = font, size = 15, direction = "", $fn=100, spacing = 1.11, halign = "center",valign = "center");
//  translate([0,-30,140.3])
//  linear_extrude(height = 2)
//  text("are here", font = font, size = 15, direction = "", $fn=100, spacing = 1.11, halign = "center",valign = "center");
