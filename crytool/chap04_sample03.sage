print("\n# CHAP04 -- Script-SAMPLE 03: =========")

m = 17; a = 5
print( [mod(a * i, m).lift() for i in range(m)] )
a = 6
print( [mod(a * i, m).lift() for i in range(m)] )

#------------------------------------
# CHAP04 -- Script-SAMPLE 03: =========
# [0, 5, 10, 15, 3, 8, 13, 1, 6, 11, 16, 4, 9, 14, 2, 7, 12]
# [0, 6, 12, 1, 7, 13, 2, 8, 14, 3, 9, 15, 4, 10, 16, 5, 11]
