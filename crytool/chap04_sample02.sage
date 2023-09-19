print("\n# CHAP04 -- Script-SAMPLE 02: =========")

print("Get the secret key of Alice:---")
print("a) via normal integer numbers")
print(" A:", discrete_log(mod(49,347),mod(11,347)))

print("b) via the ring of integers (better)")
R=Integers(347)
g=R(11)
A=R(49)
print(" A:", discrete_log(A,g))

print("Get the secret key of Bob:---")
B=R(285)
print(" B:", discrete_log(B,g))

#------------------------------------
# CHAP04 -- Script-SAMPLE 02: =========
# Get the secret key of Alice:---
# a) via normal integer numbers
#  A: 67
# b) via the ring of integers (better)
#  A: 67
# Get the secret key of Bob:---
#  B: 39
