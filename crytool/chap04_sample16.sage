print("\n# CHAP04 -- Script-SAMPLE 16: =========")

def count_Number_of_RSA_Keys(start, end, Verbose=False):
    """
    How many private RSA keys (n,d) exist, if only modulus N is given, and start <= N <= end?
    - (prime_range(u,o) delivers all primes >=u und < o).
    """
    a = start
    b = end
    s = 0
    comb = 0
    
    for p in prime_range(1, b/2+1):
        for q in prime_range(p+1, b/2+1):
            n=p*q
            if a <= n and n <= b:
                comb = comb +1
                eu1 = euler_phi(n)
                eu2 = euler_phi(eu1)-1
                s = s + eu2  ### Ist hier noch ein Fehler? Ich hätte mehr erwartet als 1 Kombination?!
                if Verbose:
                    print("p=%s, " % p + "q=%s, " % q + "n=%s, " % n + "eu1=%s, " % eu1 + "eu2=%s, " % eu2 + "s=%s " % s)

    print("Number of private keys d for moduli in given range: %s" % s + " (#comb=%s), " % comb)

    # Just for comparison: How many primes are in the given moduli range [a,b+1]?
    if Verbose:
        s = 0
        primeslist=[]
        for p in prime_range(a, b+1):
            if Verbose==2:
                primeslist.append(p)
            s = s + 1
        if Verbose==2:
            print("  a=%s, " % a + "b=%s, " % b + "\n  primeslist=%s" % primeslist)
        print("  Number of primes in given range: %s" % s)

import time

print("\nDD_Start -- Testcases for count_Number_of_RSA_Keys(start, end)")

print("\n-----------Testcase: Moduli range = (100, 1000)")
StartTime = time.time()
count_Number_of_RSA_Keys(100, 1000)
print("Time = %f sec" % (time.time()-StartTime))

print("\n-----------Testcase: Moduli range = (100, 107, True)")
StartTime = time.time()
count_Number_of_RSA_Keys(100, 107, True)
print("Time = %f sec" % (time.time()-StartTime))

print("\n-----------Testcase: Moduli range = (100, 107, 2)")
StartTime = time.time()
count_Number_of_RSA_Keys(100, 107, 2)
print("Time = %f sec" % (time.time()-StartTime))

u = 10^3; o = 10^4;
print("\n-----------Testcase: Moduli range = (%s, " % u + "%s)" % o)
StartTime = time.time()
count_Number_of_RSA_Keys(u, o)
print("Time = %f sec" % (time.time()-StartTime))

u = 10^3; o = 10^5;
print("\n-----------Testcase: Moduli range = (%s, " % u + "%s)" % o)
StartTime = time.time()
count_Number_of_RSA_Keys(u, o)
print("Time = %f sec" % (time.time()-StartTime))

u = 1; o = 10^5;
print("\n-----------Testcase: Moduli range = (%s, " % u + "%s)" % o)
StartTime = time.time()
count_Number_of_RSA_Keys(u, o)
print("Time = %f sec" % (time.time()-StartTime))

print("\n-----------Testcase: Moduli range = (1, 50, 2)")
StartTime = time.time()
count_Number_of_RSA_Keys(1, 50, 2)
print("Time = %f sec" % (time.time()-StartTime))

#------------------------------------
# CHAP04 -- Script-SAMPLE 16: =========
# DD_Start -- Testcases for count_Number_of_RSA_Keys(start, end)
# 
# -----------Testcase: (100, 1000)
# Number of private keys d for moduli in given range: 34816 (comb=258),
# Number of primes in given range: 143
# Time: CPU 0.03 s, Wall: 0.04 s
# 
# -----------Testcase: (100, 107, True)
# p=2, q=53, s=23
# Number of private keys d for moduli in given range: 23 (comb=1),
# a=100, b=107, p=101
# a=100, b=107, p=103
# a=100, b=107, p=107
# Number of primes in given range: 3
# Time: CPU 0.00 s, Wall: 0.00 s
# 
# -----------Testcase: (1000, 10000)
# Number of private keys d for moduli in given range: 3260044 (comb=2312),
# Number of primes in given range: 1061
# Time: CPU 0.63 s, Wall: 0.66 s
# ...

