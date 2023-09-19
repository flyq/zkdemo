print("\n# CHAP08 -- Script-SAMPLE 13: =========")

load("./bitciphers.sage")  # for txt2bbl() + bbl2str()

plaintext = "Du bist doof"
bintext = txt2bbl(plaintext)  # array
binstr = bbl2str(bintext)
print(binstr)
testkey = [1,0,0,1,0,1,1,0]
keystr = bbl2str(testkey)
print("key:", keystr)
ciphertext = xor(bintext,testkey)
ciphstr = bbl2str(ciphertext)
print(ciphstr)

#------------------------------------
# CHAP08 -- Script-SAMPLE 13: =========
# 010001000111010100100000011000100110100101110011
# 011101000010000001100100011011110110111101100110
# key: 10010110
# 110100101110001110110110111101001111111111100101
# 111000101011011011110010111110011111100111110000
