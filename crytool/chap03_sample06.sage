print("\n# CHAP03 -- Script-SAMPLE 06: =========")

# calculate the k primorials (k#) for table 3.5
# k# = product of first k primes. Note, function defines k#=1 for k=1 (besides k=1 is no prime)
# k# = defined in Sage as a Sloane sequence
# https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/sloane_functions.html

n=33; print('n =', n)

primlist = [i for i in primes(1,n)]
lenprimlist = len(primlist)
print('lenprimlist =', lenprimlist, '; pList =', primlist)

a = sloane.A002110  # Begins with 1 instead of 2
aa = a.list(lenprimlist+1)[1:] # get lenprimlist elements and discard 1st element
print('lenaa =', len(aa), '; aaList =', aa)

L = [(n,primlist[n-1],aa[n-1]) for n in range(1, lenprimlist+1)]
print('i, k, k#')
print(L)

print('\nSome distances for Table 3.4:')
print(' 19# =', a[8])
print(' 9959·19# =', 9959*a[8])
print(' 9523·23# =', 9523*a[9])
print(' 65 073·23# =', 65073*a[9])
print(' 366 384·23# =', 366384*a[9])
print(' 1 666 981·23# =', 1666981*a[9])
print(' 81 292 139·23# =', 81292139*a[9])

#------------------------------------
# CHAP03 -- Script-SAMPLE 06: =========
# n = 33
# lenprimlist = 11 ; pList = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
# lenaa = 11 ; aaList = [2, 6, 30, 210, 2310, 30030, 510510, 9699690, 223092870, 6469693230, 200560490130]
# i, k, k#
# [(1, 2, 2), (2, 3, 6), (3, 5, 30), (4, 7, 210), (5, 11, 2310), (6, 13, 30030), (7, 17, 510510), (8, 19, 9699690), (9, 23, 223092870), (10, 29, 6469693230), (11, 31, 200560490130)]
# 
# Some distances for Table 3.4:
#  19# = 9699690
#  9959·19# = 96599212710
#  9523·23# = 2124513401010
#  65 073·23# = 14517322329510
#  366 384·23# = 81737658082080
#  1 666 981·23# = 371891575525470
#  81 292 139·23# = 18135696597948930
