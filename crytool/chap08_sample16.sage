print("\n# CHAP08 -- Script-SAMPLE 16: =========")

l = 16
kbits = [1,1,0,0,1,0,0,0,1,1,0,1,0,1,1,0,0,0,1,1,0,0,1,1,1,1,0,0,0,0,0,0]
ulist = []
for i in range(0,l):
  state = kbits[i:(l+i)]
  ulist.append(state)
U = matrix(GF(2),ulist)
print("det(U) =", det(U))
W = U.inverse()
vlist = []
for i in range(1,l+1):
  state = kbits[i:(l+i)]
  vlist.append(state)
V = matrix(GF(2),vlist)
S = V*W
print(S)

#------------------------------------
# CHAP08 -- Script-SAMPLE 16: =========
# det(U) = 1
# [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
# ...
# [1 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0]
 
