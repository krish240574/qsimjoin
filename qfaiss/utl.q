s2i:{c:count t:raze ("i"$x)-48;"i"$sum (reverse 10 xexp til c)*t}
np:.p.import`numpy
mm:np`:memmap
ap:{
	l:((mm[(x`file)0;`mode pykw "r"]`:shape)`)0;
	n:s2i x`nc;
	dt:x`dt;
	d:s2i x`dim;
	`file`l`n`dt`dim!(x`file;l;n;dt;d)}
