/ represent graph using a dictionary
f0:get `:f0
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0;m:l;c:0;.k.ep:();
h:(til l+1)!((l+1)#(enlist ()))
r:{(rkh)!h(rkh:reverse key h)};.k.ep:;.k.nn:();
.k.gep:{$[0<count x;.k.ep:.k.ep,((key h x)where (min s)=s:sum each(f0[c]-/:f0 key h x)xexp 2)[0];]};
.k.ip:{
	$[(7h=type .k.ep) & 1=count .k.ep;.k.ep:.k.ep[0];];
	$[.k.ep>0;
		[show"inserting using ep";
			t:(value(h x).k.ep)[0][0]; s:sum each (f0[c]-/:f0 .k.nn:distinct t,raze (value each (h x)t)[;0][;0])xexp 2;$[0=count s;[show "1.s is 0";show s;ruk];];
			.k.ep:first i:iasc s;$[3<count s;s:s til 3;]; (h x):@[h x;c;:;(enlist c)!enlist ((iasc s);asc s)]];	
		[show"ep=-1;inserting without";
			$[1=count h x;
				[show "1=count h x";(h x):@[h x;c;,;(enlist c)!enlist(0;sum (f0[c]-f0[0])xexp 2)]];
				[s:(sum each (f0[c]-/:f0 key h x)xexp 2);i:iasc s;s:asc s;$[3<count s;[s:s til 3;i:i til 3];];$[0=count s;[show "2.s is 0";show s];];
				 (h x):@[h x;c;,;(enlist c)!enlist (i;s)] 
				] 
		 	 ] 
		] 
	 ];}
.k.gs:{.k.gep each reverse $[0<count k:(l+1) _ til m+1;k;()];c+::1;.k.ip each reverse (til l),l;.k.ep:()};
hnsw:{
	l::("i"$(neg log(1?1f)*reciprocal log 5)+1)0;
	$[l=6;ruk;];
	/$[l>m;m::l;];
	m::max key h;
	{{$[(0=(|/)l=key h)|0=count h x;(h x):(enlist c)!(enlist ());];}each reverse til l+1;.k.gs[]}[]; };
n:50
do[n-1;hnsw[];];
