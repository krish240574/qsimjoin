kmpp:{[c;n]
	shp:{[a]$[99h=(type a);`99h;];$[0<=type a;(count a),shp a 0;""]};
	f0:"f"$get `:f0;
	sqr:{x xexp 2};
	nc:c;
	do[n;
		cc:count c;
		ct:raze f0 nc;
		$[1=cc;
					 [ ed:raze sum each sqr ct-/:f0; c:c,where (max ed)=ed;show nc:last c];
					 [ ed:ed,'raze sum each sqr ct-/:f0; $[cc<n;c:c,nc:where (max k)=k:min each ed;];]
		 ];
		];
		show km:(min each ed)=ed;
		show c;
		}
