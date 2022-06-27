/ represent graph using a dictionary
f0:get `:f0
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0;m:l;c:0;.k.ep:();

h:(til l+1)!((l+1)#(enlist ()))

r:{(rkh)!h(rkh:reverse key h)};.k.nn:();

.k.gep:{$[0<count x;.k.ep:.k.ep,((key h x)where (min s)=s:sum each(f0[c]-/:f0 k where not c=k:key h x)xexp 2)[0];];show "inside gep";show s;show .k.ep;};

p1:{
	/t:(value(h x).k.ep)[0][0]; 
	t:(value ((h x).k.ep)[0])[0][0];
	s:sum each (f0[c]-/:f0 .k.nn:distinct t,raze (value each (h x)t)[;0][;0])xexp 2;
	$[0=count s;[show "1.s is 0";show s;ruk];];
 	.k.ep:first i:iasc s;$[3<count s;s:s til 3;];(h x):@[h x;c;:;(enlist c)!enlist ((key h x) iasc s;asc s)];}

p2:{
	$[1=count h x; 
		/ Need to fix that empty list for the first entry here ******************************
		[show "1=count h x";(h x):@[h x;c;,;(enlist c)!enlist(0;sum (f0[c]-f0[0])xexp 2)]];
    [s:(sum each (f0[c]-/:f0 key h x)xexp 2);i:iasc s;s:asc s;$[3<count s;[s:s til 3;i:i til 3];];$[0=count s;[show "2.s is 0";show s];];
         (h x):@[h x;c;,;(enlist c)!enlist ((key h x)i;s)]
    ]
	 ];
	}
	
.k.ip:{
	/ phase 1 of insert from L to l+1
	.k.ep:reverse .k.ep;
	$[0<count .k.ep;p1 each reverse (l+1)_ til m+1;];
	/ phase 2 of insert from l to 0
	p2 each reverse til l+1;
	}
	
.k.gb:{
	k:(l+1) _ til m+1;
	/.k.gep each reverse $[0<count k:(l+1) _ til m+1;k;()];
	show "value to gep - ";
	show k;
	.k.gep each reverse k;
	c+::1;
	.k.ip[];}

hnsw:{
  l::("i"$(neg log(1?1f)*reciprocal log 5)+1)0;
  /$[l>m;m::l;];
  m::max key h;
  {{$[(0=(|/)l=key h)|0=count h x;(h x):(enlist c)!(enlist ());];}each reverse til l+1;.k.gb[]}[]; };
n:50
do[n-1;hnsw[];];


