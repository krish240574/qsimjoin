a:"f"${("i"$2 xexp x)?1000000f}17;
w:50
t:til w;
ca:til neg[w]+1+count a;
\ts k:(a ca+\:t)
.Q.gc[]
\ts sdp:k$flip k
\ts smasva:{[t;x](var;avg)@\:a[x+t]}[t;] each ca;
c0:smasva[;0];c1:smasva[;1];
\ts D:2*w*(1-(sdp-w*c1*\:'c1))%w*c0*\:'c0

/ to be tested... STAMP code
/tmp:(b cb+\:til w);
/ \ts {mass[a[x+t]]}each ca 
/dd:((count cb),(count ca))#D
/kk:where each (min each dd)='dd;
/mp:(b cb+\:til w),'a flip kk+\:/:til w / matrix profile - shortest distance subsequence pairs in a and b (w of b, w of a)


