print("\n# CHAP08 -- Script-SAMPLE 01: =========")

A = Matrix([[1,2,3],[3,2,1],[1,1,1]])
b = vector([0,-4,-1])
x = A.solve_right(b)
print("x =  ", x)

LK = A.kernel()        # left kernel: just for information
print("LK = ", LK)

RK = A.right_kernel()  # right kernel: this is needed here
print("RK = ", RK)

## LEBM = A.kernel().matrix()
## print("lvvv", vector(LEBM))
## y = x - 4*vector(LEBM)
REBM = A.right_kernel().matrix()   # calculate REBM dynamically, instead
print("vec_REBM =", vector(REBM))  # of setting the known solution like
y = x - 4*vector(REBM)             # y = x - 4*vector([1,-2,1])

print("y =  ", y)
print("A*y =", A*y)
print("A*y==b :", A*y == b )

#------------------------------------
# CHAP08 -- Script-SAMPLE 01: =========
# x =   (-2, 1, 0)
# LK =  Free module of degree 3 and rank 1 over Integer Ring
#   Echelon basis matrix:
#   [ 1  1 -4]
# RK =  Free module of degree 3 and rank 1 over Integer Ring
#   Echelon basis matrix:
#   [ 1 -2  1]
# vec_REBM = (1, -2, 1)
# y =   (-6, 9, -4)
# A*y = (0, -4, -1)
# A*y==b : True
