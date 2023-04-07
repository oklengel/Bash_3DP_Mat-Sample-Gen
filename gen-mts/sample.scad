// (c) 2019 Pavel Suchmann <pavel@suchmann.cz>
// Licensed under the terms of "Creative Commons - Public Domain Dedication"
// Open source remix of Khan's thing: https://www.thingiverse.com/thing:318679

// overall approximate size (mm)
size = 24; // [20:40]
sizeB = 24;

// your text
Mlabel = "PETG";
Clabel = "White";
manufactuer="Amazon";
/* [Hidden] */

h = 0.6;
d = 10;
r = 3;
fs = 4;

$fn=20;

module message(txt, shift) {
    rotate([0, 0, 90])
        translate([size/2, -shift, h])
            linear_extrude(h*1.01)
                text(txt, fs, halign="center", font="Liberation Sans:style=Bold");
}

translate([-size/2, -size/2, h])
    difference() {
        union() {
            minkowski() {
                cube([size, size, h]);
                cylinder(r=r, h=h);
            }
            translate([0, 0, -h])
                minkowski() {
                    cube([size+d, size, h]);
                    cylinder(r=r, h=h);
                }
            message(manufactuer, size+d);    
        }
        union() {
            translate([r/2, r/2, -2*h])
                cylinder(r=r, h=5*h);
            message(Mlabel, sizeB*2/3);
            message(Clabel, sizeB*3/3);
        }
    }
