a:"f"${("i"$2 xexp x)?1000000f}13;
w:50;
t:til w;
ca:til neg[w]+1+count a;
\ts k:(a ca+\:t)
\ts sdp:k$flip k
/ \ts sdp:sum over 'k*\:'k
\ts smasva:{[t;x](var;avg)@\:a[x+t]}[t;] each ca;
c0:sqrt smasva[;0];c1:smasva[;1];
.Q.gc[];
\ts D:sqrt 2*w*(1-(sdp-w*c1*/:c1))%w*c0*/:c0
kk:where each (min each D)='D;
/ matrix profile - shortest distance subsequence pairs 
\ts mp:(a ca+\:til w),'a flip kk+/:til w 
