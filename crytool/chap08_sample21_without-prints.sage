reg15 = LFSR([1,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
reg15.setState([0,1,1,0,1,0,1,1,0,0,0,1,0,0,1])

reg16 = LFSR([0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,1])
reg16.setState([0,1,1,0,1,0,1,1,0,0,0,1,0,0,1,1])

reg17 = LFSR([0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
reg17.setState([0,1,1,0,1,0,1,1,0,0,0,1,0,0,1,1,1])

nofBits = 100
outlist15 = reg15.nextBits(nofBits)
outlist16 = reg16.nextBits(nofBits)
outlist17 = reg17.nextBits(nofBits)

geff = BoolF(str2bbl ("00011100"),method="ANF")

outlist = []
for i in range(0,nofBits):
    x = [outlist15[i], outlist16[i], outlist17[i]]
    outlist.append(geff.valueAt(x))
