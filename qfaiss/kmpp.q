kmpp:{[c;n]
	shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]};
	f0:"f"$get `:f0;
	sqr:{x xexp 2};
	while[n-:1;
		cc:count c;
		show cc;
		ct:f0 $[cc>1;distinct;] c;
		$[1=cc;
			[ ed:raze sum each sqr ct-/:f0; ed:ed where not 0=raze ed; c:c,where (max ed)=ed; show count ed ];
			[ ed:sum each 'sqr ct-/:\:f0; ed:ed@'where each not 0=ed; 
				c:raze c,nc where first enlist (max p)=p:d%sum d:ed@/:'nc:raze where each (min each ed)=ed;show count ed;
				/d:ed@/:'nc;
				/show d;
				/p:d%sum d;
				/show p;
				/show where (max p)=p;
				/c:raze c,last nc where (max p)=p;
				]			
			];
				show distinct c;
			]
		}


