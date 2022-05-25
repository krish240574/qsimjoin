kmpp:{[c;n]
	shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]};
	sqr:{x xexp 2};
	f0:"f"$get `:f0;
	ed:raze sum each sqr (raze f0 c)-/:f0;
	c:c,where (max ed)=ed;show nc:last c;
	nc:last c;
	do[n-1; ct:raze f0 nc;
		ed:ed,'raze sum each sqr ct-/:f0; $[(count c)<n;c:c,nc:where (max k)=k:min each ed;];];
		km:(min each ed)=ed;
		ruk;
		:(km;c);
		}

/q)gg:((kmc 1)raze key g)!value g:group where each kmc 0
/q)fgg:(key gg)!avg each f0 value gg
/q)sum each  sqr (f0 @ raze key fgg)-value fgg

