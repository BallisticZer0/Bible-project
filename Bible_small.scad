/*
The objective of this print is to make an enclosure for my 19 titles that i will make each hexagon 7mm tall with a 2mm ring + text. and have a costom lid on it the total hight will be
The amount of space before the start of titles is 5mm

https://github.com/BallisticZer0/Bible-project Copy write © 2020 Aaron Gadeken

*/

// faces/function
$fn = 6;
//The main cut out for the container to fit the tablets/slabs. (also a bit bigger that the slabs should be.)
CUR = 79.9; // need to edit var name to somehting that fits it better
CUH = 150;
// Container base radious and hight
BRRR = 88.9;
BHHH = 105;
//Cut out for the lid to fit on
Container_Lid_Cut_Out_Radius_LCR = 84;
Container_Lid_Cut_Out_Hight_LCH = 5;
//the inner (smaller) lid for the container, the one that sits in the container's cut out near the top
Inner_Container_Lid_Radius_ICLR = 83.9;
Inner_Container_Lid_Hight_ICLH = 5;
// Main (bigger) lid, the one that sits on top of the container
LOR = 88.9;
LOH = 8;
// The cut into the top of the lid in order that it gives enough room for the text to fit in and still be visable
Lid_Divit_For_Text_Radius_LDFTR = 86.9;
Lid_Divit_For_Text_Hight_LDFTH = 3;
// Tiles that have pics
Picture_Tile_Radius_PTR = 78;
Picture_Tile_Hight_PTH = 7;
// raised outline for tiles
TRR = 76;
TRH = 3;
//Text alignment, sizing, and font are after the base and lid, with acutally text for easy changing.



//The base for the container with the low poly decal on the outside
union()
    {
    difference()
      {
          //low poly oustide
        linear_extrude(height = BHHH, center = false, convexity = 100, twist = 115, $fn= 0)
        translate([0,0,0])
        circle(r=BRRR+10, center=false, $fn=10);

        //cut out for tiles (main)
        translate([0,0,5])
        cylinder(h=CUH, r=CUR, center=false);

        //cut out for lid (on top smaller)
        translate([0,0,109.3-9.3])
        cylinder(h=Container_Lid_Cut_Out_Hight_LCH, r=Container_Lid_Cut_Out_Radius_LCR, center = false);
      }
    }

// lid with the text/title
translate([0,0,150])

union()
{

  //lowwer lid that connects to the container
    translate([0,0,109.3-9.3])
    cylinder(r=Inner_Container_Lid_Radius_ICLR, h=Inner_Container_Lid_Hight_ICLH, center=false);


  // the top lid with the ring cutout for the text
    difference()
      {
        // make sure that the z axis is set to 114.3 before print or lid will not fit!!!
          translate([0,0,114.3-9.3])
          rotate([0,0,-7])
        linear_extrude(height = 20, center = false, convexity = 500, twist = 19.3, $fn= 1)
        circle(r=LOR+10, center=false,$fn=10);
        //translate([0,0,114.3])
        //cylinder(r=LOR, h= LOH, center=false,$fn=6);

            /*
                      translate([0,0,132.3])
                      rotate([0,0,-7])
                      linear_extrude(height = Lid_Divit_For_Text_Hight_LDFTH , center = false, convexity = 500, twist = 19.3, $fn= 1)     circle(r=Lid_Divit_For_Text_Radius_LDFTR-2,center=false, $fn=10);

            */

        //Divit for the ring and text to fit in
        translate([0,0,132.3-9.3])
        rotate([0,0,10])
        cylinder(r=Lid_Divit_For_Text_Radius_LDFTR+6, h=Lid_Divit_For_Text_Hight_LDFTH ,center=false,$fn=10);
      }



// the text system new, more efficint with the for loop acting as the repeat for text.

    // front for the whole text system unless scripted otherwise
     font = "Playbill:style=Regular";
    // spacing between the letters
      spacing = 1.12;
    // size for all text
      size = 27;
    //halign is the horizontal alightment for any text
     halign = "center";
    // valign is the vertical alignment for any text
     valign = "center";
    // undefined pre text for the 3 lines
     text="";
    // the text put into a dictionary for storage
     move = [
              [32, "HERE HOLDS"],
              [0, "THY 13"],
//              [-32, "SUMMERIES"],
//              [-32, "PICTURES"]
              [-32,"DEPICTIONS"]
            ];



    for (a = move) {
      translate([0, a[0], 132.3-9.3]) {
        linear_extrude(height = 2) {
          text(text = str(text,"",a[1]), font = font, spacing = spacing, size = size, halign = halign, valign = valign, $fn=100);
        }
      }
    }
}





// tile system, first in selection is the physical hexagon hing
translate([0,300,0])
union()
{
    difference()
    {
        translate([0,0,0])
        cylinder(r=Picture_Tile_Radius_PTR, h=Picture_Tile_Hight_PTH,center=false);

        translate([0,0,5])
        cylinder(r=TRR, h=TRH, center=false);
    }

/*
// the text system for tiles.(what goes on it)

    // front for the whole text system unless scripted otherwise
     font = "Playbill:style=Regular";
    // spacing between the letters
      spacing = 1;
    // size for all text
      size = 10;
    //halign is the horizontal alightment for any text
     halign = "center";
    // valign is the vertical alignment for any text
     valign = "baseline";
    // undefined pre text for the 3 lines
     text="";
    // the text put into a dictionary for storage
     move = [
              [55, "The second sentance is"],
              [45, "the fist sentance is true too"],
              [35, "the summery is not real to me"],
              [25, "but at the same time it is to me"],
              [15, "this one needs to be even smaller no"],
              [5, "So he shal be gone and fomboyant ehh?"],
              [-5, "I here by announce the renounce of ryder"],
              [-15, "So he shal be gone and fomboyant ehh?"],
              [-25, "The summery is by far the best yes"],
              [-35, "verry much indeed i will do today"],
              [-45, "the banks are rude, to rude"],
              [-55, "poetic justice is not real."],
              [-65, "i will do today nothing"],
            ];



    for (a = move) {
      translate([0, a[0], 5]) {
        linear_extrude(height = 2) {
          text(text = str(text,"",a[1]), font = font, spacing = spacing, size = size, halign = halign, valign = valign, $fn=100);
        }
      }
    }
    */
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
