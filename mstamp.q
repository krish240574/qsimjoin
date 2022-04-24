/ Multidimensional stamp code - Matrix Profile VI: Meaningful Multidimensional
Motif Discovery - doi:10.1109/icdm.2017.66 

\l utl.q
a:"f"$(3,4196)#1000?1f;
w:30; t:til w; ca:til neg[w]+1+count a 0; .Q.gc[];
nak:a@\:ca+\:t;
\ts nsdp:{nak[x]$\:/:nak[x]}each til count nak

nsmasva:(var;avg)@\:/:/:nak
c0:sqrt nsmasva[;;0];c1:nsmasva[;;1];
v0:{(c0 x)*/:c0 x}each til count c0
v1:{(c1 x)*/:c1 x}each til count c1
\ts D:{sqrt 2*w*(1-nsdp[x]-w*v1[x])%w*v0[x]}each til count nsdp
\ts D:(@/)''[D;where each '0n='D;:;"f"$2 xexp 32]
\ts SD:flip each (asc)@\:''flip each D
.Q.gc[];
\ts {flip asc each flip D x}each til count D
kk:first each 'where each '(min each 'SD)=''SD
g:kk+\:\:t
\ts (a@\:ca+\:t),''{a[x]@g x}each til count a


