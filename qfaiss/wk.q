/ worker function to split files and return samples
wk:{[v]
  t:{
		show x;
		.k.s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t};
		np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
		.p.set[`c;(x`c) div 4]; .p.set[`d;x`d];
		.k.f:mm[x`file; `dtype pykw (x`dt)0; `mode pykw "r"; `shape pykw .p.pyeval"tuple((1,c))";`offset pykw x`sp ];
		.k.f:((rs[.k.f;.p.qeval"tuple((-1,d+1))"])`)[;1+til x`d];
		(`$":f",string 0) 1: (.k.f);};

	.k.nw:v`nw; .k.lc:(); .k.rd:();.k.hl:();.k.gc:{.k.cc:.k.f x;:.k.cc};.k.ed:();.k.d:v`d;

	.k.edf:{$[1=count y 0;[$[1=count x 0;sum (y-x) xexp 2;];sum each (y-/:x) xexp 2];sum each 'v*v:y-\:/:x]};

	.k.ff:{
		show x;
		$[0=count .k.ed;.k.ed:.k.edf[.k.f;x];.k.ed:.k.ed,'.k.edf[.k.f;last x]];
		$[1=count x 0;[show "1=#x 0";.k.w:(where(max min each .k.ed)=.k.ed)0;(.k.w;.k.ed[.k.w];(1,128)#raze .k.f[.k.w])];
		[w:first each where each (m:min each .k.ed)=.k.ed; mm:m[where each {x=y}[w;]each asc raze distinct w]; 
		tmp:raze mm@'wmm:where each (max each mm)=mm; tmp:(wmm where(max tmp)=tmp)0;(tmp;(max mm@'wmm)0;(.k.f tmp)0)]]};
	t[v];
	neg[.z.w] (`mcb;(.k.f:asc .k.f) (til v`nw)*(count .k.f) div v`nw);
	.k.km:{show "KMEANS";.k.ed:();.Q.gc[];.k.ed:.k.edf[.k.f;x];(count each agw;sum each {.k.f x}each agw:gw asc key gw:group first each where each (min each .k.ed)=.k.ed)};}

/ Shuffle for distributed sort - could implement Berkeley paper here
shf:{[p]
	.k.p:p; INF:-1+2 xexp 32; .k.p[0]:neg[INF]; .k.p,:INF;
	.k.td:{.k.rd,:x;.k.lc,:y;};
	lsrt:{show "lsrt"; .k.fd:asc .k.rd,.k.f where .k.f[;0] within (.k.p[.k.id];.k.p[.k.id+1]);};
	.k.l:({.k.f where .k.f[;0] within (.k.p[x];.k.p[x+1])}peach til -1+count .k.p)[wn:where not .k.id=til .k.nw];
	.k.hl:(hopen .k.lkh) (`lk;wn);
	{t:hopen .k.hl x; t (.k.td;(.k.l x);1);}peach til count wn; 
	lsrt[];}
