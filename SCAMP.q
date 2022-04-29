\l utl.q
a:"f"$(4,2048)#1000?1f;
w:30; t:til w; ca:til neg[w]+1+count a 0; .Q.gc[];
nak:a@\:ca+\:t;
/ shape - nt, nt, (count a) div 4, w
nnak:(`1`2`3`4)!(4,(count nak 0) div 4)#/:nak

/ distributed sdp - 4 workers
c1:hopen`::5042; c2:hopen `::5043; c3:hopen `::5044; c4:hopen `::5045;
sa:`1`2`3`4!(`::5043;`::5042;`::5044;`::5045)
nsdp:{[sa;x]sa[x]({x$\:/:''x};value nnak)}[sa;]each key nnak
/ gather chunks and re-assemble
/ ideally, these should be stored at each worker, then taken
/ for re-assembly - will implement that too
nsdp:{(,'/){(,/)x[y;]}[x;]each til count x}each nsdp
q)shp {(,'/)(,'/)x}each nsdp

/ single process nsdp
/ \ts f:{{(nnak[x])[y]$\:/:/:nnak[x]}[x;]each til count nnak[x]}each key nnak
/ this might not work - need to test
/ \ts nsdp:{nak[x]$\:/:nak[x]}each til count nak

nsmasva:(var;avg)@\:/:/:nak
c0:sqrt nsmasva[;;0];c1:nsmasva[;;1];
v0:{(c0 x)*/:c0 x}each til count c0
v1:{(c1 x)*/:c1 x}each til count c1
Shorter code - but slower
/ \ts D:sqrt 2*w*(1-(nsdp-w*v1))%w*v0
/ this is 100% faster
\ts D:{sqrt 2*w*(1-nsdp[x]-w*v1[x])%w*v0[x]}each til count nsdp
/ replace 0n values with very large values
\ts D:(@/)''[D;where each '0n='D;:;"f"$2 xexp 32]
/ column-wise sort 
\ts SD:flip each (asc)@\:''flip each D
.Q.gc[];
\ts {flip asc each flip D x}each til count D
kk:first each 'where each '(min each 'SD)=''SD
g:kk+\:\:t
\ts (a@\:ca+\:t),''{a[x]@g x}each til count a
