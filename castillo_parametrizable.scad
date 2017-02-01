

//!OpenSCAD


module torre_pared() {
  union(){
    linear_extrude( height=pared, twist=0, scale=[1, 1], center=false){
      square([torre, torre], center=true);
    }
    cube([(torre / 3), pared, (pared / 2)], center=false);
  }
}


lados = 8;
distancia_centro = 50;
pared = ((2 * 3.14159) * distancia_centro) / lados;
torre = pared / 4;
angulo_central = 360 / lados;
angulo_interior = 180 - angulo_central;

for (torre = [0 : abs(1) : lados - 1]) {
  rotate([0, 0, (torre * angulo_central)]){
    translate([0, ((pared / -2) / cos((angulo_interior / 2))), 0]){
      rotate([0, 0, (angulo_interior / 2)]){
        torre_pared();
      }
    }
  }
}