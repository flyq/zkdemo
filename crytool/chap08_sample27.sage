print("\n# CHAP08 -- Script-SAMPLE 27: =========")

from sage.crypto.util   import random_blum_prime
from sage.crypto.stream import blum_blum_shub

sl = 1000  # Number of bits to generate in the pseudo random bit sequence
print("Using random start values (1000 bit length):")
p = random_blum_prime(2^511, 2^512)
q = random_blum_prime(2^511, 2^512)
x0 = 11^248 % (p*q)             # s = 11^124 % (p*q)
print(blum_blum_shub(sl,x0,p,q))

print("\nUsing the fixed values from the given table as start values:")
no = "8 445 834 617 855 090 512 176 000 413 196 767 417 799 332\
626 936 992 170 472 089 385 128 414 279 550 732 184 808 226\
736 683 775 727 426 619 339 706 269 080 823 255 441 520 165\
438 397 334 657 231 839 251"
p = ZZ(no.replace("\n", "").replace("\r", "").replace(" ", ""))

no = "12 580 605 326 957 495 732 854 671 722 855 802 182 952 894\
  232 088 903 111 155 705 856 898 413 602 721 771 810 991 595\
  365 229 641 230 483 180 760 744 910 366 324 916 344 823 400\
  588 340 927 883 444 616 787"
q = ZZ(no.replace("\n", "").replace("\r", "").replace(" ", ""))

no = "1 842 408 460 334 540 507 430 929 434 383 083 145 786 026\
  412 146 359 363 362 017 837 922 966 741 162 861 257 645 571\
  680 482 798 249 771 263 305 761 292 545 408 040 659 753 561\
  970 871 645 393 254 757 072 936 076 922 069 587 163 804 708\
  256 246 366 137 431 776 175 309 050 064 068 198 002 904 756\
  218 898 942 856 431 647 438 473 529 312 261 281"
x0 = ZZ(no.replace("\n", "").replace("\r", "").replace(" ", ""))

s= str(blum_blum_shub(sl,x0,p,q))
bl=4 # blocklength
split = [s[i:i+bl] for i in range (0, len(s), bl)]
print("Number of blocks = len(split) =", len(split))

for i in range(len(split)):
  print("%s " % (split[i]), end = '' )
print()

#------------------------------------
# CHAP08 -- Script-SAMPLE 27: =========
# Using random start values (1000 bit length):
# 00001010001101010001101010000011 ...
#
# Using the fixed values from the given table as start values:
# Number of blocks = len(split) = 250
# 1010 0110 0011 0100 0000 0111 1111 0100 ...
