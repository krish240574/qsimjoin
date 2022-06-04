\l p.q
/\l kmpp.q
\l wk.q
\l utl.q
s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t}
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
	a:ap[.Q.opt .z.x]
	l:a`l; show l;	n:a`n; dt:a`dt; s:32;c:l div n; d:a`dim;
	sf:{
		sp:y*x`c;
		v:`file`dt`sp`c`d`hl`nw`id!(x`file;x`dt;sp;x`c;x`d;x`hl;x`nw;y);
		neg[t:(value v`hl)y] (wk;v); neg[t][];t"";};
	v:`file`c`d`dt`hl`nw!((a`file)0;c;d;dt;hl;nw);
	sf[v;]each til nw;
	/ **
	shf:{
		.k.f
		}	
	.z.ts:{$[(nw*nw)=count f;[.m.p:((til nw)*(last distinct (asc f)[;0]) div nw);neg[c1](shf;.m.p);neg[c2](shf;.m.p);neg[c1][];neg[c2][];c1"";c2"";];]}}nw
	/cs:1?(l div n*n) div d+1;
	/nc:10;
	/neg[c1] (kmpp;cs 0;nc);neg[c1][];c1"";
	/neg[c2] (kmpp;cs 0;nc);neg[c2][];c2""}nw

