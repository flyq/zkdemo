print("\n# CHAP08 -- Script-SAMPLE 24: =========")

load("./bitciphers.sage")
load("./chap08_sample21_without-prints.sage") # outlist = Geffe sequence

clist = [] # List the coincidences for each test run in order
histogr = [0] * (nofBits + 1) # How often does a certain number of
                              # coincidences occur during the total
                              # number of test runs? The number of
                              # coincidences lies between 0 (no
                              # coincidence) and nofBits (all bits
                              # coincide). histogr[i] = h means that
                              # exactly h test runs yielded i
                              # coincidences. We expect the histogram
                              # to be symmetric around nofBits/2.
for i in range(0,2**15): # run LFSR with all possible initial states
    start = int2bbl(i,15) # Initialize the register with the bitblock
                          #   corresponding to the integer index i
    reg15.setState(start)
    testlist = reg15.nextBits(nofBits)
    c = coinc(outlist,testlist)
    histogr[c] += 1 # Keep in mind that the number of coincidences was c
    clist.append(c)
print("clist (len=%d):" % (len(clist)))   # temporary output
print(clist[0:10], "...",  clist[13700:13710], "...",  clist[-10:])
print("histogr (len=%d):\n%s"% (len(histogr), histogr))

mm = max(clist)
print("Maximum value in clist = mm =", mm)
start = 0    # Search for all occurences of the maximum
while mm in clist[start:]:   # There is another occurence of mm?
  ix = clist.index(mm,start) # Then find the corresponding index
  block = int2bbl(ix,15)     # block is the bitblock corresponding
                             # to the integer index ix.
  print("... at index", ix, "\n    corresponding to start value:", block)
  start = ix+1

#------------------------------------
# CHAP08 -- Script-SAMPLE 24: =========
# clist (len=32768):
# [54, 47, 53, 52, 43, 44, 44, 55, 55, 58] ... 
# [44, 49, 55, 54, 50, 73, 55, 44, 49, 48] ... 
# [52, 47, 55, 54, 48, 49, 44, 63, 47, 48]
# histogr (len=101):
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12, 12, 37, 78, 116, 216,
#  329, 472, 722, 1003, 1369, 1746, 1976, 2266, 2472, 2531, 2600,
#  2483, 2355, 2149, 1836, 1574, 1218, 928, 726, 521, 343, 228,
#  164, 102, 60, 47, 36, 13, 8, 7, 4, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0,
#  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
# Maximum value in clist = mm = 73
# ... at index 13705 
#     corresponding to start value: [0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1]
# ... at index 31115 
#     corresponding to start value: [1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1]
