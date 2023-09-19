print("\n# CHAP08 -- Script-SAMPLE 12: =========")

load("./bitciphers.sage")

key = str2bbl("1001011000101110")
bit = [0,0,0,0]
bit[0] = (key[0]+key[1]+key[5]+key[6]+key[11]+key[12]+key[13]) % 2
bit[1] = (key[0]+key[1]+key[4]+key[5]+key[6]+key[11]+key[12]+key[13])%2
bit[2] = (key[1]+key[3]+key[11]) % 2
bit[3] = (key[2]+key[11]) % 2
NN = 25
plist = randsel(255,NN)
klist = [[], [], [], []]

print("25 random pairs of plaintexts and ciphertexts")
for i in range (0,NN):
    plain = int2bbl(plist[i],8)
    ciph = miniLuc(plain,key,2)
    print("pc pair no %2d is %s %s" % (i+1, plain, ciph))
    kbit = (plain[3]+ciph[0]+ciph[1]+ciph[3]+ciph[5]+ciph[6]) % 2
    klist[0].append(kbit)
    kbit = (1+plain[3]+ciph[0]+ciph[1]+ciph[3]+ciph[4]+ciph[5]+ciph[6])%2
    klist[1].append(kbit)
    kbit = (1+plain[0]+ciph[0]+ciph[1]+ciph[3]) % 2
    klist[2].append(kbit)
    kbit=(1+plain[0]+plain[1]+plain[2]+plain[3]+ciph[0]+ciph[1]+ciph[3])%2
    klist[3].append(kbit)

print("Linear cryptanalysis of Mini-Lucifer over 2 rounds")
for j in range(0,4):
    sum = 0
    for jj in range(0,NN):
        sum += klist[j][jj]
    if (bit[j] == 0):
        sum = NN - sum
    print("True bit:", bit[j], klist[j])
    print("    Relation", j+1, ":", sum, "of", NN ,"guesses are correct.")

#------------------------------------
# CHAP08 -- Script-SAMPLE 12: =========
# 25 random pairs of plaintexts and ciphertexts
# pc pair no  1 is [0, 0, 0, 0, 1, 0, 0, 0] [1, 0, 1, 1, 0, 1, 1, 1]
# pc pair no  2 is [0, 0, 0, 0, 1, 1, 0, 1] [1, 0, 1, 1, 1, 1, 0, 0]
# ...
# pc pair no 24 is [1, 1, 1, 0, 0, 1, 1, 0] [0, 0, 1, 0, 1, 0, 0, 1]
# pc pair no 25 is [1, 1, 1, 1, 0, 0, 1, 0] [1, 0, 0, 0, 1, 1, 0, 1]
# Linear cryptanalysis of Mini-Lucifer over 2 rounds
# True bit: 1 [0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1]
#     Relation 1 : 17 of 25 guesses are correct.
# True bit: 1 [1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1]
#     Relation 2 : 18 of 25 guesses are correct.
# True bit: 1 [1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1]
#     Relation 3 : 19 of 25 guesses are correct.
# True bit: 0 [1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0]
#     Relation 4 : 18 of 25 guesses are correct.
