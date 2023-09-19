print("\n# CHAP08 -- Script-SAMPLE 02: =========")

M = MatrixSpace(GF(2), 5, 6) # GF(2) = field with two elements
A = M([[1,0,1,0,0,1],[1,1,0,1,0,1],[0,1,1,0,1,1],[1,0,0,1,1,0],\
      [0,1,0,1,1,0]])
print("A  :\n", A, sep="")  # sep="" prevents print adding a space between arguments
b = vector(GF(2),[1,0,0,1,1])
x1= A.solve_right(b)
print("x1 :", x1)
K = A.right_kernel()
print("K  :", K)
REBM = A.right_kernel().matrix()
x2 = x1 + vector(REBM)
print("x2 :", x2)

#------------------------------------
# CHAP08 -- Script-SAMPLE 02: =========
# A  :
# [1 0 1 0 0 1]
# [1 1 0 1 0 1]
# [0 1 1 0 1 1]
# [1 0 0 1 1 0]
# [0 1 0 1 1 0]
# x1 : (0, 0, 1, 0, 1, 0)
# K  : Vector space of degree 6 and dimension 1 over Finite Field of size 2
#   Basis matrix:
#   [1 1 0 1 0 1]
# x2 : (1, 1, 1, 1, 1, 1)
