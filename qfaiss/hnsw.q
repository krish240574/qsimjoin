f0:get `:f0
l:(1+"i"$(neg log(1?1f)*reciprocal log 5))0
m:5; c:0;.k.ep:()
h:(til l+1)!((l+1)#(enlist ()))
ed:{sum each (x-/:y) xexp 2}

/ Initialize graph here
$[0=count h;{(h x):enlist ()}each reverse (l+1) _til m+1;]
 
ug:{k:.k.ep;dnep:sum(f0[c]-f0[first k])xexp 2; t:(raze h[x][first k]),'c,dnep; (h x):@[h x;first k;:;enlist ((t 0)iasc t 1;asc t 1)]} 
ip:{$[1<y;[s:sum each (f0[c]-/:f0 z)xexp 2;i:iasc s;s:asc s];[s:sum (f0[c]-f0 z)xexp 2;i:0]]; (h x):@[h x;c;:;enlist ($[1<y;z i;z];s)]; }
gnn:{$[0h=type .k.ep;.k.ep:.k.ep 0;];rc:count r:(raze over  (h x).k.ep);rc:count r:r til rc div 2;r:$[1=rc;r 0;r]; ip[x;rc;r]; }
cf1:{show"1=count h x";(h x):@[h x;(key h x)0;:;enlist(c;sum (f0[c]-f0[0])xexp 2)]; (h x):@[h x;c;:;enlist((key h x)0;sum (f0[c]-f0[0])xexp 2)];.k.ep:0;};
cfg:{ gnn[x]; ug[x]; }
ap:{$[1=count h x;$[c<>(key h x)0;cf1[x];.k.ep:0];[.k.ep:(key h x)0;cfg[x]]]}
p1:{$[0=count h x;[(h x):()!();.k.ep:0];[kh:(key h x)0;$[(1=count h x) | 0=count h[x][kh];.k.ep:kh;[$[x=m;.k.ep:kh;.k.ep:first(raze (h x).k.ep)[0]]]]]];}
p2:{$[0=count h x;(h x):(enlist c)!(enlist ());];ap[x]; }
/ Main loop - graph build
gb:{
  p1 each reverse (l+1) _til m+1;
  p2 each reverse til l+1;
  l::(1+"i"$(neg log(1?1f)*reciprocal log 5))0;
 .k.ep:();
  c::c+1;
  }each til n:50
