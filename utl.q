/ Some useful functions
/ Shape of a multidimensional array
r:{[arr]$[count[arr]<>1;[s::s,count[arr];r[(arr 0)]];:s]};
shp:{[a]s::();r[a]}
/ this will print each dimension on one line
f:{[cc]$[1<>count cc;[0N!count cc ;f cc 0];]}
/ works even for dim = 1, e.g (1,1,1,3,4,5)#1000?1000
r:{[a]$[0>type a;:();:(count a),r a 0]}

