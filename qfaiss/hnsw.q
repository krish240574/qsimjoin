/ represent graph using a dictionary
/ initialize levels to empty first
h:()
c:0;
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
$[0=count h;h:(1+til l)!(l#());]
h[l]:(enlist c)!(enlist ());h[l-1]:(enlist c)!(enlist ())


l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
show l;
c+:1
show c;
/ add new nodes at levels l and l-1
c1:(|/)(key h) in l;c2:(|/)(key h) in l-1;
$[c1;h[l]:h[l],(enlist c)!(enlist ());h[l]:(enlist c)!(enlist ())]
$[c2;h[l-1]:h[l-1],(enlist c)!(enlist ());h[l-1]:(enlist c)!(enlist ())]
op:f0 til each -1+count each key each (h[l];h[l-1])
nn:where each (min each s)=s:sum  each '(f0[c]-/:/:op)xexp 2
nn[where 0= count each nn]:-1
{(h x):@[h x;c;:;(nn 0;s[0][nn 0])]}each ws:(l;l-1)
