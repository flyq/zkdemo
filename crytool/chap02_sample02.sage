print("\n# CHAP02--SAMPLE 02: =========")

# transposition cipher using a block length of 14, code more flexible
blocklen = keylen = 14; shift = 2
A = AlphabeticStrings()
T = TranspositionCryptosystem(A, blocklen)

# encryption key
# key = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1, 2]
key = [(i+shift).mod(keylen) + 1 for i in range(keylen)]; print("key:    ", key, "  keylen: ", len(key), sep="")

# construct the plaintext from the first 14 letters of the alphabet plus blanks
# P = "A B C D E F G H I J K L M N"
print("A.gens():\n", A.gens(), sep="")
P=''
for i in range(keylen): P = P + " " + str(A.gen(i))
print("P:  ", P)

# encode plaintext (get rid of non-alphabet chars)
msg = T.encoding(P); print("msg: ", msg)

# encrypt plaintext by shifting to the left by 2 letters (do it in one step)
C   = T.enciphering(key, msg); print("C:   ", C)

# decryption key [shifting to the left by 12 letters (= 2 to the right)]
# keyInv = [13, 14, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
shiftInv=keylen-shift;
keyInv = [(i+shiftInv).mod(keylen) + 1 for i in range(keylen)]; print("keyInv: ", keyInv, sep="")

# decrypt by using keyInv and enciphering
DC   = T.enciphering(keyInv, C); print("1-DC:", DC)

# decrypt by using the "deciphering method with key" (without the need to calculate keyInv)
# Remark: Strangely, using the deciphering method requires to change the type of the variable key
#         The following does not work: DC  = T.deciphering(key, C); print("2-DC:", DC)
DC  = T.deciphering(T(key).key(), C); print("2-DC:", DC)

# Remarks about different representations of key and its inverse key
print("\n---Remark 1: TranspositionCryptosystem describing itself and the used cyclic groups")
print("T:", T)
print("T(key).key():   ", T(key).key())
print("T.inverse_key():", T.inverse_key(T(key).key()))
print("T(keyInv).key():", T(keyInv).key())

#------------------------------------
# CHAP02--SAMPLE 02: =========
# key:    [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1, 2]  keylen: 14
# A.gens():
# (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z)
# P:    A B C D E F G H I J K L M N
# msg:  ABCDEFGHIJKLMN
# C:    CDEFGHIJKLMNAB
# keyInv: [13, 14, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
# 1-DC: ABCDEFGHIJKLMN
# 2-DC: ABCDEFGHIJKLMN
# 
# ---Remark 1: TranspositionCryptosystem describing itself and the used cyclic groups
# T: Transposition cryptosystem on Free alphabetic string monoid on A-Z of block length 14
# T(key).key():    (1,3,5,7,9,11,13)(2,4,6,8,10,12,14)
# T.inverse_key(): (1,13,11,9,7,5,3)(2,14,12,10,8,6,4)
# T(keyInv).key(): (1,13,11,9,7,5,3)(2,14,12,10,8,6,4)
