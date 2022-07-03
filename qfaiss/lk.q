/ lookup server on the network
\l p.q
.k.ctr:-1
reg:{.k.ctr+:1;$[.k.ctr=0;.k.me:(enlist .k.ctr)!enlist x;.k.me,:(enlist .k.ctr)!enlist x];neg[.z.w](`rcb;.k.ctr)}
lk:{.k.me x}
ghl:{value .k.me}
lku:{(value .k.me) x}
