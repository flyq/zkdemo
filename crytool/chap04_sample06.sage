print("\n# CHAP04 -- Script-SAMPLE 06: =========")

tbl = []
m = 45

for a in range(1, 13):
    lst = [power_mod(a, i, m) for i in range(1, 13)]
    try:
        lst.append(multiplicative_order(mod(a, m)))
    except:
        lst.append("No mult. order")
    lst.append(euler_phi(m))
    # print(lst)
    tbl.append(lst)  # build up a table from the single rows (lst)

print( table(tbl, align='center') )  # print whole table

#------------------------------------
# CHAP04 -- Script-SAMPLE 06: =========
#  1    1    1    1    1    1    1    1    1    1    1    1          1          24
#  2    4    8    16   32   19   38   31   17   34   23   1          12         24
#  3    9    27   36   18   9    27   36   18   9    27   36   No mult. order   24
#  4    16   19   31   34   1    4    16   19   31   34   1          6          24
#  5    25   35   40   20   10   5    25   35   40   20   10   No mult. order   24
#  6    36   36   36   36   36   36   36   36   36   36   36   No mult. order   24
#  7    4    28   16   22   19   43   31   37   34   13   1          12         24
#  8    19   17   1    8    19   17   1    8    19   17   1          4          24
#  9    36   9    36   9    36   9    36   9    36   9    36   No mult. order   24
#  10   10   10   10   10   10   10   10   10   10   10   10   No mult. order   24
#  11   31   26   16   41   1    11   31   26   16   41   1          6          24
#  12   9    18   36   27   9    18   36   27   9    18   36   No mult. order   24
