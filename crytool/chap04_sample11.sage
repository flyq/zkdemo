print("\n# CHAP04 -- Script-SAMPLE 11: =========")

# function to include 'enum_PrimitiveRoots_of_an_Integer' from another sage script
def my_import(module_name, func_name='*'):
    import os
    command = 'sage --preparse ' + module_name + '.sage'
    os.system(command)  # this creates the *.sage.py file
    command = 'mv ' + module_name + '.sage.py ' + module_name + '.py'
    os.system(command)  # this renames *.sage.py to *.py
    from sage.misc.python import Python; python = Python()
    command = 'from ' + module_name + ' import ' + func_name
    python.eval(command, globals())


def count_PrimitiveRoots_of_an_IntegerRange(start, end, bPrimesOnly=True):
    """
    Compute all primitive roots of all numbers between start and end,
    inclusive, and count them.
    - If the flag bPrimesOnly is True (default), so it performs primality tests
      and performs the calculation only for primes (printing the count of found
      primes from start to end, inclusive).
    - If the flag bPrimesOnly is False, it not only considers the primes, and
      additionally prints the count of (even) numbers which have NO primitive root.
    """
    nCheckedNumb = 0
    nCheckedNumb_WithoutPrimitivRoots = 0
    nPrimitiveRoots = 0
    for n in range(start, end+1):
        if bPrimesOnly:
            if is_prime(n):
                nCheckedNumb += 1
                L = enum_PrimitiveRoots_of_an_Integer(n)
                nPrimitiveRoots += len(L)
        else:
            nCheckedNumb += 1
            L = enum_PrimitiveRoots_of_an_Integer(n)
            if L==None:
                nCheckedNumb_WithoutPrimitivRoots += 1
            else:
                nPrimitiveRoots += len(L)

    if bPrimesOnly:
        print("Found all %s" % nPrimitiveRoots + \
              " primitive roots of %s primes." % nCheckedNumb)
    else:
        if nCheckedNumb_WithoutPrimitivRoots == 0:
            print("Found all %s " % nPrimitiveRoots + \
                  "primitive roots of %s numbers." % nCheckedNumb)
        else:
            print("Found all %s " % nPrimitiveRoots + \
                  "primitive roots of %s numbers." % \
                      (nCheckedNumb - nCheckedNumb_WithoutPrimitivRoots))
            print("(Total of numbers checked: %s, " % nCheckedNumb + \
                  "Amount of numbers without primitive roots: %s)" % \
                      nCheckedNumb_WithoutPrimitivRoots)


import time # in sage scripts: measure time like in Python and calculate execution time

my_import("chap04_sample10", "enum_PrimitiveRoots_of_an_Integer") # import from 'chap04_sample10.sage'

print("\nBB_Start -- Testcases for count_PrimitiveRoots_of_an_IntegerRange(start, end, bPrimesOnly)")

print("\n-----------Testcase 1: (5, 6)"); StartTime = time.time()
count_PrimitiveRoots_of_an_IntegerRange(5, 6, False)
print(" Time = %f sec" % (time.time()-StartTime))

print("\n-----------Testcase 2: (5, 6, False)"); StartTime = time.time()
count_PrimitiveRoots_of_an_IntegerRange(5, 6, False)
print(" Time = %f sec" % (time.time()-StartTime))

print("\n-----------Testcase 3: (5, 8, False)"); Start_Time = time.time()
count_PrimitiveRoots_of_an_IntegerRange(5, 8, False)
print(" Time = %f sec" % (time.time()-Start_Time))

print("\n-----------Testcase 4: (1, 500)"); StartTime = time.time()
count_PrimitiveRoots_of_an_IntegerRange(1, 500)
print(" Time = %f sec" % (time.time()-StartTime))

print("\n-----------Testcase 5: (1, 500, False)"); StartTime = time.time()
count_PrimitiveRoots_of_an_IntegerRange(1, 500, False)
print(" Time = %f sec" % (time.time()-StartTime))

print("\n-----------Testcase 6: (1, 2000, False)"); StartTime = time.time()
count_PrimitiveRoots_of_an_IntegerRange(1, 2000, False)
print(" Time = %f sec" % (time.time()-Start_Time))

print("\n-----------Testcase 7: (1, 20000, False)"); StartTime = time.time()
count_PrimitiveRoots_of_an_IntegerRange(1, 20000, False)
print(" Time = %f sec" % (time.time()-StartTime))


#------------------------------------
# CHAP04 -- Script-SAMPLE 11: =========
# 
# BB_Start -- Testcases for count_PrimitiveRoots_of_an_IntegerRange(start, end, bPrimesOnly)
# 
# -----------Testcase 1: (5, 6)
# Found all 3 primitive roots of 2 numbers.
#  Time = 0.002095 sec
# 
# -----------Testcase 2: (5, 6, False)
# Found all 3 primitive roots of 2 numbers.
#  Time = 0.000117 sec
# 
# -----------Testcase 3: (5, 8, False)
# Found all 5 primitive roots of 3 numbers.
# (Total of numbers checked: 4, Amount of numbers without primitive roots: 1)
#  Time = 0.000225 sec
# 
# -----------Testcase 4: (1, 500)
# Found all 8070 primitive roots of 95 primes.
#  Time = 0.068498 sec
# 
# -----------Testcase 5: (1, 500, False)
# Found all 11010 primitive roots of 170 numbers.
# (Total of numbers checked: 500, Amount of numbers without primitive roots: 330)
#  Time = 0.124834 sec
# 
# -----------Testcase 6: (1, 2000, False)
# Found all 138228 primitive roots of 510 numbers.
# (Total of numbers checked: 2000, Amount of numbers without primitive roots: 1490)
#  Time = 1.378479 sec
# 
# -----------Testcase 7: (1, 20000, False)
# Found all 10185370 primitive roots of 3584 numbers.
# (Total of numbers checked: 20000, Amount of numbers without primitive roots: 16416)
#  Time = 324.608044 sec 
