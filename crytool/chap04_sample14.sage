print("\n# CHAP04 -- Script-SAMPLE 014: =========")

# fct to include the sage script defining 'enum_PrimitiveRoots_of_an_Integer'
# see https://ask.sagemath.org/question/7867/importing-sage-files/
def my_import(module_name, func_name='*'):
    import os
    command = 'sage --preparse ' + module_name + '.sage'
    os.system(command)  # this creates the *.sage.py file
    command = 'mv ' + module_name + '.sage.py ' + module_name + '.py'
    os.system(command)  # this renames *.sage.py to *.py
    from sage.misc.python import Python; python = Python()
    command = 'from ' + module_name + ' import ' + func_name
    python.eval(command, globals())

my_import("chap04_sample10", "enum_PrimitiveRoots_of_an_Integer")

import time
StartTime = time.time()
start = 1   # normal value: 1 // test value: 10^5+3
end = start+200  #  normal value: 10^6 // start+200 test value
fileName = "./primroot-smallest_up-to-one-million.dat"
print("...Creating file %s with start=%d, end=%d" % (fileName, start, end))
file = open(fileName, "w")
file.write("Used parameters:  start = " + str(start) + ",  end = " + str(end) + "\n")
file.write("---- StartTime:    " + str(StartTime) + " sec ----\n")
file.flush()
for p in primes(start, end+1):
    L = enum_PrimitiveRoots_of_an_Integer(p)
    # - To commandline, output only p and number of prim roots of Z_p
    # print(p, len(L)) # just temporarily active to see where you are while testing
    # - To file, output much more in the following format:
    # (1) the prime number p
    # (2) the number of primitive roots of Z_p
    # (3) the smallest primitive root of Z_p
    LL = sorted(L) # sort necessary as the smallest primroot is
                   # not always found first (see L of p=43)
    file.write(str(p) + " " + str(len(L)) + " " + str(LL[0]) + "\n")
    file.flush()

EndTime = time.time(); EllapsedTime = EndTime-StartTime
file.write("---- EndTime:      " + str(EndTime) + " sec ----\n")
file.write("---- EllapsedTime: " + str(EllapsedTime) + " sec ----\n")
file.flush()
file.close()

#------------------------------------
# CHAP04 -- Script-SAMPLE 14: =========
# Output for the test values only, written to file
# Used parameters:  start = 100003,  end = 100203
# ---- StartTime:    1626386427.8531456 sec ----
# 100003 28560 2
# 100019 48804 2
# 100043 50020 2
# 100049 44928 6
# 100057 30240 10
# 100069 32160 10
# 100103 50050 5
# 100109 48272 2
# 100129 28416 11
# 100151 40040 7
# 100153 30528 5
# 100169 47376 3
# 100183 32712 3
# 100189 29040 2
# 100193 48000 3
# ---- EndTime:      1626386479.0372972 sec ----
# ---- EllapsedTime: 51.1841516494751 sec ----
