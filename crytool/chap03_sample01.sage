print("\n# CHAP03 -- Script-SAMPLE 01: =========")

for p in (2,3,5,7):
    Mp=2^p-1
    MMp=2^Mp-1
    B=is_prime(MMp)
    print(p,Mp,MMp,B);

#------------------------------------
# CHAP03 -- Script-SAMPLE 01: =========
# 2 3 7 True
# 3 7 127 True
# 5 31 2147483647 True
# 7 127 170141183460469231731687303715884105727 True

