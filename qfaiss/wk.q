/ worker function to split files and return samples
wk:{[v]
  t:{
      show x;
      .k.s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t};
      np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
      .p.set[`c;x`c]; .p.set[`d;x`d];
			show x`sp;
      .k.f:mm[x`file; `dtype pykw (x`dt)0; `mode pykw "r"; `shape pykw .p.pyeval"tuple((1,c))";`offset pykw x`sp];
      .k.f:((rs[.k.f;.p.qeval"tuple((-1,d+1))"])`)[;1+til x`d];
      (`$":f",string 0) 1: (.k.f);};
  .k.nw:v`nw; .k.lc:(); .k.rd:();.k.hl:();.k.gc:{.k.cc:.k.f x;:.k.cc};
	.k.edf:{sum each (y-/:x) xexp 2};
	.k.ff:{.k.f[where (max k)=k:.k.edf[.k.f;x]]};
  t[v];
  neg[.z.w] (`mcb;(.k.f:asc .k.f) (til v`nw)*(count .k.f) div v`nw)}

lcb:{.k.hl:.k.hl,x};

/ Shuffle for distributed sort - could implement Berkeley paper here
shf:{[p]
  .k.p:p; INF:-1+2 xexp 32; .k.p[0]:neg[INF]; .k.p,:INF;
  .k.td:{.k.rd,:x;.k.lc,:y;};
  lsrt:{show "lsrt"; .k.fd:asc .k.rd,.k.f where .k.f[;0] within (.k.p[.k.id];.k.p[.k.id+1]);};
  .k.l:({.k.f where .k.f[;0] within (.k.p[x];.k.p[x+1])}peach til -1+count .k.p)[wn:where not .k.id=til .k.nw];
  .k.hl:(hopen .k.lkh) (`lk;wn);
  {t:hopen .k.hl x; t (.k.td;(.k.l x);1);}peach til count wn; 
		lsrt[];}
