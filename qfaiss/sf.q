\l p.q
\l kmpp.q
shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]};
s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t}

np:.p.import`numpy;mm:np`:memmap;
a:.Q.opt .z.x;
l:((mm[(a`file)0;`mode pykw "r"]`:shape)`)0;
wk:{[v]
  t:{
			show x;
      shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]};
      s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t};
      np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
      .p.set[`c;x`c];
      .p.set[`d;x`d];
      f:mm[x`file; `dtype pykw x`dt; `mode pykw "r"; `shape pykw .p.pyeval"tuple((1,c))";`offset pykw x`sp];
      f:rs[f;.p.qeval"tuple((-1,d+1))"];
      (`$":f",string y-1) set (f`)[;1+til x`d];};
	t[v;1];
	neg[.z.w] (`mcb;"Done")}
n:s2i a`nc;
nw:0;
c1:hopen`::5042;
c2:hopen`::5043;
mcb:{show x} 
ms:{
	s:32;c:l div n;
	sp:x*c;
	d:s2i a`dim;
	v:`file`dt`sp`c`d!((a`file)0;`float32;sp;c;d);
	neg[c1] (wk;v); neg[c1][];c1"";
	sp:(x+1)*c;
	v:`file`dt`sp`c`d!((a`file)0;`float32;sp;c;d);
	neg[c2] (wk;v);neg[c2][];c2"";
	cs:1?(l%n)%d+1;
	nc:4;
	`::5042 (kmpp;cs;4)}nw

