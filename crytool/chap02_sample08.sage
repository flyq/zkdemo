print("\n# CHAP02--SAMPLE 08: =========")

key = 3 # shift can be any integer number. Ancient Caesar used 3.
print("shift key: ", key, sep="")

# Caesar cipher using the Shift cipher instead of the more general Substitution cipher
S   = ShiftCryptosystem(AlphabeticStrings()); print(S)
msg = S.encoding("Shift me any number of positions."); print("msg:", msg, "       msglen:", len(msg))

# shift the plaintext
C = S.enciphering(key, msg); print("C:  ", C)

# decrypt the ciphertext and ensure that it is the original plaintext
DC = S.deciphering(key, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 08: =========
# shift key: 3
# Shift cryptosystem on Free alphabetic string monoid on A-Z
# msg: SHIFTMEANYNUMBEROFPOSITIONS        msglen: 27
# C:   VKLIWPHDQBQXPEHURISRVLWLRQV
# DC:  SHIFTMEANYNUMBEROFPOSITIONS
# msg == DC: True
