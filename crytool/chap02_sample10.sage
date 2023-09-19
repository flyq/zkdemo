print("\n# CHAP02--SAMPLE 10: =========")

key = a, b = (1, 3); print("affine key: ", key, sep="")

# construct a shift cipher using an affine cipher with a=1
AS  = AffineCryptosystem(AlphabeticStrings())
msg = AS.encoding("Shift the alphabet by three positions to the right."); print("msg:", msg, "       msglen:", len(msg))

# shift the plaintext to get the ciphertext
C = AS.enciphering(a, b, msg); print("C:  ", C)

# decrypt the ciphertext and ensure that it is the original plaintext
DC = AS.deciphering(a, b, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 10: =========
# affine key: (1, 3)
# msg: SHIFTTHEALPHABETBYTHREEPOSITIONSTOTHERIGHT        msglen: 42
# C:   VKLIWWKHDOSKDEHWEBWKUHHSRVLWLRQVWRWKHULJKW
# DC:  SHIFTTHEALPHABETBYTHREEPOSITIONSTOTHERIGHT
# msg == DC: True
