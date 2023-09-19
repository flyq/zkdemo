print("\n# CHAP04 -- Script-SAMPLE 08: =========")

def power_mod_order_matrix(m, max_a, max_i):
    r = matrix(ZZ, max_a+1, max_i+3)
    for a in range(0, max_a+1):
        r[a, 0] = a
        for i in range(1, max_i+1):
            if a==0:
                r[a,i] = i
            else:
                r[a, i] = power_mod(a, i, m)
        try:
            r[a, max_i+1] = multiplicative_order(mod(a, m))
        except:
            r[a, max_i+1] = 0
        r[a, max_i+2] = euler_phi(m)
    return r

print("\n#1: m=45; max_i=13; max_a=13"); m=45; max_i=13; max_a=13
r = power_mod_order_matrix(m, max_a, max_i)
print(r); print( latex(r) )

print("\n#2: m=46; max_i=25; max_a=25"); m=46; max_i=25; max_a=25
r = power_mod_order_matrix(m, max_a, max_i)
print( r.str() ); print( latex(r) )

print("\n#3: m=14; max_i=13; max_a=16"); m=14; max_i=13; max_a=16
r = power_mod_order_matrix(m, max_a, max_i)
print(r); print( latex(r) )

print("\n#4: m=22; max_i=21; max_a=25"); m=22; max_i=21; max_a=25
r = power_mod_order_matrix(m, max_a, max_i)
print( r.str() ); print( latex(r) )

#------------------------------------
# CHAP04 -- Script-SAMPLE 08: =========
# ...
# 3: m=14; max_i=13; max_a=16
# [ 0  1  2  3  4  5  6  7  8  9 10 11 12 13  0  6]
# [ 1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  6]
# [ 2  2  4  8  2  4  8  2  4  8  2  4  8  2  0  6]
# [ 3  3  9 13 11  5  1  3  9 13 11  5  1  3  6  6]
# ...
# \left(\begin{array}{rrrrrrrrrrrrrrrr}
# 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13 & 0 & 6\\
# 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 6\\
# 2 & 2 & 4 & 8 & 2 & 4 & 8 & 2 & 4 & 8 & 2 & 4 & 8 & 2 & 0 & 6\\
# 3 & 3 & 9 & 13 & 11 & 5 & 1 & 3 & 9 & 13 & 11 & 5 & 1 & 3 & 6 & 6\\
# ...
