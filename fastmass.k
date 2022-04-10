a:16384?10000f
w:50
t:!50 
ca:!1+(-1*w)+#a
k:(a ca+\:t)
\t sdp:+/'+/'k*\:'k
smasva:{(var;avg)@\:a[x+t]}'ca
c0:smasva[;0];c1:smasva[;1];
\t D:2*w*(1-(sdp-w*c1*/:c1))%w*c0*/:c0
