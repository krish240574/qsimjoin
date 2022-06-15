/ represent graph using a dictionary
/ initialize levels to empty first

l:("i"$(neg log(1?1f)*reciprocal log 5)+1)0
$[0=count h;[h:(til l)!(l#());h[l-1]:enlist t;h[l-2]:enlist t];]
$[l>count h;[h[l-2]:h[l-2],enlist t;h[l-1]:h[l-1],enlist t];]
