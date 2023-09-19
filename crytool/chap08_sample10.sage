print("\n# CHAP08 -- Script-SAMPLE 10: =========")

load("./bitciphers.sage")
n = 4
alpha = [0,0,0,1]; beta = [1,1,0,1]; gamma = [1,1,0,0]
k0 = [1,0,0,0]; k1 = [0,0,0,1]; k2 = [0,1,1,0]
for i in range(0,2**n):
    a = int2bbl(i,n); b0 = xor(a,k0); a1 = S0.valueAt(b0)
    b1 = xor(k1,a1); a2 = S1.valueAt(b1); c = xor(a2,k2)
    bit1 = binScPr(beta,b1); bit2 = binScPr(gamma,a2)
    bit3 = (binScPr(alpha,a) + binScPr(gamma,c)) % 2
    print(a, b0, a1, b1, a2, c, bit1, bit2, bit3)

#------------------------------------
# CHAP08 -- Script-SAMPLE 10: =========
# [0, 0, 0, 0] [1, 0, 0, 0] [0, 0, 1, 0] [0, 0, 1, 1] [1, 0, 0, 1] [1, 1, 1, 1] 1 1 0
# ...
# [1, 1, 1, 1] [0, 1, 1, 1] [0, 0, 0, 0] [0, 0, 0, 1] [0, 0, 1, 0] [0, 1, 0, 0] 1 0 0
