import numpy as np

def sf(f,s,d,n,dt,ofs,l):
  r = []
  c = int(l/n)
  for i in range(n):
    k = np.memmap(f, dtype=dt, mode="r", shape=(1,c), offset=(ofs+i*c*int(s/8)))
    r.append(k.reshape(-1,d+1)[:,1:])
    del k
  return r



