print("\n# CHAP04 -- Script-SAMPLE 17: =========")

import numpy

print("--- Search for fixpoints in Textbook-RSA given p, q, e ---")
fp=numpy.array([0])
fq=numpy.array([0])

###EDIT BEGIN### --- Edit e,p,q here
e=17
p=811
q=1069
###EDIT END###

n=p*q
print("Prime p:", p)
print("Prime q:", q)
print("Modul n:", n)
print("Public exponent e:", e)

r=Integers(p)
gen_f_p = r.multiplicative_generator(); print("\nGenerator of f_p:", gen_f_p)
s=Integers(q)
gen_f_q = s.multiplicative_generator(); print("Generator of f_q:", gen_f_q)

gcd_p = gcd(e-1,p-1)
gcd_q = gcd(e-1,q-1)
print("\ngcd(e-1,p-1):", gcd_p)
print("gcd(e-1,q-1):", gcd_q)

print("\nFixpoints modulo p:")
print("0 (this trivial fixpoint added manually)")
i=0;
for i in range(gcd_p):
    fix_p = power_mod(gen_f_p,Integer(i*(p-1)/gcd_p),p); print(fix_p)
    fp = numpy.append(fp,fix_p)

print("\nFixpoints modulo q:")
print("0 (this trivial fixpoint added manually)")
j=0;
for j in range(gcd_q):
    fix_q = power_mod(gen_f_q,Integer(j*(q-1)/gcd_q),q); print(fix_q)
    fq = numpy.append(fq,fix_q)

print("\nNumber of fixpoints:", (gcd_p+1)*(gcd_q+1))
#Calculating fixpoints modulo F_p
#run i from 0 until gcd(e-1,p-1):
#g^( i*(p-1) / (ggT(e-1,p-1)) ) mod p
print("Fixpoints for the public RSA key (n,e) = (", n, ",", e, "):")
for r in fp:
    for s in fq:
        print(crt(Integer(r),Integer(s),Integer(p),Integer(q)))

print("\nRemark: You can verify each fixpoint with power_mod(m,e,n).")

#------------------------------------
# CHAP04 -- Script-SAMPLE 17: =========
# --- Search for fixpoints in Textbook-RSA given p, q, e ---
# Prime p: 811
# Prime q: 1069
# Modul n: 866959
# Public exponent e: 17
# 
# Generator of f_p: 3
# Generator of f_q: 6
# 
# gcd(e-1,p-1): 2
# gcd(e-1,q-1): 4
# 
# Fixpoints modulo p:
# 0 (this trivial fixpoint added manually)
# 1
# 810
# 
# Fixpoints modulo q:
# 0 (this trivial fixpoint added manually)
# 1
# 249
# 1068
# 820
# 
# Number of fixpoints: 15
# 
# Fixpoints for the public RSA key (n,e) = ( 866959 , 17 ):
# 0
# 23519
# 654477
# 843440
# 212482
# 843441
# 1
# 630959
# 819922
# 188964
# 23518
# 47037
# 677995
# 866958
# 236000
# 
# Remark: You can verify each fixpoint with power_mod(m,e,n).
