print("\n# CHAP08 -- Script-SAMPLE 08: =========")

load("./bitciphers.sage")

lProf = S0.linProf(extended=True)
print("lProf[0]:\n", lProf[0], sep="")

print("Maximum entry:", lProf[1], "| with denominator:", lProf[2])
print("at indices:", lProf[3])

Spec = S0.wspec()
for coord in lProf[3]:
    if (Spec[coord[0]][coord[1]] < 0):
        print ("For relation at", coord, "take complement.")

#------------------------------------
# CHAP08 -- Script-SAMPLE 08: =========
# lProf[0]:
# [[256,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0, 0,  0,   0,  0,  0],
#  [  0, 16, 16, 0,  0, 16, 16,  0,  0, 16, 16, 0,  0, 144, 16,  0],
#  ...,
#  [  0,  0,  0, 0, 16, 16, 16, 16, 64,  0, 64, 0, 16,  16, 16, 16]]
# Maximum entry: 144 | with denominator: 256
# at indices: [[1, 13], [6, 11], [7, 6]]
# For relation at [6, 11] take complement.
# For relation at [7, 6] take complement.
