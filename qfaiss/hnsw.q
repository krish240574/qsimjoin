/ represent graph using a dictionary
/ initialize levels to empty first
f0:get `:f0
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0;m:l;c:0
h:(til l+1)!((l+1)#(enlist ()))
r:{(rkh)!h(rkh:reverse key h)}
.k.ep:()
.k.gep::{$[x<0;:-1;.k.ep:.k.ep,(key h x)where (min s)=s:sum each(f0[c]-/:f0 wk:where not c=key h x)xexp 2]};
.k.ip::{s:sum each (f0[c]-/:f0 wk:where not c=key h x)xexp 2;$[0=count s;:-1;];$[1=count h x;(h x):@[h x;c;,;(enlist c)!enlist ((iasc s);asc $[1<count s;each;] s) ];(h x):@[h x;c;,;(enlist c)!enlist ((iasc s);asc s)]]};
.k.gs:{ep:.k.gep each reverse $[0<count k:(l+1) _ til m+1;k;-1];show .k.ep;.k.ip each reverse (til l),l;.k.ep:()};
hnsw:{
	l::("i"$(neg log(1?1f)*reciprocal log 5)+1)0;
	/$[l>m;m::l;];
	m::max key h;
	ruk;
	{{$[(0=(|/)l=key h)|0=count h x;(h x):(enlist c)!(enlist ());];}each reverse til l+1;.k.gs[]}[];
	c+::1;}
n:10
do[n-1;hnsw[];];
