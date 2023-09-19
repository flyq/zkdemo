print("\n# CHAP04 -- Script-SAMPLE 09: =========")

print( " 4:", primitive_root(4) )
print( " 6:", primitive_root(6) )
print( " 9:", primitive_root(9) )  # Remark: 8 has no primitive root
print( "10:", primitive_root(10) )
print( "22:", primitive_root(22) )
for p in primes(1, 50):
    print( "%2d: %3d" % (p, primitive_root(p)) )

#------------------------------------
# CHAP04 -- Script-SAMPLE 09: =========
#   4: 3
#   6: 5
#   9: 2
#  10: 7
#  22: 13
#   2:   1
#   3:   2
#   5:   2
#   7:   3
#  11:   2
#  13:   2
#  17:   3
#  19:   2
#  23:   5
#  29:   2
#  31:   3
#  37:   2
#  41:   6
#  43:   3
#  47:   5
