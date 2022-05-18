\l p.q
shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]}

np:.p.import`numpy;mm:np`:memmap;
a:.Q.opt .z.x
l:((mm[(a`file)0;`mode pykw "r"]`:shape)`)0
wk:{[v]
	t:{
			\l p.q;
			np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
			.p.set[`c;x`c];
      .p.set[`d;x`d];
			k:(x[`sp]+y*x[`c]*x[`s] div 8);
			f:mm[x`file;`dtype pykw x`dt;`mode pykw "r";
				`shape pykw .p.pyeval"tuple((1,c))";`offset pykw k];
			f:rs[f;.p.pyeval"tuple((-1,d+1))"]
			(`$":f",string y) set (f`)[;1+til x`d;:y+1};
	(v[`n]>)t[v] \1}
n:a`n
nw:1
c1:hopen`::5042;
ms:{
	v:`file`dt`sp`n`c`s`d!((a`file)0;`float32;x*l div n;10;l div n*n;32;a`d);
	`::5042 (wk;v)} each til nw


