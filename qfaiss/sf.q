\l p.q
/\l kmpp.q
\l wk.q
\l utl.q
f:()
mcb:{f::f,x}
\t 2000
a:ap[.Q.opt .z.x];
ghl:{[i;p]lc:hopen raze over ":",i,":",p; .k.hl:lc(`ghl;0);.k.nw:count .k.hl; show .k.hl;.k.cl:hopen each .k.hl}[a`li;a`lp];
ms:{
  l:a`l; n:a`n; dt:a`dt; s:32;c:l div n; d:a`dim;
	show l;
  sf:{sp:y*x`c; v:`file`dt`sp`c`d`nw!(x`file;x`dt;sp;x`c;x`d;x`nw);t:hopen .k.hl y; neg[t] (wk;v); neg[t][];t"";};
  v:`file`c`d`dt`nw!((a`file)0;c;d;dt;.k.nw); sf[v;]each til .k.nw;
  .z.ts:{$[(.k.nw*.k.nw)=count f;[show "Calling shf";.m.p:((til .k.nw)*(last distinct (asc f)[;0]) div .k.nw);{neg[x](shf;.m.p);neg[x][];x"";}each .k.cl;exit 0];]}}.k.nw
  /cs:1?(l div n*n) div d+1;
  /nc:10;
  /neg[c1] (kmpp;cs 0;nc);neg[c1][];c1"";
  /neg[c2] (kmpp;cs 0;nc);neg[c2][];c2""}nw
	/TMP:n*c;
	ic:1?l;
	hn:(where q[-1+first where ic<q]=q:c*til n)0;
	m:ic mod c;
	(hopen .k.lkh)(`lku;m);

