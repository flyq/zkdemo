print("\n# CHAP03 -- Script-SAMPLE 04: =========")

def quadratic_prime_formula(start, end, verbose=True):
    print("N -- N^2 - 9*N + 61")
    P = 0  # the number of primes between start and end
    for n in range(start, end + 1):
        X = n^2 - 9*n + 61
        if is_prime(X):
            P += 1
            if verbose:
                print(str(n) + " -- " + str(X) + " is prime")
        else:
            if verbose:
                print(str(n) + " -- " + str(X) + " is NOT prime")
    print("Number of primes: " + str(P) + " in range (%d, %d)" % (start,end))
    print("Percentage of primes: " + str(float((P * 100) / (end - start + 1))))


# Compute the values of f(n) = n^2 - 9n + 61 for n = 0, ..., 50
#  and verify the primality of the generated integers
quadratic_prime_formula(0, 50)

#------------------------------------
# CHAP03 -- Script-SAMPLE 04: =========
# N -- N^2 - 9*N + 61
# 0 -- 61 is prime
# 1 -- 53 is prime
# 2 -- 47 is prime
# 3 -- 43 is prime
# 4 -- 41 is prime
# 5 -- 41 is prime
# 6 -- 43 is prime
# 7 -- 47 is prime
# 8 -- 53 is prime
# 9 -- 61 is prime
# 10 -- 71 is prime
# 11 -- 83 is prime
# 12 -- 97 is prime
# 13 -- 113 is prime
# 14 -- 131 is prime
# 15 -- 151 is prime
# 16 -- 173 is prime
# 17 -- 197 is prime
# 18 -- 223 is prime
# 19 -- 251 is prime
# 20 -- 281 is prime
# 21 -- 313 is prime
# 22 -- 347 is prime
# 23 -- 383 is prime
# 24 -- 421 is prime
# 25 -- 461 is prime
# 26 -- 503 is prime
# 27 -- 547 is prime
# 28 -- 593 is prime
# 29 -- 641 is prime
# 30 -- 691 is prime
# 31 -- 743 is prime
# 32 -- 797 is prime
# 33 -- 853 is prime
# 34 -- 911 is prime
# 35 -- 971 is prime
# 36 -- 1033 is prime
# 37 -- 1097 is prime
# 38 -- 1163 is prime
# 39 -- 1231 is prime
# 40 -- 1301 is prime
# 41 -- 1373 is prime
# 42 -- 1447 is prime
# 43 -- 1523 is prime
# 44 -- 1601 is prime
# 45 -- 1681 is NOT prime
# 46 -- 1763 is NOT prime
# 47 -- 1847 is prime
# 48 -- 1933 is prime
# 49 -- 2021 is NOT prime
# 50 -- 2111 is prime
# Number of primes: 48 in range (0, 50)
# Percentage of primes: 94.11764705882354

