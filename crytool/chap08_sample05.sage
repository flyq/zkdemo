print("\n# CHAP08 -- Script-SAMPLE 05: =========")

load("./bitciphers.sage")
f1 = BoolF([1,1,0,1,1,1,1,0,0,0,0,0,1,0,0,1])
f2 = BoolF([1,1,1,0,1,1,0,0,0,1,0,0,0,1,1,0])
f3 = BoolF([0,1,1,1,1,0,1,0,1,1,1,0,0,0,0,0])
f4 = BoolF([0,1,1,0,0,1,1,0,0,0,1,1,1,0,1,0])
S0 = BoolMap([f1,f2,f3,f4])
# Sample evaluation
print(S0.valueAt([0,0,1,0]))

#------------------------------------
# CHAP08 -- Script-SAMPLE 05: =========
# [0, 1, 1, 1]
