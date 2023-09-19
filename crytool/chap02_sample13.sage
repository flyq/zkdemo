print("\n# CHAP02--SAMPLE 13: =========")

A = HexadecimalStrings()
S = SubstitutionCryptosystem(A)

key = S.random_key(); print("key: ", key, "  keylen: ", len(key), sep="")
print("Number of possible keys: ", len(key), "! = ", factorial(len(key)), sep="")

P   = "Working with a larger alphabet."; print("P:  ", P, "  Plen:", len(P))
msg = A.encoding(P); print("msg:", msg, "  msglen:", len(msg))

C   = S.enciphering(key, msg); print("C:  ", C, "  Clen:  ", len(C))
DC  = S.deciphering(key, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

# Conversion hex in DC back to ASCII:
DDC = DC.decoding(); # print("DDC:", DDC)
print("P == DDC:", P == DDC)  # Expect True

## Remark: Other ways for the decoding transformation using sage.crypto.util
# - AlphabeticStrings() and HexadecimalStrings() don't have an according method.
# - http://doc.sagemath.org/html/en/reference/cryptography/sage/crypto/util.html
# from sage.crypto.util import ascii_integer
# print("ascii_integer: ", ascii_integer("01000100"))
# from sage.crypto.util import bin_to_ascii
# print("bin_to_ascii:", bin_to_ascii("01000100"))
#
## Remark: Alternative conversion hex back to ASCII, using native Python
# import binascii
# DDC = binascii.a2b_hex(repr(DC));

#------------------------------------
# CHAP02--SAMPLE 13: ========= 
# key: c7834de0f1a65b29  keylen: 16
# Number of possible keys: 16! = 20922789888000
# P:   Working with a larger alphabet.   Plen: 31
# msg: 576f726b696e6720776974682061206c617267657220616c7068616265742e   msglen: 62
# C:   d0e908e6e1e2e08c00e104ef8ce78ce5e708e0ed088ce7e50cefe7e8ed0482   Clen:   62
# DC:  576f726b696e6720776974682061206c617267657220616c7068616265742e
# msg == DC: True
# P == DDC: True
