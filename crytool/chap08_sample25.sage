print("\n# CHAP08 -- Script-SAMPLE 25: =========")

load("./bitciphers.sage")
load("./chap08_sample21_without-prints.sage")

clist = []
histogr = [0] * (nofBits + 1)
for i in range(0,2**16):
    start = int2bbl(i,16)
    reg16.setState(start)
    testlist = reg16.nextBits(nofBits)
    c = coinc(outlist,testlist)
    histogr[c] += 1
    clist.append(c)
print("clist (len=%d):" % (len(clist)))   # temporary output
print(clist[0:10], "...",  clist[27406:27416], "...",  clist[-10:])
print("histogr (len=%d):\n%s"% (len(histogr), histogr))

mm = max(clist)
print("Maximum value in clist = mm =", mm)
start = 0
while mm in clist[start:]:
  ix = clist.index(mm,start)
  block = int2bbl(ix,15)
  print("... at index", ix, "\n    corresponding to start value:", block)
  start = ix+1

#------------------------------------
# CHAP08 -- Script-SAMPLE 25: =========
# clist (len=65536):
# [54, 50, 48, 56, 44, 56, 58, 58, 44, 62] ... 
# [49, 57, 58, 48, 50, 76, 48, 54, 56, 50] ... 
# [47, 47, 39, 49, 43, 49, 59, 45, 51, 41]
# histogr (len=101):
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#  0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 3, 4, 8, 17, 25, 51, 92, 171,
#  309, 477, 750, 1014, 1423, 1977, 2578, 3174, 3721, 4452, 4821,
#  5061, 5215, 5074, 4882, 4344, 3797, 3228, 2602, 1974, 1419,
#  1054, 669, 434, 306, 174, 99, 62, 38, 19, 10, 3, 0, 1, 0, 0,
#  0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#  0, 0, 0, 0, 0, 0, 0]
# Maximum value in clist = mm = 76
# ... at index 27411 
#     corresponding to start value: [1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1]

