print("\n# CHAP02--SAMPLE 05: =========")

keylen = 14
T = TranspositionCryptosystem(AlphabeticStrings(), keylen)
key = T.random_key(); print("key: ", key, "  keylen: ", keylen, sep="")

# P = "ABCDEFGHIJUUUU"  # plaintext
P = "The cat in the hat.--The cat in the hat."  # plaintext
print("P:  ", P, "   Plen:", len(P))

# Encoding takes only letters from the alphabet (and potentially converts it to uppercase).
msg = T.encoding(P); print("msg:", msg, "       msglen:", len(msg))

# Ensure that the length of msg is a multiple of keylen
if (len(msg) % keylen != 0): print("Error: msg length isn't a multiple of blocklength. len(msg) =", len(msg))
assert len(msg) % keylen == 0

# Enciphering only works, if the number of symbols in msg is a multiple of keylen
C  = T.enciphering(key, msg); print("C:  ", C)

# Decryption using method deciphering
DC = T.deciphering(key, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 05: =========
# key: (1,14,3,12,8,5,13,10,4)(2,9,11,7,6)  keylen: 14
# P:   The cat in the hat.--The cat in the hat.    Plen: 40
# msg: THECATINTHEHATTHECATINTHEHAT        msglen: 28
# C:   TTHTAHTAECINHETTHTAHTAECINHE
# DC:  THECATINTHEHATTHECATINTHEHAT
# msg == DC: True
