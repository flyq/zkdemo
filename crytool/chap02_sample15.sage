print("\n# CHAP02--SAMPLE 15: =========")

# Using own definitions for a classical cipher instead of the r2r Sage commands (r2r=ready-to-run)
# An arbitrary alphabet made from A..Z, a..z, 0..9, and some symbols which arranged in a wished order.

import string
import random

alph1Lower_string = string.ascii_lowercase
# print(alph1Lower_string)
alph2Upper_string = string.ascii_uppercase
# print(alph2Upper_string)
alph3Digits_string = string.digits
# print(alph3Digits_string)
alph4Punctuation_string = string.punctuation
# print(alph4Punctuation_string)

# Determine the order of the elements of the alphabet by ordering the 4 parts
alphabet = alph1Lower_string + alph2Upper_string + alph4Punctuation_string + alph3Digits_string
print(alphabet)

print('Length alphabet:', len(alphabet))
print('Check: Value of letter B in this alphabet:', alphabet.index('B'))

# Shuffle rearranges the given object. As strings and tuples are immutable,
# we have to use random.sample() instead of random.shuffle().
random.seed(15) # not necessary. Initialized the PRNG just to have always the same to compare with.
r_alphabet = ''.join(random.sample(alphabet, len(alphabet)))
print('1. shuffled alphabet:', r_alphabet)
r_alphabet = ''.join(random.sample(alphabet, len(alphabet)))
print('2. shuffled alphabet:', r_alphabet)

# Use these two alphabets to build a MAS
PA = alph1Lower_string + alph2Upper_string + alph4Punctuation_string + alph3Digits_string
print('\nPlaintext alphabet PA :', PA, ' Length of PA', len(PA))

random.seed(0) # Initialized the seed to generate a fixed permutation
CA = ''.join(random.sample(PA, len(PA)))
print('Ciphertext alphabet CA:', CA, ' Length of CA', len(CA))

codetableC2P = str.maketrans(CA,PA) # requires the 2 strings CA, PA to have the same len
codetableP2C = str.maketrans(PA,CA) # requires the 2 strings CA, PA to have the same len

P1 = '''ATESTZtestTEST1234'''
P2 = '''DWHVWCCNBCWHVWNOPQ'''

C1 = P1.translate(codetableP2C);
C2 = P2.translate(codetableP2C);

print('C1         :', C1)
print('C2         :', C2)

P1_revealed = C1.translate(codetableC2P);
P2_revealed = C2.translate(codetableC2P);

print('P1_revealed:', P1_revealed)
print('P2_revealed:', P2_revealed)

print('Check: Value of letter A in PA:', PA.index('A'))
print('Check: Value of letter 0 in CA:', CA.index('0'))
print('Check: Value of letter D in PA:', PA.index('D'))
print('Check: Value of letter A in CA:', CA.index('A'))

#------------------------------------
# CHAP02--SAMPLE 15: ========= 
# abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~0123456789
# Length alphabet: 94
# Check: Value of letter B in this alphabet: 27
# 1. shuffled alphabet: Ab/euEchsV4oR(TJYHSD9`OCN."[':+f7KZx=)5\P&zX6F8miIl<01]Wjg2{d^*;@rLUq_,!#|3yBw~nkp%>M}-$tQ?aGv
# 2. shuffled alphabet: WbHlKif&hGu,?*}3-1)k|(D20[8]Q9$wdN@TtMC=J!:Bya.+\X7^jqpF<v~'"%RV#6U/;Z_LO{smzerSxnAP4`oY5E>gIc
# 
# Plaintext alphabet PA : abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~0123456789  Length of PA 94
# Ciphertext alphabet CA: X"fH.+ZM*T[B-rK{mG;sN^jQ)?0$OA1C/6qd3Ja7Uz:Y=5,@Fvpue\`oR>I4#<9%(L'8_|w}!kSgty2bDW~]nxPEl&Vchi  Length of CA 94
# C1         : 051=5us.;s51=5xPEl
# C2         : AF6@FOO7$OF6@F7Uz:
# P1_revealed: ATESTZtestTEST1234
# P2_revealed: DWHVWCCNBCWHVWNOPQ
# Check: Value of letter A in PA: 26
# Check: Value of letter 0 in CA: 26
# Check: Value of letter D in PA: 29
# Check: Value of letter A in CA: 29
