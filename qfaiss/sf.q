\l p.q
/\l kmpp.q
\l wk.q
np:.p.import`numpy
mm:np`:memmap
s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t}
a:.Q.opt .z.x;
l:((mm[(a`file)0;`mode pykw "r"]`:shape)`)0;
n:s2i a`nc;
nw:0;
c1:hopen`::5042;
c2:hopen`::5043;
hl:`c1`c2;(5042;5043);
f:();
mcb:{f::f,x} 
\t 2000
ms:{
	s:32;c:l div n*n; sp:x*c; d:s2i a`dim;
	v:`file`dt`sp`c`d`hl!((a`file)0;`float32;sp;c;d;hl);
	neg[c1] (wk;v); neg[c1][];c1"";
	sp:(x+1)*c;
	v:`file`dt`sp`c`d`hl!((a`file)0;`float32;sp;c;d;hl);
	neg[c2] (wk;v);neg[c2][];c2"";
	.z.ts:{$[400=count f;[.m.p::(0;(distinct (asc f)[;0]) div 2);neg[c1](shf;ph);neg[c2](shf;ph);neg[c1][];neg[c2][];c1"";c2"";];]}}nw
	/cs:1?(l div n*n) div d+1;
	/nc:10;
	/neg[c1] (kmpp;cs 0;nc);neg[c1][];c1"";
	/neg[c2] (kmpp;cs 0;nc);neg[c2][];c2""}nw

