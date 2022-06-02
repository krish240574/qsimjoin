/ worker function to split files and return samples
wk:{[v]
  t:{
      show x;
      s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t};
      np:.p.import`numpy;mm:np`:memmap;rs:np`:reshape;
      .p.set[`c;x`c];
      .p.set[`d;x`d];
      .k.f:mm[x`file; `dtype pykw x`dt; `mode pykw "r"; `shape pykw .p.pyeval"tuple((1,c))";`offset pykw x`sp];
      .k.f:(rs[.k.f;.p.qeval"tuple((-1,d+1))"])`; 
      (`$":f",string y-1) 1: (.k.f)[;1+til x`d];};
  t[v;1];
  neg[.z.w] (`mcb;(asc .k.f) 200?count .k.f)}

