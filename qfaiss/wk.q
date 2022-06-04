/ worker function to split files and return samples
\t 2000
wk:{[v]
  t:{
      show x;
      s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t};
      np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
      .p.set[`c;x`c]; .p.set[`d;x`d];
      .k.f:mm[x`file; `dtype pykw (x`dt)0; `mode pykw "r"; `shape pykw .p.pyeval"tuple((1,c))";`offset pykw x`sp];
      .k.f:((rs[.k.f;.p.qeval"tuple((-1,d+1))"])`)[;1+til x`d]; 
      (`$":f",string 0) 1: (.k.f);};
	.k.nw:v`nw; .k.id:v`id; .k.lc:(); .k.rd:();
	c1:hopen`::5042;
	c2:hopen`::5043;
	c3:hopen`::5044;
	c4:hopen`::5045;
  .k.hl:`c1`c2`c3`c4!(c1;c2;c3;c4);
  t[v];
  neg[.z.w] (`mcb;(.k.f:asc .k.f) (til v`nw)*(count .k.f) div v`nw)}
wcb:{show "wcb!!";.k.lc,:x}
/ Shuffle for distributed sort - could implement Berkeley paper here
shf:{[p] 
	.k.p:p;
	INF:-1+2 xexp 32;
	.k.p[0]:neg[INF];	
	.k.p[-1+count .k.p]:INF;	
	.k.td:{show y;.k.rd,:x;.k.lc,:y};
	lsrt:{[p]
		show p;
		$[.k.id=0;
			asc (.k.f where .k.f[;0]<=p 1+.k.id),.k.rd;
		$[.k.id=(-1+.k.nw);
			asc (.k.f where .k.f[;0]>=p .k.id),.k.rd;
				[asc (.k.f where (.k.f[;0]>=p .k.id)&(.k.f[;0]<=p 1+.k.id)),.k.rd]]];
		};
	.k.l:{.k.f where .k.f[;0] within (.k.p[x];.k.p[x+1])}peach til -1+count .k.p;
	{tad:{show y;.k.rd:.k.rd,x;.k.lc:.k.lc,y;neg[.z.w](`wcb;1);};neg[t:(value .k.hl)y](tad;((x y);1));neg[t][];t"";}[.k.l;]each where not .k.id=(til .k.nw);}
/	.z.ts:{$[(-1+.k.nw)=count .k.lc;[lsrt[.k.p];.z.ts:()];]};}
