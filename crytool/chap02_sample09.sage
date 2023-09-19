print("\n# CHAP02--SAMPLE 09: =========")

key = a, b = (3, 13); print("affine key: ", key, sep="")

# create an affine cipher
AS  = AffineCryptosystem(AlphabeticStrings()); print(AS)
msg = AS.encoding("The affine cryptosystem."); print("msg:", msg, "       msglen:", len(msg))

# encrypt the plaintext using the affine key
C = AS.enciphering(a, b, msg); print("C:  ", C)

# decrypt the ciphertext and make sure that it is equivalent to the original plaintext
DC = AS.deciphering(a, b, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 09 =========
# affine key: (3, 13)
# Affine cryptosystem on Free alphabetic string monoid on A-Z
# msg: THEAFFINECRYPTOSYSTEM        msglen: 21
# C:   SIZNCCLAZTMHGSDPHPSZX
# DC:  THEAFFINECRYPTOSYSTEM
# msg == DC: True
