\l SplitFile.p
np:.p.import`numpy;mm:np`:memmap;
a:.Q.opt .z.x
l:((mm[(a`file)0;`mode pykw "r"]`:shape)`)0
sf:.p.get[`sf;>];
k:.p.wrap sf[`sift_base.fvecs;32;128;10;"float32";sp;l]
{(`$":f",string x) set k[@;x]`}each til 10


n:10
c1:hopen`::5042;
ms:{v:`file`dt`sp`n`c`s!((a`file)0;`float32;x*l div n;10;l div n*n;32);
wk:{[v] t:{.p.set[`c;x`c];k:(x[`sp]+y*x[`c]*x[`s] div 8);f:mm[x`file;`dtype pykw x`dt;`mode pykw "r";`shape pykw .p.pyeval"tuple((1,c))";`offset pykw k];(`$":f",string y) set f`;:y+1};{[v](v[`n]>)t[v] \1}[v] }
}each til nw
