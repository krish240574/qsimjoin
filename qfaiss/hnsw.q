/ represent graph using a dictionary
/ initialize levels to empty first
h:()
c:0;
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
$[0=count h;h:(1+til l)!(l#());]
h[l]:(enlist c)!(enlist ());h[l-1]:(enlist c)!(enlist ())
c+:1
/ add new nodes at levels l and l-1
h[l]:h[l],(enlist c)!(enlist ());h[l-1]:h[l-1],(enlist c)!(enlist ())
/d:f0 key each h where 1<count each h
/ws:where 1<count each h
/ds:{sum each (x[c]-/:x[til -1+count x]) xexp 2}each d

/ add nearest neighbour  
q)op:f0 til each max each key each h ws:where 1<count each h
nn:where each (min each s)=s:sum  each '(f0[c]-/:/:op)xexp 2
{(h x):@[h x;c;:;(nn 0;ds[0][nn 0])]}each ws

/{(h x):@[h x;c;:;(nn 0;ds[0][nn 0])];(h x):@[h x;c-1;:;(c;ds[c])]}each ws

{(h x):@[h x;c;:;(c-1;ds[c-1])];(h x):@[h x;c-1;:;(c;ds[c])]}each ws

/where (min s)=s:{sum (d[c]-d[x]) xexp 2}each til -1+count d



