/ represent graph using a dictionary
/ initialize levels to empty first
f0:get `:f0
h:()
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
m:l
c:0
h:(til l+1)!((l+1)#(enlist ()))
r:{(rkh)!h(rkh:reverse key h)}
hnsw:{
	c+:1;
	l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0;$[l>m;m::l;];
	.k.gep::{show x;$[x<0;[show "return!";:-1];ep:reverse where (min s)=s:sum each(f0[c]-/:f0 wk:where not c=key h x)xexp 2]};
	.k.ip::{$[1=count h x;(h x):@[h x;c;,;(enlist c)!enlist (wk;sum each (f0[c]-/:f0 wk:where not c=key h x)xexp 2)];(h x):@[h x;c;,;(enlist c)!enlist (wk;sum each (f0[c]-/:f0 wk:where not c=key h x)xexp 2)]] };
	.k.gs:{ep:.k.gep each reverse $[0<count k:(l+1) _ til m+1;k;-1];.k.ip each reverse (til l),l;};
	{$[0=count h x;(h x):(enlist c)!(enlist ());.k.gs[]]}each l,reverse til l; }
n:5
do[n-1;hnsw[];];
