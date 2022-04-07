\\P 0
a:"f"${("i"$2 xexp x)?1000000f}10;
b:"f"$100?1000000f;
w:10;
ca:til neg[w]+1+count a;
cb:til neg[w]+1+count b;
t:til w;
smasva:{[t;x](var;avg)@\:a[x+t]}[t;] each ca;
sdp:{[r;bi]a[r+t]$bi};
mass:{[bi]
/ qt:{[bi;r]a[r+t]$bi}[bi;] each ca;
/ x f\:y <-> f[;y] each x;
 qt:ca sdp\:bi;
 smb:avg bi;svb:var bi;
 D::D,sqrt 2*w*(1-(qt-w*smb*smasva[;1])%w*sqrt svb*smasva[;0])}
D:();
{mass[x]}each b cb+\:til w 
dd:((count cb),(count ca))#D
kk:where each (min each dd)='dd;
/ matrix profile - shortest distance subsequence pairs in a and b (w of b, w of a)
mp:(b cb+\:til w),'a flip kk+\:/:til w 


