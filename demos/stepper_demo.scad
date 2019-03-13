
include<MCAD / motors / stepper.scad>;

// Demo, uncomment to show:
nema_demo();

module
test_nema14()
{
    motor(Nema14, NemaLong, dualAxis = false);
    // motor();
}

module
nema_demo()
{
    for (size = [ NemaShort, NemaMedium, NemaLong ]) {
        translate([ -100, size * 100, 0 ]) motor(Nema34, size, dualAxis = true);
        translate([ 0, size * 100, 0 ]) motor(Nema23, size, dualAxis = true);
        translate([ 100, size * 100, 0 ]) motor(Nema17, size, dualAxis = true);
        translate([ 200, size * 100, 0 ]) motor(Nema14, size, dualAxis = true);
        translate([ 300, size * 100, 0 ]) motor(Nema11, size, dualAxis = true);
        translate([ 400, size * 100, 0 ]) motor(Nema08, size, dualAxis = true);
    }
}

// test_nema14();
