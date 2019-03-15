use <scad-utils/linalg.scad>
use <scad-utils/transformations.scad>
use <scad-utils/lists.scad>

function rotation_from_axis(x,y,z) = [[x[0],y[0],z[0]],[x[1],y[1],z[1]],[x[2],y[2],z[2]]]; 

function rotate_from_to(a,b,_axis=[]) = 
        len(_axis) == 0 
        ? rotate_from_to(a,b,unit(cross(a,b))) 
        : _axis*_axis >= 0.99 ? rotation_from_axis(unit(b),_axis,cross(_axis,unit(b))) * 
    transpose_3(rotation_from_axis(unit(a),_axis,cross(_axis,unit(a)))) : identity3(); 

function make_orthogonal(u,v) = unit(u - unit(v) * (unit(v) * u)); 

// Prevent creeping nonorthogonality 
function coerce(m) = [unit(m[0]), make_orthogonal(m[1],m[0]), make_orthogonal(make_orthogonal(m[2],m[0]),m[1])]; 

function tangent_path(path, i) =
i == 0 ?
  unit(path[1] - path[0]) :
  (i == len(path)-1 ?
      unit(path[i] - path[i-1]) :
    unit(path[i+1]-path[i-1]));

function construct_rt(r,t) = [concat(r[0],t[0]),concat(r[1],t[1]),concat(r[2],t[2]),[0,0,0,1]]; 

function construct_transform_path(path) =
  [let (l=len(path))
      for (i=[0:l-1])
        construct_rt(rotate_from_to([0,0,1], tangent_path(path, i)), path[i])];

module sweep(shape, path_transforms, closed=false) {

    pathlen = len(path_transforms);
    segments = pathlen + (closed ? 0 : -1);
    shape3d = to_3d(shape);

    function sweep_points() =
      flatten([for (i=[0:pathlen-1]) transform(path_transforms[i], shape3d)]);

    function loop_faces() = [let (facets=len(shape3d))
        for(s=[0:segments-1], i=[0:facets-1])
          [(s%pathlen) * facets + i, 
           (s%pathlen) * facets + (i + 1) % facets, 
           ((s + 1) % pathlen) * facets + (i + 1) % facets, 
           ((s + 1) % pathlen) * facets + i]];

    bottom_cap = closed ? [] : [[for (i=[len(shape3d)-1:-1:0]) i]];
    top_cap = closed ? [] : [[for (i=[0:len(shape3d)-1]) i+len(shape3d)*(pathlen-1)]];
    polyhedron(points = sweep_points(), faces = concat(loop_faces(), bottom_cap, top_cap), convexity=5);
}
