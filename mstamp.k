shp:{[g]$[~(@g) in (`e;`f;`g;`i);(#g),shp g 0;""]}

a:3^999?10000f;t:!w:50;ca:!1+(-1*w)+#a;nak:a@\:ca+\:t;
/ sliding dot product of each caXw 
nsdp:{+/''nak[x]*\:/:nak[x]}'!#nak
smasva:(var;avg)@\:/:/:nak
c0:smasva[;;0];c1:smasva[;;1];
\t D:{sqrt 2*w*(1-(nsdp[x]-w*c1[x]*/:c1[x]))%w*c0[x]*/:c0[x]}'!#nsdp
SD:+'^''+'D
kk:*'(&''(min''SD)=''SD)0
g:kk+\:t  
(a@\:ca+\:t),''{a[x]@g }'!#a

