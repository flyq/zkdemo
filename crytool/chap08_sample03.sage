print("\n# CHAP08 -- Script-SAMPLE 03: =========")

load("./bitciphers.sage")
bits = "00000111"
x = str2bbl(bits)
print("x :", x)
f = BoolF(x)
y = f.getTT()
print("y :", y)
z = f.getANF()
print("z :", z)

#------------------------------------
# CHAP08 -- Script-SAMPLE 03: =========
# x : [0, 0, 0, 0, 0, 1, 1, 1]
# y : [0, 0, 0, 0, 0, 1, 1, 1]
# z : [0, 0, 0, 0, 0, 1, 1, 1]
