print("\n# CHAP04 -- Script-SAMPLE 15: =========")

def Display(F,fname):
    ### Same function as in chap03_sample03.sage
    ### Alternative to F.show() or F.plot() which work in sage CLI, but not in a sage script
    ### - works under Ubuntu (adapt path and viewer name for other OS)
    pngfile='/tmp/'+fname+'.png'; # print("pngfile=", pngfile)
    F.save(pngfile,axes=True)
    oscommand='eog '+ pngfile + ' &'; # print("oscommand=", oscommand)
    os.system(oscommand)  # eog = Eye of GNOME file viewer

# Open a database file on primitive roots (the file "primroots.dat" used
# here, was created with the script chap04_sample13.sage where end=100)
file = open("./primroots.dat", "r")
plist = []    # list of all primes between 1 and 100
nlist = []    # number of primitive roots modulo prime p
minlist = []  # smallest primitive root modulo prime p
maxlist = []  # largest primitive root modulo prime p
for line in file:
    # get a line from the database file and tokenize it for processing
    line = line.strip().split(" ", 2)
    # extract the prime number p in question
    plist.append(Integer(line[0]))
    # extract the number of primitive roots modulo p
    nlist.append(Integer(line[1]))
    # extract the list of all primitive roots modulo p
    line = line[-1]
    line = line.replace("{", "")
    line = line.replace("}", "")
    line = line.split(", ")
    # sort the list in non-decreasing order
    line = [Integer(s) for s in line]
    line.sort()
    # get the smallest primitive root modulo p
    minlist.append(line[0])
    # get the largest primitive root modulo p
    maxlist.append(line[-1])

file.close()  # close the database file
print("length :", len(nlist))    # print just for test purposes
print("plist  :", plist)    # print just for test purposes
print("nlist  :", nlist)    # print just for test purposes
print("minlist:", minlist)  # print just for test purposes
print("maxlist:", maxlist)  # print just for test purposes
print("zipped :", list(zip(plist, nlist)))  # just for test purposes

# Generate 3 graphics:
# 1) Plot of number of primitive roots modulo p
# a) Either plot with the 2D plotting class "point2d()" built in sage
#    Remark 1: If you have a smaller primes range, use bigger
#              pointsize values or get rid of this parameter
#              For huge sets, "pointsize=1" is fine.
#    Remark 2: point2d() has no option "plotjoined=True"
#    nplot = point2d(zip(plist, nlist))
#    nplot = point2d(zip(plist, nlist), pointsize=1)
# b) or plot with "list_plot()"
#    Remark 3: "list_plot(list(zip(plist, nlist))" needs cast with list()
#              and has same result as "point2d(zip(plist, nlist))"
#    Remark 4: list_plot() has option "plotjoined=True" to connect the
#              points. This gives a better impression for smaller sets.
nplot = list_plot(list(zip(plist, nlist)), plotjoined=True)
nplot.axes_labels(["p", "number of primitive roots"])
Display(nplot, "Plot_number-of-all-primitive-roots")

# 2) Plot of smallest primitive root modulo prime p
## minplot = point2d(zip(plist, minlist), pointsize=1)
minplot = list_plot(list(zip(plist, minlist)), plotjoined=True)
minplot.axes_labels(["p", "smallest primitive root"])
Display(minplot, "Plot_smallest-prim-root")

# 3) Plot of largest primitive root modulo prime p
## maxplot = point2d(zip(plist, maxlist), pointsize=1)
maxplot = list_plot(list(zip(plist, maxlist)), plotjoined=True)
maxplot.axes_labels(["p", "biggest primitive root"])
Display(maxplot, "Plot_biggest-prim-roots")

#------------------------------------
# CHAP04 -- Script-SAMPLE 15: =========
# (test output here showing the lists used in the plots.
#  Output here only from small test data created with
#  the script chap04_sample13.sage where "end = 100")
# length : 25
# plist  : [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
# nlist  : [1, 1, 2, 2, 4, 4, 8, 6, 10, 12, 8, 12, 16, 12, 22, 24, 28, 16, 20, 24, 24, 24, 40, 40, 32]
# minlist: [1, 2, 2, 3, 2, 2, 3, 2, 5, 2, 3, 2, 6, 3, 5, 2, 2, 2, 2, 7, 5, 3, 2, 3, 5]
# maxlist: [1, 2, 3, 5, 8, 11, 14, 15, 21, 27, 24, 35, 35, 34, 45, 51, 56, 59, 63, 69, 68, 77, 80, 86, 92]
# zipped : [(2, 1), (3, 1), (5, 2), (7, 2), (11, 4), (13, 4), (17, 8), (19, 6), (23, 10), (29, 12), (31, 8), (37, 12), (41, 16), (43, 12), (47, 22), (53, 24), (59, 28), (61, 16), (67, 20), (71, 24), (73, 24), (79, 24), (83, 40), (89, 40), (97, 32)]

