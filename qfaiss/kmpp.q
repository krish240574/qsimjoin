kmpp:{[c;n]
	.k.edf:{sum each (y-/:x) xexp 2};
	.k.fd:{
		gg:((x 1) raze key g)!value g:group first each where each x 0; 
    .k.fgg:avg each .k.f0 value gg;
		:gg};
	i:{[c;n]
		ed:raze .k.edf[.k.f0;raze .k.f0 c];
		c:c,where (max ed)=ed;nc:last c;
		do[n-1; ct:raze .k.f0 nc;ed:ed,'raze .k.edf[.k.f0;ct];$[(count c)<n;c:c,nc:where (max k)=k:min each ed;];];
		:((min each ed)=ed;c)};
	t:{[d]
		ed:{[f0;x].k.edf[f0;raze x]}[.k.f0;]each .k.fgg;
		tmp:flip ed;
		kmc:((min each tmp)=tmp;.k.fgg); gg:.k.fd[kmc]; d:sum over (key gg)-.k.fgg;
		show d;
		:d };
		.k.f0:get `:f0;
		kmc:i[c;n]; gg:.k.fd[kmc]; d:sum over (.k.f0 @ raze key gg)-.k.fgg;
		show d;
		t/[d]}

d:kmpp[27352;50];


