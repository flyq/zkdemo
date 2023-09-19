print("\n# CHAP01--SAMPLE 01: =========")

# (1) Encrypting a plaintext using Mini-AES
from sage.crypto.block_cipher.miniaes import MiniAES
maes = MiniAES()
K = FiniteField(16, "x")
MS = MatrixSpace(K, 2, 2)

P = MS([K("x^3 + x"), K("x^2 + 1"), K("x^2 + x"), K("x^3 + x^2")]); print("(1) P:\n",P, sep="")

key = MS([K("x^3 + x^2"), K("x^3 + x"), K("x^3 + x^2 + x"), K("x^2 + x + 1")]); print("key:\n",key, sep="")

C = maes.encrypt(P, key); print("C:\n",C, sep="")


# decryption process
plaintxt = maes.decrypt(C, key)
print(plaintxt == P)


# (2) Working directly with binary strings
maes = MiniAES()
bin = BinaryStrings()
key = bin.encoding("KE"); print("\n(2) key:\n",key, sep="")

P = bin.encoding("Encrypt this secret message!"); print("P:\n",P,sep="")
C = maes(P, key, algorithm="encrypt"); print("C:\n",C,sep="")
plaintxt = maes(C, key, algorithm="decrypt")
print(plaintxt == P)


# 3) Or working with integers n such that 0 <= n <= 15:
maes = MiniAES()
P = [n for n in range(16)]; print("\n(3) P:\n",P, sep="")
key = [2, 3, 11, 0]; print("key:\n",key, sep="")

P = maes.integer_to_binary(P)
key = maes.integer_to_binary(key)
C = maes(P, key, algorithm="encrypt"); print("C:\n",C, sep="")
plaintxt = maes(C, key, algorithm="decrypt")
print(plaintxt == P)

#------------------------------------
# CHAP01--SAMPLE 01: =========
# (1) P:
# [  x^3 + x   x^2 + 1]
# [  x^2 + x x^3 + x^2]
# key:
# [    x^3 + x^2       x^3 + x]
# [x^3 + x^2 + x   x^2 + x + 1]
# C:
# [            x       x^2 + x]
# [x^3 + x^2 + x       x^3 + x]
# True
# 
# (2) key:
# 0100101101000101
# P:
# 01000101011011100110001101110010011110010111000001110100001000000111010001101000011010010111001100100000011100110110010101100011011100100110010101110100001000000110110101100101011100110111001101100001011001110110010100100001
# C:
# 10001000101001101111000001111000010011001110110101000111011011010101001011101111101011001110011100100011101100101010100010100111110110011001010001000111011011010010000011000110001100000111000011100110101111000000001110001001
# True
# 
# (3) P:
# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# key:
# [2, 3, 11, 0]
# C:
# 1100100000100011111001010101010101011011100111110001000011100001
# True
