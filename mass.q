/ a:"f"${("i"$2 xexp x)?1000000f}20
/ b:"f"$10?1000000f
wsz:10
t:til wsz
c:1+til neg[wsz]+count a

/ Sliding dot product
\ts {a[x+t]$b}each c

/ Sliding mean
\ts rm:avg {avg a[x+t]}each c

/ Sliding variance - Welford's algo. - needs cleanup
w:10 / configurable
av:cv:var a[til w]
cm:avg a[til w]
start:1
\ts {k:(a[start+w-1]-a[start-1]);pm:cm;pv:cv;cm::pm+k%w;cv::pv+k*(k-cv-pv)%w;av::av,cv;start::start+1}each c
