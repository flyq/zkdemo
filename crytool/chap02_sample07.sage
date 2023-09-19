print("\n# CHAP02--SAMPLE 07: =========")

A = AlphabeticStrings()  # plaintext/ciphertext alphabet
keylen = len(A.alphabet()); # Alternative: keylen = len(A.gens())
shift = 3; shiftInv=keylen-shift;
print("keylen: ", keylen, "   shift: ", shift, "   shiftInv: ", shiftInv, sep="")

S = SubstitutionCryptosystem(A)

# construct key for Caesar cipher
numkey = [(i+shift).mod(keylen) for i in range(keylen)]  ### Now without +1 (after mod)
print("numkey", numkey)
key = A(numkey); print("key: ", key, "  keylen: ", len(key), sep="")  

P = "Shift the alphabet three positions to the right."
print("P:  ", P, "   Plen:", len(P))

# encrypt message (method encoding can be called from A or from S)
msg = S.encoding(P); print("msg:", msg, "       msglen:", len(msg))
C   = S.enciphering(key, msg); print("C:  ", C)

# decrypt message (using inverse key and enciphering instead of deciphering)
numkeyInv = [(i+shiftInv).mod(keylen) for i in range(keylen)]; print("numkeyInv", numkeyInv)
keyInv = A(numkeyInv); print("keyInv: ", keyInv, sep="")

DC = S.enciphering(keyInv, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 07: =========
# keylen: 26   shift: 3   shiftInv: 23
# numkey [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 0, 1, 2]
# key: DEFGHIJKLMNOPQRSTUVWXYZABC  keylen: 26
# P:   Shift the alphabet three positions to the right.    Plen: 48
# msg: SHIFTTHEALPHABETTHREEPOSITIONSTOTHERIGHT        msglen: 40
# C:   VKLIWWKHDOSKDEHWWKUHHSRVLWLRQVWRWKHULJKW
# numkeyInv [23, 24, 25, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
# keyInv: XYZABCDEFGHIJKLMNOPQRSTUVW
# DC:  SHIFTTHEALPHABETTHREEPOSITIONSTOTHERIGHT
# msg == DC: True
