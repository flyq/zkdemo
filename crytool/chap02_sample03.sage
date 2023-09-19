print("\n# CHAP02--SAMPLE 03: =========")

blocklen = keylen = 14
T = TranspositionCryptosystem(AlphabeticStrings(), keylen);

key = [ keylen-i for i in range(keylen) ]; print("key: ", key, "  keylen: ", keylen, sep="")

P   = "THECATINTHEHAT"
msg = T.encoding(P); print("msg:", msg, "   msglen:", len(msg))
C   = T.enciphering(key, msg); print("C:  ", C)
DC  = T.deciphering(T(key).key(), C); print("DC: ", DC)

#------------------------------------
# CHAP02--SAMPLE 03: =========
# key: [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]  keylen: 14
# msg: THECATINTHEHAT    msglen: 14
# C:   TAHEHTNITACEHT
# DC:  THECATINTHEHAT
