\l p.q
\l wk.q
\l utl.q
f:() 
mcb:{f::f,x}
\t 2000
a:ap[.Q.opt .z.x];
{[i;p]lc:hopen raze over ":",i,":",p; .k.hl:lc(`ghl;0);.k.nw:count .k.hl; show .k.hl;.k.cl:hopen each .k.hl}[a`li;a`lp];
ms:{
 l:a`l; n:a`n; dt:a`dt; s:32;c:l div n; d:a`dim;
 show l;
 sf:{sp:y*x`c; v:`file`dt`sp`c`d`nw!(x`file;x`dt;sp;x`c;x`d;x`nw);t:hopen .k.hl y; neg[t] (wk;v); neg[t][];t"";};
 v:`file`c`d`dt`nw!((a`file)0;c;d;dt;.k.nw); sf[v;]each til .k.nw;
 /.z.ts:{$[(.k.nw*.k.nw)=count f;[show "Calling shf";.m.p:((til .k.nw)*(last distinct (asc f)[;0]) div .k.nw);{neg[x](shf;.m.p);neg[x][];x"";}each .k.cl;];]}
 /ic:(1?l div 4*4*d+1)0;
 ic:(1?l div 4*4*4*d+1)0;
 .k.lkh:hopen raze over ":",(a`li),":",a`lp;
 ih:.k.lkh (`lku;ic div c);
 .k.cc:(hopen ih) (`.k.gc;ic mod c);
 nct:a`nct;
 do[nct-1;.k.lp:{x (`.k.ff;.k.cc)}each .k.cl;t:.k.lp[(where (m:max .k.lp[;1])=.k.lp[;1])0;2];
 $[1=count .k.cc 0;.k.cc:flip .k.cc,'flip t;.k.cc:.k.cc,(1,128)#t]];
 /show .k.cc;
 .k.kmt:{x (`.k.km;.k.cc)}peach .k.cl;}.k.nw 

{(sum each .k.kmt[x;0;1+til 128])%sum .k.kmt[x;0;0]}each til .k.nw

