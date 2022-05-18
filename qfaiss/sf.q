/// \l SplitFile.p
\l p.q
np:.p.import`numpy;mm:np`:memmap;
a:.Q.opt .z.x
l:((mm[(a`file)0;`mode pykw "r"]`:shape)`)0
wk:{[v]
	t:{
			np:.p.import`numpy;mm:np`:memmap;
			.p.set[`c;x`c];
			k:(x[`sp]+y*x[`c]*x[`s] div 8);
			f:mm[x`file;`dtype pykw x`dt;`mode pykw "r";
				`shape pykw .p.pyeval"tuple((1,c))";`offset pykw k];
			(`$":f",string y) set f`;:y+1};
	(v[`n]>)t[v] \1}
n:10
nw:1
c1:hopen`::5042;
ms:{
	show x*l div n;
	v:`file`dt`sp`n`c`s!((a`file)0;`float32;x*l div n;10;l div n*n;32);
	`::5042 (wk;v)} nw
