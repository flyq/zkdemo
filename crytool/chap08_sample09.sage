print("\n# CHAP08 -- Script-SAMPLE 09: =========")

load("./bitciphers.sage")
g1 = BoolF([0,0,1,1,0,1,0,0,1,1,0,1,0,1,1,0])
g2 = BoolF([1,0,1,0,0,0,0,1,1,1,0,0,1,1,0,1])
g3 = BoolF([1,1,1,0,1,1,0,0,0,0,0,1,1,1,0,0])
g4 = BoolF([1,0,0,1,1,1,0,0,0,1,1,0,0,1,0,1])
S1 = BoolMap([g1,g2,g3,g4])
print("BoolF print(g1.getTT()):"); print(g1.getTT())
print("\nBoolF g1.printTT():"); g1.printTT()
print("\nBoolF g1.printANF():"); g1.printANF()
print("\nBoolMap S1.printTT():"); S1.printTT()

#------------------------------------
# CHAP08 -- Script-SAMPLE 09: =========
# BoolF g1.getTT():
# [0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0]
# 
# BoolF g1.printTT():
# Value at 0000 is 0
# Value at 0001 is 0
# ...
# 
# BoolF g1.printANF():
# Coefficient at 0000 is 0
# Coefficient at 0001 is 0
# ...
# 
# BoolMap S1.printTT():
# Dimensions of truth table: 16 by 4
# Value at [0, 0, 0, 0] is [0, 1, 1, 1]
# Value at [0, 0, 0, 1] is [0, 0, 1, 0]
# ...
# Value at [1, 1, 1, 0] is [1, 0, 0, 0]
# Value at [1, 1, 1, 1] is [0, 1, 0, 1]
