d:(5000,5000)#100000?100000f

q)c1:hopen`::5042
q)c2:hopen `::5043
q)c3:hopen `::5044
q)c4:hopen `::5045
q)shp r11:c1 ({x$\:/:y};d til n;d til n)
q)shp r12:c2 ({x$\:/:y};d til n;d n+til n)
q)shp r21:c3 ({x$\:/:y};d n+til n;d til n)
q)shp r22:c4 ({x$\:/:y};d n+til n;d n+til n)
/ horiz first then vert
q)shp (r11,'r21),(r12,'r22)


/ 4 workers, 4 slices
q)dd:(`1`2`3`4)!d (4,13)#til 52
q)dd$\:/:/:dd key dd
/ send to one worker
q){dd[x]$\:/:/:dd key dd}`1
q){dd[x]$\:/:/:dd key dd}each key dd
q)S:(key dd)!{dd[x]$\:/:/:dd key dd}each key dd
q)f:{z[x]({y[x]$\:/:/:y key y};x;dd;sa)}each key dd


/ large array, 4 workers, 4 slices
q)d:(5200,5200)#100000?100000f
q)dd:(`1`2`3`4)!d (4,1300)#til 5200
q)f:{[sa;x]sa[x]({y[x]$\:/:/:y key y};x;dd)}[sa;]each key dd
