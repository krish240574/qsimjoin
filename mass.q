a:"f"${("i"$2 xexp x)?1000000f}10
b:"f"$10?1000000f
w:10
t:til w
c:til (neg[w]+1+count a)
c1:1+til neg[w]+count a

/c:1+til neg[w]+count a 
/ st:1
/ \ts cslv:{k:a[st+w-1]-a[st-1];pm:cm;pv:cv;cm::pm+k%w;cv::pv+k*(a[st+w-1]+a[st-1]-cv-pv)%w;slv::slv,cv;st::st+1}

sdp:{a[x+t]$b}
sma:{avg a[x+t]}
cslv:{k:a[x+w-1]-a[x-1];pm:cm;pv:cv;cm::pm+k%w;cv::pv+k*(a[x+w-1]+a[x-1]-cv-pv)%w;slva::slva,cv}

qt:sdp each c
slva:cv:var a[t]; cm:avg a[t];
cslv each c1
slma:sma each c
slmb:avg b[t]
slvb:var b[t]
