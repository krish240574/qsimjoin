/ a:"f"${("i"$2 xexp x)?1000000f}20
/ b:"f"$10?1000000f
wsz:10
t:til wsz
c:1+til neg[wsz]+count a
\ts {a[x+t]$b}each c
\ts rm:avg {avg a[x+t]}each c

q)start:0
q)av:cv:var a[start + til w]
q)cm:avg a[start + til w]
q)start:1
q)\ts {k:(a[start+w-1]-a[start-1]);pm:cm;pv:cv;cm::pm+k%w;cv::pv+k*(k-cv-pv)%w;av::av,cv;start::start+1}each c



