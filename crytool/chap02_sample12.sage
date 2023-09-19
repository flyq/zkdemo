print("\n# CHAP02--SAMPLE 12: =========")

keylen = 3   # Alternative key length: keylen=13 --- ensure msg length is a multiple of keylen
A = AlphabeticStrings()
H = HillCryptosystem(A, keylen)

# Alternative 1: Non-random key creation (needs HKS; even H.key_space() is not enough)
HKS = H.key_space()
key = HKS([[1,0,1],[0,1,1],[2,2,3]]); print("key: \n", key, sep="")

# Alternative 2: Random key creation
# key = H.random_key(); print("key: \n", key, sep="")

# the key object has no method len(), but block_length()
print("block_length(): ", H.block_length(), "    key.det(): ", key.det(), sep="")

# encoding (Length of msg is a multiple of matrix dimension (block_length))
P = "HHill or matrix cipher uses matrix operations."
print("P:  ", P, "  Plen:", len(P))
msg = H.encoding(P); print("msg:", msg, "  msglen:", len(msg))

# encryption
C  = H.enciphering(key, msg); print("C:  ", C, "  Clen:  ", len(C))

# decryption
DC  = H.deciphering(key, C); print("DC: ", DC)
print("msg == DC:", msg == DC)  # Expect True

# alternative way to decrypt using inverse matrix
keyInv = key.inverse(); keyInv
keyInv = H.inverse_key(key); print("\nkeyInv: \n", keyInv, sep="")
DC     = H.enciphering(keyInv, C); print("DC: ", DC)
print("msg == DC:", msg == DC)  # Expect True

print("\n---Remark: Output C as a sequence of ASCII characters and their according numbers")
# print("type(C):", type(C)) # 'sage.monoids.string_monoid_element.StringMonoidElement'
# 'StringMonoidElement' object has no attribute to directly convert to integer sequence 
from sage.crypto.util import ascii_to_bin, ascii_integer
# print("a_to_b: ", ascii_to_bin(str(C)))
print("C[i]:", [C[i] for i in range(len(C))])
print("binary C[i]:", [ascii_to_bin(str(C[i])) for i in range(len(C))])
print("integer C[i]:", [ascii_integer(ascii_to_bin(str(C[i]))) for i in range(len(C))])

#------------------------------------
# CHAP02--SAMPLE 12: ========= 
# key: 
# [1 0 1]
# [0 1 1]
# [2 2 3]
# block_length(): 3    key.det(): 25
# P:   HHill or matrix cipher uses matrix operations.   Plen: 46
# msg: HHILLORMATRIXCIPHERUSESMATRIXOPERATIONS   msglen: 39
# C:   XXMNNMRMDJHINSXXPIBENCQGIBSKZVXMSQJRYXD   Clen:   39
# DC:  HHILLORMATRIXCIPHERUSESMATRIXOPERATIONS
# msg == DC: True
# 
# keyInv: 
# [25 24  1]
# [24 25  1]
# [ 2  2 25]
# DC:  HHILLORMATRIXCIPHERUSESMATRIXOPERATIONS
# msg == DC: True
# 
# ---Remark: Output C as a sequence of ASCII characters and their according numbers
# C[i]: [X, X, M, N, N, M, R, M, D, J, H, I, N, S, X, X, P, I, B, E, N, C, Q, G, I, B, S, K, Z, V, X, M, S, Q, J, R, Y, X, D]
# binary C[i]: [01011000, 01011000, 01001101, 01001110, 01001110, 01001101, 01010010, 01001101, 01000100, 01001010, 01001000, 01001001, 01001110, 01010011, 01011000, 01011000, 01010000, 01001001, 01000010, 01000101, 01001110, 01000011, 01010001, 01000111, 01001001, 01000010, 01010011, 01001011, 01011010, 01010110, 01011000, 01001101, 01010011, 01010001, 01001010, 01010010, 01011001, 01011000, 01000100]
# integer C[i]: [88, 88, 77, 78, 78, 77, 82, 77, 68, 74, 72, 73, 78, 83, 88, 88, 80, 73, 66, 69, 78, 67, 81, 71, 73, 66, 83, 75, 90, 86, 88, 77, 83, 81, 74, 82, 89, 88, 68]

