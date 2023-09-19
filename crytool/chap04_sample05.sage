print("\n# CHAP04 -- Script-SAMPLE 05: =========")

m = 11
for a in range(1, m):
    print( [power_mod(a, i, m) for i in range(1, m)] )

# E: adding a last column with the order of each 'a' mod (11)
# D: die letzte Spalte um die Ordnung des jeweiligen 'a' mod (11) ergänzen
print()  # add an empty line between the two tables

for a in range(1, m):
    lst = [power_mod(a, i, m) for i in range(1, m)]
    lst.append(multiplicative_order(mod(a,m)))

    for k in range(0,m-1): # some beautifier formatting
        print ("{:>4}".format(lst[k]), end = '' )  # print first m-1 cells of current row
    print ("{:>6}".format(lst[m-1]))  # print last cell of current row

#------------------------------------
# CHAP04 -- Script-SAMPLE 05: =========
# [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
# [2, 4, 8, 5, 10, 9, 7, 3, 6, 1]
# [3, 9, 5, 4, 1, 3, 9, 5, 4, 1]
# [4, 5, 9, 3, 1, 4, 5, 9, 3, 1]
# [5, 3, 4, 9, 1, 5, 3, 4, 9, 1]
# [6, 3, 7, 9, 10, 5, 8, 4, 2, 1]
# [7, 5, 2, 3, 10, 4, 6, 9, 8, 1]
# [8, 9, 6, 4, 10, 3, 2, 5, 7, 1]
# [9, 4, 3, 5, 1, 9, 4, 3, 5, 1]
# [10, 1, 10, 1, 10, 1, 10, 1, 10, 1]
# 
#    1   1   1   1   1   1   1   1   1   1     1
#    2   4   8   5  10   9   7   3   6   1    10
#    3   9   5   4   1   3   9   5   4   1     5
#    4   5   9   3   1   4   5   9   3   1     5
#    5   3   4   9   1   5   3   4   9   1     5
#    6   3   7   9  10   5   8   4   2   1    10
#    7   5   2   3  10   4   6   9   8   1    10
#    8   9   6   4  10   3   2   5   7   1    10
#    9   4   3   5   1   9   4   3   5   1     5
#   10   1  10   1  10   1  10   1  10   1     2
