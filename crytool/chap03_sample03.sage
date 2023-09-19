print("\n# CHAP03 -- Script-SAMPLE 03: =========")

def Display(F,fname):
    ### The following commands work in sage CLI for all OS, but not when calling from script
    # F.show()  # Alternative, also working in sage CLI: F.plot()
      # CLI outputs: 'Launched png viewer for Graphics object consisting of 1 graphics primitive'
      # This automatically comes with annotated axes / Achsen sind automatisch beschriftet

    ### This works from a sage script under Ubuntu (adapt path and viewer name for other OS)
    pngfile='/tmp/'+fname+'.png'; # print("pngfile=", pngfile)
    F.save(pngfile,axes=True)
    oscommand='eog '+ pngfile + ' &'; # print("oscommand=", oscommand)
    os.system(oscommand)  # With Ubuntu: eog = Eye of GNOME file viewer
    ## os.system('display /tmp/F.png &')  # Alternative: The display command needs 'imagemagick' to be installed.


# Definition of function f(x)=x and plots for the domains 0 to 100 and 0 to 10^10
def f(x):return x
F1=plot(f,(0,100)); Display(F1, "F1")  # it doesn't matter whether range starts from 0 or 1
F2=plot(f,(0,10^10)); Display(F2, "F2")

# Definition of function g(x)=10^x and plots for the domain 0 to 10
def g(x): return 10^x
G=plot(g,(0,10)); Display(G, "G")

# Definition of function h(x)=log(x) and plots for the domains 1 to 100 and 1 to 10^10
def h(x): return log(x)
H1=plot(h,(1,100),color="red"); Display(H1, "H1")
H2=plot(h,(1,10^10),color="red"); Display(H2, "H2")

# Definition of function k(x)=x/log(x) and plots for the domain 2 to 100
def k(x): return x/log(x)
K1=plot(k,(1,100),color="green"); Display(K1, "K1")
# K=plot(k,(2,100),color="green"); Display(K, "K")

# Plots of the functions f, k and h for the domain up to 100
Display(F1+K1+H1, "F1+K1+H1")


# Generation of the data for the bar charts ..........................
# Determination of the number of primes in the interval [1,10]
print("#p in %13s:" % "[1,10]", pari(10).primepi() - pari(1).primepi() )

# Determination of the number of primes in the interval [1,100]
print("#p in %13s:" % "[1,100]", pari(100).primepi() - pari(1).primepi() )

# Determination of the number of primes in the interval [10^3,10^4]
print("#p in %13s:" % "[10^3,10^4]", pari(10**4).primepi()-pari(10**3).primepi() )

# Determination of the number of primes in the interval [10^8,10^9]
print("#p in %13s:" % "[10^8,10^9]", pari(10**9).primepi()-pari(10**8).primepi() )

# Determination of the number of primes in the interval [10^9,10^10]
print("#p in %13s:" % "[10^9,10^10]", pari(10**10).primepi()-pari(10**9).primepi() )

# Determination of the number of primes in the interval [10^10,10^11]
print("#p in %13s:" % "[10^10,10^11]", pari(10**11).primepi()-pari(10**10).primepi() )

# Determination of the number of primes in the interval [1,10^11]
print("#p in %13s:" % "[1,10^11]", pari(10**11).primepi()-pari(1).primepi() )

#------------------------------------
# CHAP03 -- Script-SAMPLE 03 =========
# #p in        [1,10]: 4
# #p in       [1,100]: 25
# #p in   [10^3,10^4]: 1061
# #p in   [10^8,10^9]: 45086079
# #p in  [10^9,10^10]: 404204977
# #p in [10^10,10^11]: 3663002302
# #p in     [1,10^11]: 4118054813


