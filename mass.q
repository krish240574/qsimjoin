\P 0
a:"f"${("i"$2 xexp x)?1000000f}10;
b:"f"$100?1000000f;
mass:{[w;bi]
 c:til neg[w]+1+count a;
 t:til w;
 smasva::{[t;x](var;avg)@\:a[x+t]}[t;] each c;
 qt:{[bi;t;x]a[x+t]$bi}[bi;t;] each c;
 smb:avg bi;svb:var bi;
 D::D,sqrt 2*w*( 1- (qt - w*smb*smasva[;1])%w*sqrt svb*smasva[;0]);}
/ the following is code for the STAMP algorithm
/ q)h:((til count b)+\:(til w))
/ q){mass[10;x]}each b k

/ kk:where each (min each dd)='dd
/ (b h),'a flip kk+\:/:til w / matrix profile - shortest d
istance subsequence pairs in a and b


