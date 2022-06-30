/ represent graph using a dictionary
f0:get `:f0
l:(1+"i"$(neg log(1?1f)*reciprocal log 5))0
m:5
c:0
.k.ep:()
h:(til l+1)!((l+1)#(enlist ()))

ed:{sum each (x-/:y) xexp 2}
$[0=count h;{(h x):enlist ()}each reverse (l+1) _til m+1;]
	
/ Empty graph - starting of time
cf1:{$[1=count h x;[show "1=count h x";(h x):@[h x;(key h x)0;,;enlist(c;sum (f0[c]-f0[0])xexp 2)];(h x):@[h x;c;,;enlist((key h x)0;sum (f0[c]-f0[0])xexp 2)];];]}
cfg:{show "todo"}
p1:{$[0=count h x;(h x):()!();]}
ug:{
		hh:h x;d:h[x][c][;1];k:h[x][c][;0]; k:k 0;d:d 0;
    / count fl will be > 1 !!!
    fl:first k where d<first each (raze hh[k])[;1];
    / Check for = 3 here also for fl = null here
    $[0N<>fl;(h x):@[h x;fl;:;enlist((@[raze hh[fl][;0];0;:;fl]);(@[raze hh[fl][;1];0;:;d[0]]))];]}
		

ip:{$[1=count h x;
		[show "1=count h x";
			(h x):@[h x;(key h x)0;:;enlist(c;sum (f0[c]-f0[0])xexp 2)];
			(h x):@[h x;c;:;enlist((key h x)0;sum (f0[c]-f0[0])xexp 2)];]; 
		[show "1<count h x";
     s:asc sum each (f0[c]-/:f0 key h x)xexp 2;i:iasc s;$[3<count s;[s:s til 3;i:i til 3];];$[0=count s;[show "2.s is 0";show s];];
         /(h x):@[h x;c;$[(|/)(0N=(h x)c)0;:;,];enlist (((key h x)i);s)];
         (h x):@[h x;c;:;enlist (((key h x)i);s)];
					/ Update graph here
					ug[x];
		]]}

p2:{
  $[0=count h x;(h x):(enlist c)!(enlist ());[show "calling ip";ip[x]]]
  }


gb:{
  p1 each reverse (l+1) _til m+1;
  p2 each reverse til l+1;
  l::(1+"i"$(neg log(1?1f)*reciprocal log 5))0;
  c::c+1;
  }

n:50
do[n-1;gb[];];
