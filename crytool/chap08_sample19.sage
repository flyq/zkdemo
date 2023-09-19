print("\n# CHAP08 -- Script-SAMPLE 19: =========")

load("./bitciphers.sage")

reg15 = LFSR([1,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
reg15.setState([0,1,1,0,1,0,1,1,0,0,0,1,0,0,1])
print(reg15)
reg16 = LFSR([0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,1])
reg16.setState([0,1,1,0,1,0,1,1,0,0,0,1,0,0,1,1])
print(reg16)
reg17 = LFSR([0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
reg17.setState([0,1,1,0,1,0,1,1,0,0,0,1,0,0,1,1,1])
print(reg17)

#------------------------------------
# CHAP08 -- Script-SAMPLE 19: =========
# Length: 15 | Taps: 100000000000001 | State: 011010110001001
# Length: 16 | Taps: 0110100000000001 | State: 0110101100010011
# Length: 17 | Taps: 00100000000000001 | State: 01101011000100111
