//Tamanyo arista
D=30;
//iteraciones
n=3;

echo(version=version());

module menger(){
    difference(){
        cube(D, center=true);
        for (v=[[0,0,0],[0,0,90],[0,90,0]])
       // for (v=[[0,0,0],[0,0,90]])
            rotate(v) menger_n(side=D, maxside=D, level=n);
    }
}
module menger_n(side=1, maxside=1, level=1){
    l=side/3;
    cube([maxside*1.1, l, l], center=true);
    if (level > 1){
        for (i=[-1:1], j=[-1:1])
            if(i||j)
                translate([0, i*l, j*l])
                    menger_n(side=l, maxside=maxside, level=level-1);
        }
    }

difference(){
    //rotate([45, atan(1/sqrt(2)), 0])  menger();
    //translate([0,0,-D]) cube(2*D, center=true);
    menger();
    
}