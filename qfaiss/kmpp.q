f0:"f"$get `:f0
shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]}
sqr:{x xexp 2}
c:1?(shp f0)0
ct:f0 c
t:(shp f0)0
ed:sum each 'sqr ct-/:\:f0
where each (max ed)=ed

