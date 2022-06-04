\l p.q
/\l kmpp.q
\l wk.q
np:.p.import`numpy
mm:np`:memmap
s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t}
a:.Q.opt .z.x
l:((mm[(a`file)0;`mode pykw "r"]`:shape)`)0
n:s2i a`nc
dt:a`dt
nw:4
c1:hopen`::5042
c2:hopen`::5043
c3:hopen`::5044
c4:hopen`::5045
hl:`c1`c2`c3`c4!(c1;c2;c3;c4)
f:()
mcb:{f::f,x} 
\t 2000
ms:{
	s:32;c:l div n*n; d:s2i a`dim;
	sf:{
		sp:y*x`c;
		v:`file`dt`sp`c`d`hl`nw!(x`file;x`dt;sp;x`c;x`d;x`hl;x`nw);
		neg[t:(value v`hl)y] (wk;v); neg[t][];t"";};
	v:`file`c`d`dt`hl`nw!((a`file)0;c;d;dt;hl;nw);
	sf[v;]each til nw;
	/ **
	.z.ts:{$[400=count f;[.m.p::(0;(last distinct (asc f)[;0]) div 2);neg[c1](shf;.m.p);neg[c2](shf;.m.p);neg[c1][];neg[c2][];c1"";c2"";];]}}nw
	/cs:1?(l div n*n) div d+1;
	/nc:10;
	/neg[c1] (kmpp;cs 0;nc);neg[c1][];c1"";
	/neg[c2] (kmpp;cs 0;nc);neg[c2][];c2""}nw

