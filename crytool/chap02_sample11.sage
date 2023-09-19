print("\n# CHAP02--SAMPLE 11: =========")

# construct Vigenere cipher
keylen = 14
A = AlphabeticStrings()
V = VigenereCryptosystem(A, keylen)

# Here, a random key of length keylen is generated.
# Alternatively, a key could be given explicitly like key = A('ABCDEFGHIJKLMN')
key = V.random_key(); print("key: ", key, "  keylen: ", len(key), sep="")

P = "The Vigenere cipher is polyalphabetic."; print("P:  ", P, "  Plen:", len(P))
msg = V.encoding(P); print("msg:", msg, "  msglen:", len(msg))

C   = V.enciphering(key, msg); print("C:  ", C, "  Clen:  ", len(C))

DC  = V.deciphering(key, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 11: =========
# key: OHZZMJTRCFOWKN  keylen: 14
# P:   The Vigenere cipher is polyalphabetic.   Plen: 38
# msg: THEVIGENERECIPHERISPOLYALPHABETIC   msglen: 33
# C:   HODUUPXEGWSYSCVLQHEYHCAFZLRNPLSHO   Clen:   33
# DC:  THEVIGENERECIPHERISPOLYALPHABETIC
# msg == DC: True
