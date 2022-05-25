kmpp:{[c;n]
	shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]};
	edf:{sum each (y-/:x) xexp 2};
	f0:"f"$get `:f0;
	ed:raze edf[f0;raze f0 c];
	c:c,where (max ed)=ed;show nc:last c;
	nc:last c;
	do[n-1; ct:raze f0 nc;ed:ed,'raze edf[f0;ct];$[(count c)<n;c:c,nc:where (max k)=k:min each ed;];];
		/km:(min each ed)=ed;
		gg:(c raze key g)!value g:group where each (min each ed)=ed;
		fgg:avg each f0 value gg;
		d:sum over (f0 @ raze key gg)-fgg;
		:d }

d:kmpp[27352;5];


