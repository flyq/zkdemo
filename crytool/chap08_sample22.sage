print("\n# CHAP08 -- Script-SAMPLE 22: =========")

load("./bitciphers.sage")

geff = BoolF(str2bbl ("00011100"),method="ANF")
g = BoolMap([geff])
linProf = g.linProf()
print(linProf)

#------------------------------------
# CHAP08 -- Script-SAMPLE 22: =========
# [[64, 0], [0, 0], [0, 16], [0, 16], [0, 16], [0, 16], [0, 0], [0, 0]]
