print("\n# CHAP02--SAMPLE 01: =========")

# transposition cipher using a block length of 14 and upper-case alphabet
blocklen = keylen = 14; shift = 2
T = TranspositionCryptosystem(AlphabeticStrings(), blocklen)

# create encryption key (shifts each letter in the block by 2 positions to the right)
# key = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1, 2]
key = [(i+shift).mod(keylen) + 1 for i in range(keylen)]; print("key:  ", key, "  keylen: ", len(key), sep="")

# given plaintext
P   = "a b c d e f g h i j k l m n"; print("P:   ", P)

# encode plaintext (get rid of non-alphabet chars, convert lower-case into upper-case)
msg = T.encoding(P); print("msg: ", msg)

# encrypt plaintext message
C   = T.enciphering(key, msg); print("C:   ", C)

# decrypt using built-in deciphering method. Requires to change type of key
DC  = T.deciphering(T(key).key(), C); print("DC:  ", DC)

# Test correctness of decryption
print("msg == DC:", msg == DC)

#------------------------------------
# CHAP02--SAMPLE 01: =========
# key:  [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1, 2]  keylen: 14
# P:    a b c d e f g h i j k l m n
# msg:  ABCDEFGHIJKLMN
# C:    CDEFGHIJKLMNAB
# DC:   ABCDEFGHIJKLMN
# msg == DC: True
