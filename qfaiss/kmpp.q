kmpp:{[c;n]
	.k.f0:get `:f0;
	i:{[f0;c;n]
		edf:{sum each (y-/:x) xexp 2};
		ed:raze edf[f0;raze f0 c];
		c:c,where (max ed)=ed;nc:last c;
		do[n-1; ct:raze f0 nc;ed:ed,'raze edf[f0;ct];$[(count c)<n;c:c,nc:where (max k)=k:min each ed;];];
		:(((min each ed)=ed);c)};
	t:{[d]
		edf::{sum each (y-/:x) xexp 2};
		ed:{[f0;x]edf[f0;raze x]}[f0;]each fgg;
		tmp:flip ed;
		kmc::((min each tmp)=tmp;fgg);
		gg:((kmc 1) raze key g)!value g:group where each kmc 0;
		fgg::avg each f0 value gg;
		d:sum over (key gg)-fgg;
		show d;
		:d };
		f0::get `:f0;
		kmc::i[.k.f0;c;n];
		gg:((kmc 1) raze key g)!value g:group where each kmc 0;
		fgg::avg each f0 value gg;
		d:sum over (f0 @ raze key gg)-fgg;
		show d;
		t/[d]}

d:kmpp[27352;5];


