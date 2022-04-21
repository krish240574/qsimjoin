/ Multidimensional stamp code - Matrix Profile VI: Meaningful Multidimensional
Motif Discovery - doi:10.1109/icdm.2017.66 
a:"f"${("i"$2 xexp x)?1000000f}12;
w:50;
t:til w;
ca:til neg[w]+1+count a;
.Q.gc[];
na:(4,count a)#a

nak:na@\:ca+\:t
\ts nsdp: nak$flip each nak / ****** this needs fixing
/\ts {(var;avg)@\: x}each 'nak
\ts nsmasva:(var;avg)@\:/:/:nak
c0:sqrt nsmasva[;;0];c1:nsmasva[;;1];
v0:{(c0 x)*/:c0 x}each til count c0
v1:{(c1 x)*/:c1 x}each til count c1
\ts D:sqrt 2*w*(1-nsdp-w*v1)%w*v0 
/ Set 0n values to very high distances, so they don't figure in the MP
\ts D:(@/)''[D;where each '0n='D;:;"f"$2 xexp 32] 
/ Column-wise sort - need to speed this up. 
\ts SD:flip each (asc)@\:''flip each D / might need to check this, maybe it is a simple flip asc flip (,/)D
g:kk+\:\:t
\ts (na@\:ca+\:t),''{na[x]@g x}each til count na / final MP shape is (d,(n+m-1),2*m)

//////////////// needs to be tested from here, the above code is buggy - code below is a fix
\l utl.q
na:"f"$(3,550)#1000?1f;
w:30; t:til w; ca:til neg[w]+1+count a 0; .Q.gc[];
nak:na@\:ca+\:t; nsdp:sum each 'nak*\:'''nak ;
/\ts {(var;avg)@\: x}each 'nak
\ts nsmasva:(var;avg)@\:/:/:nak
c0:sqrt nsmasva[;;0];c1:nsmasva[;;1];
v0:{(c0 x)*/:c0 x}each til count c0
v1:{(c1 x)*/:c1 x}each til count c1
\ts D:sqrt 2*w*(1-(nsdp-w*v1))%w*v0
/q)\ts D:{show x;sqrt 2*w*(1-(nsdp[x] -w*c1[x]*/:c1[x]))%w*c0[x]*/:c0[x]}each til count nsdp
\ts D:(@/)''[D;where each '0n='D;:;"f"$2 xexp 32]
\ts SD:flip each (asc)@\:''flip each D
.Q.gc[];
\ts {flip asc each flip D x}each til count D
kk:first each 'where each '(min each 'SD)=''SD
g:kk+\:\:t
\ts (na@\:ca+\:t),''{na[x]@g x}each til count na


