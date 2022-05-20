f0:"f"$get `:f0
shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]}
sqr:{x xexp 2}
c:1?(shp f0)0;cc:count c;
ct:f0 c
t:(shp f0)0
ed:$[1=cc;raze]sum each 'sqr ct-/:\:f0
/ ed:ed@'where each not 0=ed
c:c,where (max ed)=ed 
$[1=cc;[ed:ed where not 0=raze ed;c:c,where (max ed)=ed];[ed:ed@'where each not 0=ed;c:c,nc where (max p)=p:d%sum d:ed@/:'raze nc:where each (min each ed)=ed]]
/ where (max p)=p:s%sum s:ed c

