print("\n# CHAP04 -- Script-SAMPLE 12: =========")

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


def count_PrimitiveRoots_of_a_PrimesRange(start, end):
    """
    Compute all primitive roots of all primes between start and end, inclusive.
    """
    nPrimes = 0
    nPrimitiveRoots = 0
    for p in primes(start, end+1):
        L = enum_PrimitiveRoots_of_an_Integer(p)
        print(p, len(L))
        nPrimes += 1
        nPrimitiveRoots += len(L)
    print("Found all %s" % nPrimitiveRoots + " primitive roots of %s primes." % nPrimes)


import time
my_import("chap04_sample10", "enum_PrimitiveRoots_of_an_Integer")

print("\nCC_Start -- Testcases for count_PrimitiveRoots_of_a_PrimesRange(start, end)")
print("-----------Testcase: (1, 1500)"); StartTime = time.time()
count_PrimitiveRoots_of_a_PrimesRange(1, 1500)
print(" Time = %f sec" % (time.time()-StartTime))


#------------------------------------
# CHAP04 -- Script-SAMPLE 12: =========
# 
# CC_Start -- Testcases for count_PrimitiveRoots_of_a_PrimesRange(start, end)
# -----------Testcase: (1, 1500)
# 2 1
# 3 1
# 5 2
# 7 2
# 11 4
# 13 4
# 17 8
# 19 6
# 23 10
# 29 12
# 31 8
# 37 12
# 41 16
# 43 12
# ...
# 1471 336
# 1481 576
# 1483 432
# 1487 742
# 1489 480
# 1493 744
# 1499 636
# Found all 62044 primitive roots of 239 primes.
#  Time = 0.472963 sec
