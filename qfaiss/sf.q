\l SplitFile.p
sf:.p.get[`sf;>]
k:.p.wrap sf[`sift_base.fvecs;32;128;10;"float32";ofs;l]
{(`$":f",string x) set k[@;x]`}each til 10


