print("\n# CHAP08 -- Script-SAMPLE 15: =========")

load("./bitciphers.sage")  # for bbl2str() and class LFSR

print("\n---------- Using LFSR(): ----------")
coeff = [0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,1] # define the taps of the LFSR
print("Input coeff:"); print(coeff)
reg = LFSR(coeff)                         # initialize the register
start = [0,1,1,0,1,0,1,1,0,0,0,1,0,0,1,1] # seed the register
print("Input start:"); print(start)
reg.setState(start)
bitlist = reg.nextBits(1024)              # ... and make it work
print("LFSR() output:")
print(bbl2str(bitlist))

print("\n---------- Visualize bit sequence: ----------")
def visualize(lst,w,h):
  """Arrange the list lst as a rectangle of width w and height h, row
  by row, as far as lst has entries, and discarding excess entries.
  Then plot a 'checkerboard' showing a white square for zero entries,
  and a black square otherwise. If lst has less than w*h entries,
  the remaining squares are left gray."""

  l = len(lst)
  p = polygon([(0,0), (w,0), (w,h), (0,h)], color = "grey")
  for j in range(h+1):
    p += line([(0,j),(w,j)], color="black")
  for i in range(w+1):
    p += line([(i,0),(i,h)], color="black")
  for j in range(h):
    for i in range(w):
      if (j*w + i < l):
        if (lst[j*w + i] == 0):
          p += polygon([(i,h-1-j),(i+1,h-1-j),(i+1,h-j),(i,h-j)], color = "white")
        else:
          p += polygon([(i,h-1-j),(i+1,h-1-j),(i+1,h-j),(i,h-j)], color = "black")
  p.axes(False)
  return p

p2 = visualize(bitlist,32,32)
p2.save("LFSRseq.png")
print("Graphic saved to LFSRseq.png")


#------------------------------------
# CHAP08 -- Script-SAMPLE 15: =========
# 
# ---------- Using LFSR(): ----------
# Input coeff:
# [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
# Input start:
# [0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1]
# LFSR() output:
# 1100100011010110001100111100000000111011100011100000100011101111010010011110010110111100101110010001001011000110011100111101011111000100011000001110011000010111011010101011101100010101110110001111000001000010001011110001111010100111000001111000100001011000010101010001011111101100110111011100100111011111000101100010001011100100101111110011011001010011000011001000011001101000111001001110100010010111011001101100101011011100100110111001011100000011001000101111011110001100000100010111010000111001111110100010010100111010001111000100000000110110100001011101011100011000000100011101101101111011100100011010100110001111110110101010011111100001111011101111010110010101100010100000010000100110011000111010011000010100101110100000010101100100100101101010111111101111110111011100101001010001001011011111111010100101001111110110100100010001101111000110011110010111110101100111011101010010001010010110111101100111011000000111011111010000110111011111111100000100010001001001011111111010101110111011111101110010110000010001111001100111
# 
# ---------- Visualize bit sequence: ----------
# Matplotlib created ...
# Graphic saved to LFSRseq.png
