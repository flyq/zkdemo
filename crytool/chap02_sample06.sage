print("\n# CHAP02--SAMPLE 06: =========")

S = SubstitutionCryptosystem(AlphabeticStrings())

key = S.random_key(); print("key: ", key, "  keylen: ", len(key), sep="")

P   = "MASC: Substitute this with something else using a random key"
print("P:  ", P, "   Plen:", len(P))

msg = S.encoding(P); print("msg:", msg, "       msglen:", len(msg))
C   = S.enciphering(key, msg); print("C:  ", C)
DC  = S.deciphering(key, C); print("DC: ", DC)

print("msg == DC:", msg == DC)  # Expect True

#------------------------------------
# CHAP02--SAMPLE 06: =========
# key: ZMUPXCHBVGTIYLKDQOSENFWARJ  keylen: 26
# P:   MASC: Substitute this with something else using a random key    Plen: 60
# msg: MASCSUBSTITUTETHISWITHSOMETHINGELSEUSINGARANDOMKEY        msglen: 50
# C:   YZSUSNMSEVENEXEBVSWVEBSKYXEBVLHXISXNSVLHZOZLPKYTXR
# DC:  MASCSUBSTITUTETHISWITHSOMETHINGELSEUSINGARANDOMKEY
# msg == DC: True
