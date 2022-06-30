/ represent graph using a dictionary
f0:get `:f0
l:(1+"i"$(neg log(1?1f)*reciprocal log 5))0
m:l
c:0
.k.ep:()
h:(til l+1)!((l+1)#(enlist ()))
r:{(rkh)!h(rkh:reverse key h)};.k.nn:();

.k.gep:{$[0<count x;.k.ep:((key h x)where (min s)=s:sum each(f0[c]-/:f0 k where not c=k:key h x)xexp 2)[0];];show "inside gep";show s;show .k.ep;};
/.k.gep:{$[0<count x;.k.ep:.k.ep,((key h x)where (min s)=s:sum each(f0[c]-/:f0 k where not c=k:key h x)xexp 2)[0];];show "inside gep";show s;show .k.ep;};

p1:{
	$[0<count .k.ep;ruk1;];
	/**************** Handle how .k.ep is of length > 1
	/ ************** need to enter only in the lth layer *********************8
	r:$[1<count t:((h x).k.ep)[0][0];(raze (h x)t)[;0];(raze (h x)t)[0]];
	/t:(value ((h x).k.ep)[0])[0][0];
	/s:sum each (f0[c]-/:f0 .k.nn:distinct t,raze (value each (h x)t)[;0][;0])xexp 2;
	s:sum each (f0[c]-/:f0 .k.nn:distinct t,r)xexp 2;
	$[0=count s;[show "1.s is 0";show s;ruk];];
	/ .k.ep:first i - might need this
 	/i:iasc s;$[3<count s;s:s til 3;];(h x):@[h x;c;:;(enlist c)!enlist ((key h x) iasc s;asc s)];}
 	i:iasc s;$[3<count s;s:s til 3;];(h x):@[h x;c;:;enlist(((key h x)iasc s);asc s)];}

p2:{
	$[1=count h x; 
		/ Need to fix that empty list for the first entry here ******************************
		[show "1=count h x";ruk;(h x):@[h x;(key h x)0;:;enlist(c;sum (f0[c]-f0[0])xexp 2)];(h x):@[h x;c;:;enlist((key h x)0;sum (f0[c]-f0[0])xexp 2)];];
    [s:(sum each (f0[c]-/:f0 key h x)xexp 2);i:iasc s;s:asc s;$[3<count s;[s:s til 3;i:i til 3];];$[0=count s;[show "2.s is 0";show s];];
				 (h x):@[h x;c;$[(|/)(0N=(h x)c)0;:;,];enlist (((key h x)i);s)];
					hh::h x;d::h[x][c][;1];k::h[x][c][;0];
					k::k 0;d::d 0;
					/ count fl will be > 1 !!!
					fl:first k where d<first each (raze hh[k])[;1]; 
					/ Check for = 3 here also for fl = null here
					/$[0N<>fl;[(hh fl):@[raze hh[fl][0][;0];0;:;c];(hh fl):@[raze hh[fl][0][;1];1;:;d[0]];rukafter];];
					$[0N<>fl;(hh fl):enlist((@[raze hh[fl][;0];0;:;fl]);(@[raze hh[fl][;1];0;:;d[0]]));];
					/@[hh;k 0;:;enlist(((c),hh[k 0][0][0]);(d 0),hh[k 0][0][1])]rukafter
    ]
	 ];
	/	ug[];
	}
	
.k.ip:{
	/ phase 1 of insert from L to l+1
	/.k.ep:reverse .k.ep;
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
	.k.ip[];
	.k.ep:()}

hnsw:{
  l::("i"$(neg log(1?1f)*reciprocal log 5)+1)0;
  /$[l>m;m::l;];
  m::max key h;
  {{$[(0=(|/)l=key h)|0=count h x;(h x):(enlist c)!(enlist ());];}each reverse til l+1;.k.gb[]}[]; };
n:50
do[n-1;hnsw[];];


