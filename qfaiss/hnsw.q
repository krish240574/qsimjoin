/ represent graph using a dictionary
/ initialize levels to empty first
f0:get `:f0
h:()
c:0;
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
$[0=count h;h:(til l)!(l#());]
h[l]:(enlist c)!(enlist ());h[l-1]:(enlist c)!(enlist ())


l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
show l;
c+:1
show c;
/ add new nodes at levels l and l-1
c1:(|/)(key h) in l;c2:(|/)(key h) in l-1;
$[c1;h[l]:h[l],(enlist c)!(enlist ());h[l]:(enlist c)!(enlist ())]
$[c2;h[l-1]:h[l-1],(enlist c)!(enlist ());h[l-1]:(enlist c)!(enlist ())]
op:f0 k:til each -1+count each key each (h[l-1];h[l])
nn:where each (min each s)=s:sum  each '(f0[c]-/:/:op)xexp 2
/$[0<count w:where 0=count each nn;nn[w]:-1;]
/nn:enlist each raze nn


q)n::0
q){(h x):@[h x;c;:;(((iasc each s)n);(asc each s)n)];n::n+1}each (l-1;l)

/n::0
/{(h x):@[h x;c;:;$[(-1<>nn n)0;(nn n;s[n][nn n]);(enlist ())!(enlist ())]];n::n+1;}each ws:(l-1;l)


/ new code
h:()
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
h:(til l+1)!((l+1)#(enlist ()))
c:0
q){$[0=count h x;(h x):(enlist c)!(enlist ());(h x):@[h x;c;,;(enlist c)!(enlist ())]]}each (l,reverse til l)
c+:1
{where  (min  s)=s:sum each (f0[c] -/:(f0 key h x))xexp 2}each reverse l _1+til max key h 
q)({ sum each (f0[c]-/:f0 key h x)xexp 2 }each reverse (til l),l)





















