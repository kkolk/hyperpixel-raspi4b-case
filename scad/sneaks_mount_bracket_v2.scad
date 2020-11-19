/************************************************************************

	prusa_mk3s_bracket.scad
    
	Raspberry Pi 4B / Hyperpixel 4.0 case
    Copyright (C) 2020 Simon Inns
    
    This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module mount()
{
    move([0,38,0]) {
        rotate([0,90,270]) {
            difference() {
                import("sneaks_mount/2020_standard.stl", convexity=3);
                move([0,10,0]) {#cuboid([15,50,50]);}
            }
        }
    }
}
module frame_hook()
{
    move([0,100,-5.8]) {
            cuboid([30,52,8], chamfer = 1.5);
    }

    // Test bit of frame
    //move([0,1 + 100,6.5 - 5]) cuboid([52 + 2,40,6]);
}

module case_bracket()
{
    move([29.5,3.5,-8.5]) {
        difference() {
            lugx = -26.1;
            union() {
                move([-15,25,0]) cuboid([30,65,8], chamfer = 1.5, edges=EDGES_ALL-EDGE_TOP_LF);

                // Mounting lugs
                move([lugx,0,3 + 1.4]) cyl(h=4, d=7.8);
                move([lugx,49,3 + 1.4]) cyl(h=4, d=7.8);
            }

            // Screw shaft holes
            move([lugx,0,3]) cyl(h=10, d=2.8);
            move([lugx,49,3]) cyl(h=10, d=2.8);

            // Screw head recess holes
            move([lugx,0,-12 + 10.5]) cyl(h=14, d=5);
            move([lugx,49,-12 + 10.5]) cyl(h=14, d=5);

            move([lugx - 2,0,-12 + 8]) cuboid([10, 5, 14]);
            move([lugx - 2,49,-12 + 8]) cuboid([10, 5, 14]);
        }
    }
}

module prusa_mk3s_bracket()
{
    // move([14.5,23,45]) rotate([-40,0,0]) frame_hook();
    case_bracket();
    mount();
}

prusa_mk3s_bracket();