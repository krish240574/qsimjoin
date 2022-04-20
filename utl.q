/ Some useful functions
/ Shape of a multidimensional array
r:{[arr]$[count[arr]<>1;[s::s,count[arr];r[(arr 0)]];:s]};
shp:{[a]s::();r[a]}
/ this will print each dimension on one line
f:{[cc]$[1<>count cc;[0N!count cc ;f cc 0];]}
