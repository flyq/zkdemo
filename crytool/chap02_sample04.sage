print("\n# CHAP02--SAMPLE 04: =========")

blocklen = keylen = 14
A = AlphabeticStrings()
T = TranspositionCryptosystem(A, blocklen);

# key_space() delivers generic info; order() of keyspace delivers the number of keys
print("T.key_space():", T.key_space())
print("T.key_space().order():", T.key_space().order())
print('                       {0:.2e}'.format( T.key_space().order() ))

P = "a b c d e f g h i j k l m n o p q r s t u v w x y z a b"
msg = T.encoding(P); print("msg:", msg)
key = T.random_key(); print("key: ", key)
Pkey = Permutation(key); print("Pkey:", Pkey, "Pkeylen:", len(Pkey))

# enciphering in one and in two steps
C   = T.enciphering(key, msg); print("1-C: ", C)

E = T(key)
C = E(msg); print("2-C: ", C)

# deciphering
DC  = T.deciphering(key, C); print("DC: ", DC)

# Just another way of decryption: Using "enciphering" with the inverse key
keyInv = T.inverse_key(key); print("keyInv: ", keyInv)
PkeyInv = Permutation(keyInv); print("PkeyInv:", PkeyInv, "PkeyInvlen:", len(PkeyInv))
DDC    = T.enciphering(keyInv, C)

# Test correctness of both ways of decryption
print("msg == DC == DDC:", msg == DC == DDC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 04: =========
# T.key_space(): Symmetric group of order 14! as a permutation group
# T.key_space().order(): 87178291200
#                        8.72e+10
# msg: ABCDEFGHIJKLMNOPQRSTUVWXYZAB
# key:  (1,6)(2,3,9,8,10,14,13)(4,12)
# Pkey: [6, 3, 9, 12, 5, 1, 7, 10, 8, 14, 11, 4, 2, 13] Pkeylen: 14
# 1-C:  FCILEAGJHNKDBMTQWZSOUXVBYRPA
# 2-C:  FCILEAGJHNKDBMTQWZSOUXVBYRPA
# DC:  ABCDEFGHIJKLMNOPQRSTUVWXYZAB
# keyInv:  (1,6)(2,13,14,10,8,9,3)(4,12)
# PkeyInv: [6, 13, 2, 12, 5, 1, 7, 9, 3, 8, 11, 4, 14, 10] PkeyInvlen: 14
# msg == DC == DDC: True
