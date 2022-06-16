/ represent graph using a dictionary
/ initialize levels to empty first
h:()
c:0;
l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
$[0=count h;[h:(1+til l)!(l#());]
h[l]:(enlist c)!(enlist ());h[l-1]:(enlist c)!(enlist ())
c+:1
/h[l]:h[l],enlist t;h[l-1]:h[l-1],enlist t
h[l]:h[l],(enlist c)!(enlist ());h[l-1]:h[l-1],(enlist c)!(enlist ())
d:f0 key h c
(h 1):@[(h 1);c;:;(c-1;sum (d[0]-d[1]) xexp 2)]

q)where (min s)=s:{sum (d[c]-d[x]) xexp 2}each til -1+count d



