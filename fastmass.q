/ self-join code - will expand to handling a Q time-series too.
a:"f"${("i"$2 xexp x)?1000000f}17;
w:50
t:til w;
ca:til neg[w]+1+count a;
\ts k:(a ca+\:t)
.Q.gc[]
\ts sdp:k$flip k
\ts smasva:{[t;x](var;avg)@\:a[x+t]}[t;] each ca;
c0:smasva[;0];c1:smasva[;1];
\ts D:2*w*(1-(sdp-w*c1*/:c1))%w*c0*/:c0

/ to be tested... STAMP code
kk:where each (min each D)='D;
mp:(a ca+\:til w),'a flip kk+/:til w / matrix profile - shortest distance subsequence pairs in a 


