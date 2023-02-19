$fn=180;

//gauge();
arm();

module gauge() {
	labels = ["0","1","2","3","4","5","6","7","8","9","0","1","2","3"];
	difference() {
		union() {
			hull() {
				difference() {
					union() {
						cylinder(h=4,d=118);
					}
					union() {
						rotate(-3.6,[0,0,1]) translate([0,-80,-1]) cube([80,80,10]);
						translate([-80,-80,-1]) cube([80,160,10]);
					}
				}
				cylinder(h=4,d=10);
			}
			color("red") for (index =[0:12]) {
				angle = index * -7.2;
				rotate(41.4 + angle,[0,0,1]) translate([38.5,38.5,4]) {
					linear_extrude(1) polygon([[3,3],[0,-2.5],[-2.5,0]]);
				}
				rotate(-1.5 + angle,[0,0,1]) translate([0,46,4]) {
					linear_extrude(1) text(labels[index],size=5,font="Arial:style=bold");
				}
			}
			cylinder(h=6,d=10);
		}
		union() {
			translate([0,0,-1]) cylinder(h=2.5,d=8.5);
			translate([0,0,-4]) cylinder(h=11,d=2.5,$fn=6);
		}
	}
}

module arm() {
	difference() {
		union() {
			hull() {
				cylinder(h=4,d=18);
				translate([65,0,0]) cylinder(h=4,d=18);
				rotate(30,[0,0,1]) translate([65,0,0]) cylinder(h=4,d=18);
			}
			cylinder(h=5,d=8);
			color("red") rotate(-28.5,[0,0,1]) translate([42,42,4]) linear_extrude(5) polygon([[0,0],[5.5,11],[11,5.5]]);
		}
		union() {
			translate([0,0,-1]) cylinder(h=10,d=3);
		}
	}
}