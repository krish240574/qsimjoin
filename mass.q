a:"f"${("i"$2 xexp x)?1000000f}10
b:"f"$10?1000000f
w:10
t:til w
c:til (neg[w]+1+count a)
/c:1+til neg[w]+count a 
sdp:{a[x+t]$b}
sm:{avg a[x+t]}

slv:cv:var a[til w]; cm:avg a[til w]; 
/ st:1
/ \ts cslv:{k:a[st+w-1]-a[st-1];pm:cm;pv:cv;cm::pm+k%w;cv::pv+k*(a[st+w-1]+a[st-1]-cv-pv)%w;slv::slv,cv;st::st+1}
cslv:{k:a[x+w-1]-a[x-1];pm:cm;pv:cv;cm::pm+k%w;cv::pv+k*(a[x+w-1]+a[x-1]-cv-pv)%w;slv::slv,cv}

cslv each 1+til neg[w]+count a
qt:sdp each c
slm:sm each c
