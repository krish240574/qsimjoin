/ worker function to split files and return samples
\t 2000
wk:{[v]
  t:{
      show x;
      .k.s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t};
      np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
      .p.set[`c;x`c]; .p.set[`d;x`d];
      .k.f:mm[x`file; `dtype pykw (x`dt)0; `mode pykw "r"; `shape pykw .p.pyeval"tuple((1,c))";`offset pykw x`sp];
      .k.f:((rs[.k.f;.p.qeval"tuple((-1,d+1))"])`)[;1+til x`d]; 
      (`$":f",string 0) 1: (.k.f);};
	.k.nw:v`nw; .k.lc:(); .k.rd:();.k.hl:();
  t[v];
  neg[.z.w] (`mcb;(.k.f:asc .k.f) (til v`nw)*(count .k.f) div v`nw)}

lcb:{.k.hl:.k.hl,x};

/ Shuffle for distributed sort - could implement Berkeley paper here
shf:{[p] 
	wcb:{show x};
	.k.p:p;
	INF:-1+2 xexp 32;
	.k.p[0]:neg[INF];	
	.k.p,:INF;
	/.k.p[-1+count .k.p]:INF;	
	.k.td:{show y;.k.rd,:x;.k.lc,:y;neg[.z.w](`wcb;100)};
	lsrt:{[p]
		show p;
		$[.k.id=0;
			asc (.k.f where .k.f[;0]<=p 1+.k.id),.k.rd;
		$[.k.id=(-1+.k.nw);
			asc (.k.f where .k.f[;0]>=p .k.id),.k.rd;
				[asc (.k.f where (.k.f[;0]>=p .k.id)&(.k.f[;0]<=p 1+.k.id)),.k.rd]]];
		};
	.k.l:{.k.f where .k.f[;0] within (.k.p[x];.k.p[x+1])}peach til -1+count .k.p;
	show "here";
	lc:hopen`::6666;
	.k.hl:lc (`lk;wn:where not .k.id=til .k.nw);
	show .k.hl;
	{i:(.k.hl y). 0 0;p:(.k.hl y). 0 1;t:hopen(raze ":",(string i),":",p);neg[t](.k.td;(x y);1);neg[t][];t""}[.k.l;]peach wn};
/	.z.ts:{$[(-1+.k.nw)=count .k.lc;[lsrt[.k.p];.z.ts:()];]};}





















