print("\n# CHAP04 -- Script-SAMPLE 13: =========")

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
start = 1
end = 100  # 10^5 needs ca. an hour. For testing choose end=100
fileName = "./primroots.dat"
print("...Creating file %s with end=%d" % (fileName, end))
file = open(fileName, "w")
for p in primes(start, end+1):
    L = enum_PrimitiveRoots_of_an_Integer(p)
    # print(p, len(L)) # just temporarily active
    # Output to a file. The format is:
    # (1) the prime number p under consideration
    # (2) the number of primitive roots of Z/pZ
    # (3) all the primitive roots of Z/pZ
    file.write(str(p) + " " + str(len(L)) + " " + str(L) + "\n")
    file.flush()
file.close()

