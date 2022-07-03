/ represent graph using a dictionary
f0:get `:f0
l:(1+"i"$(neg log(1?1f)*reciprocal log 5))0
m:5; c:0;.k.ep:()
h:(til l+1)!((l+1)#(enlist ()))
ed:{sum each (x-/:y) xexp 2}

/ Initialize graph here
$[0=count h;{(h x):enlist ()}each reverse (l+1) _til m+1;]
	
/ Update graph routine
/ug:{$[33=c;rukug;];k:.k.ep;dnep:sum(f0[c]-f0[first k])xexp 2; t:(((raze h[x])[first k]),'(c,dnep)); (h x):@[h x;first k;:;enlist ((t 0)iasc t 1;asc t 1)]} 
ug:{k:.k.ep;dnep:sum(f0[c]-f0[first k])xexp 2; t:(raze h[x][first k]),'c,dnep; (h x):@[h x;first k;:;enlist ((t 0)iasc t 1;asc t 1)]} 
/ Insert point into graph	
ip:{$[1<y;[s:sum each (f0[c]-/:f0 z)xexp 2;i:iasc s;s:asc s];[s:sum (f0[c]-f0 z)xexp 2;i:0]]; (h x):@[h x;c;:;enlist ($[1<y;z i;z];s)]; }
/ Get nearest neighbours
gnn:{$[0h=type .k.ep;.k.ep:.k.ep 0;];rc:count r:(raze over  (h x).k.ep);rc:count r:r til rc div 2;r:$[1=rc;r 0;r]; ip[x;rc;r];	}
/ Helper functions
cf1:{show"1=count h x";(h x):@[h x;(key h x)0;:;enlist(c;sum (f0[c]-f0[0])xexp 2)]; (h x):@[h x;c;:;enlist((key h x)0;sum (f0[c]-f0[0])xexp 2)];.k.ep:0;};
cfg:{ gnn[x]; ug[x]; }
/ Add points 
ap:{$[1=count h x;$[c<>(key h x)0;cf1[x];.k.ep:0];[.k.ep:(key h x)0;cfg[x]]]}
/ Phase 1 of construction
p1:{$[0=count h x;[(h x):()!();.k.ep:0];[kh:(key h x)0;$[(1=count h x) | 0=count h[x][kh];.k.ep:kh;[$[x=m;.k.ep:kh;.k.ep:first(raze (h x).k.ep)[0]]]]]];show "*";show .k.ep;}
/ Phase 2 of construction
p2:{$[0=count h x;(h x):(enlist c)!(enlist ());];ap[x]; }
/ Main loop - graph build
gb:{
  p1 each reverse (l+1) _til m+1;
  p2 each reverse til l+1;
  l::(1+"i"$(neg log(1?1f)*reciprocal log 5))0;
	.k.ep:();
  c::c+1;
  }each til n:50

/n:10
/do[n-1;gb[];];
/
/ip:{$[1=count h x;
/		[show "1=count h x";
/			(h x):@[h x;(key h x)0;:;enlist(c;sum (f0[c]-f0[0])xexp 2)];
/			(h x):@[h x;c;:;enlist((key h x)0;sum (f0[c]-f0[0])xexp 2)];]; 
/		[show "1<count h x";
/     /s:sum each (f0[c]-/:f0 key h x)xexp 2;i:iasc s;s:asc s;$[6<count s;[s:s til 6;i:i til 6];];$[0=count s;[show "2.s is 0";show s];];
/		/ Need to work this logic out - add on the basis of entry points
/		/rc:count r:(raze over  (h x).k.ep);rc:count r:r til rc div 2;r:$[1<rc;r;r 0];nn:where r=(raze value h x)[;0];$[1=count nn;nn:nn 0;];
/		rc:count r:(raze over  (h x).k.ep);rc:count r:r til rc div 2;r:$[1<rc;r;r 0];.k.ep:r;show".k.ep:";show .k.ep;
/    $[1<rc;[s:sum each (f0[c]-/:f0 r)xexp 2;i:iasc s;s:asc s];[s:sum (f0[c]-f0 r)xexp 2;i:0]];$[6<count s;[s:s til 6;i:i til 6];];$[0=count s;[show "2.s is 0";show s];];
/		rukp2;
/         (h x):@[h x;c;:;enlist ($[1<rc;r i;r];s)];
/					/ Update graph here
/					ug[x;r];
/		]]}
/
/ug:{
/		/hh:h x;d:h[x][c][;1];k:h[x][c][;0]; k:k 0;d:d 0;show y;
/		hh:h x;d:h[x][y][;1];k:h[x][y][;0]; k:k 0;d:d 0;show y;
/		
/    fl:$[1<count k;first k where d<first each (raze hh[k])[;1];$[0=count wd:where d<enlist(raze hh[k])1;-1;wd 0]];
/    / Check for = 3 here also for fl = null here
/    /$[0N<>fl & 0<count fl;(h x):@[h x;fl;:;enlist((@[raze hh[fl][;0];0;:;fl]);(@[raze hh[fl][;1];0;:;d[0]]))];]
/		rukug;
/    $[0<fl;(h x):@[h x;fl;:;enlist((@[raze hh[fl][;0];0;:;fl]);(@[raze hh[fl][;1];0;:;d[0]]))];[(h x):@[h x;y;:;enlist (raze h[x][y]),'c,sum(f0[c]-f0[y])xexp 2]]];
/		(h x):@[h x;y;:;enlist((raze h[x])[y][0] iasc (raze h[x])[y][1];asc(raze h[x])[y][1])]}
/    /$[0<fl;(h x):@[h x;fl;:;enlist((@[raze hh[fl][;0];0;:;fl]);(@[raze hh[fl][;1];0;:;d[0]]))];show "todo this case"]}
////
