s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t}
np:.p.import`numpy
mm:np`:memmap
ap:{
  l:((mm[(x`file)0;`mode pykw "r"]`:shape)`)0;
	show ((mm[(x`file)0;`mode pykw "r"]`:shape)`);
  n:s2i x`nc;
  dt:x`dt;
  d:s2i x`dim;
	nct:s2i x`nct;
	show nct;
  li:raze over string x`li;
  lp:raze over string x`lp;
  `file`l`n`dt`dim`nct`li`lp!(x`file;l;n;dt;d;nct;li;lp)}
