print("\n# CHAP03 -- Script-SAMPLE 05: =========")

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

quadratic_prime_formula(0, 1000, verbose=False)

#------------------------------------
# CHAP03 -- Script-SAMPLE 05: =========
# N -- N^2 - 9*N + 61
# Number of primes: 584 in range (0, 1000)
# Percentage of primes: 58.341658341658345
