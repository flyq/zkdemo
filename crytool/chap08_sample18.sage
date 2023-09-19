print("\n# CHAP08 -- Script-SAMPLE 18: =========")

n15 = 2**15 - 1; print("n15 =", n15, "=", n15.factor())
n16 = 2**16 - 1; print("n16 =", n16, "=", n16.factor())
n17 = 2**17 - 1; print("n17 =", n17, "=", n17.factor())
print("lcm    =", lcm([n15,n16,n17]))
period = n15 * n16 * n17; print("period =", period)

#------------------------------------
# CHAP08 -- Script-SAMPLE 18: =========
# n15 = 32767 = 7 * 31 * 151
# n16 = 65535 = 3 * 5 * 17 * 257
# n17 = 131071 = 131071
# lcm    = 281459944554495
# period = 281459944554495

