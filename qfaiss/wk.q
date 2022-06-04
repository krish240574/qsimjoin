/ worker function to split files and return samples
wk:{[v]
  t:{
      show x;
      s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t};
      np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
      .p.set[`c;x`c]; .p.set[`d;x`d];
      .k.f:mm[x`file; `dtype pykw (x`dt)0; `mode pykw "r"; `shape pykw .p.pyeval"tuple((1,c))";`offset pykw x`sp];
      .k.f:((rs[.k.f;.p.qeval"tuple((-1,d+1))"])`)[;1+til x`d]; 
      (`$":f",string 0) 1: (.k.f);};
	.k.hl:v`hl; .k.nw:v`nw; .k.id:v`id; .k.lc:();
  t[v];
  neg[.z.w] (`mcb;(.k.f:asc .k.f) (til v`nw)*(count .k.f) div v`nw)}

/ Shuffle for distributed sort - could implement Berkeley paper here
shf:{[p] 
	td:{.k.rd:x;k.lc,:y};
	lsrt:{[p]
		$[.k.id=0;
			asc (.k.f where .k.f[;0]<=p 1+.k.id),.k.rd;
		$[.k.id=(-1+.k.nw);
			asc (.k.f where .k.f[;0]>=p .k.id),.k.rd;
				[asc (.k.f where (.k.f[;0]>=p .k.id)&(.k.f[;0]<=p 1+.k.id)),.k.rd]]];
		}
	{	
		l:.k.f where .k.f[;0]<p x;
		neg[t:(value .k.hl) x] (td;(l;count l));neg[t][];t"";}peach 1+til -1+count p;
		.z.ts:{$[(-1+.k.nw)=count .k.lc;[lsrt[];.z.ts:()];];};}
