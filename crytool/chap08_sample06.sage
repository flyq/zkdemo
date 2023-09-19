print("\n# CHAP08 -- Script-SAMPLE 06: =========")

load("./bitciphers.sage")
k = [1,0,0,0]
alpha = [0,0,0,1]
beta = [1,1,0,1]
plist = [[0,0,1,0],[0,1,0,1],[1,0,1,0]]
xlist = []; xclist = []; pclist = []
for i in range(0,len(plist)):
    x = xor(plist[i],k)
    xlist.append(x)
print(xlist)
for i in range(0,len(plist)):
    val = S0.valueAt(xlist[i])
    xclist.append([xlist[i],val])
    pclist.append([plist[i],val])
print(Matsui_Test(alpha,beta,pclist,False))

#------------------------------------
# CHAP08 -- Script-SAMPLE 06: =========
[[1, 0, 1, 0], [1, 1, 0, 1], [0, 0, 1, 0]]
[2, 0, True]

