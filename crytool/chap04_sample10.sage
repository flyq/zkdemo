# CHAP04 -- Script-SAMPLE 10: =========
# This file can be used both as script and imported as library,
# so printing its name is moved to the __main__ part at the end.

def enum_PrimitiveRoots_of_an_Integer(M):
    """
    Return all the primitive roots of the integer M (if possible).
    """
    try:
        g = primitive_root(M)
    except:
        return None
    targetOrder = euler_phi(M)
    L=[]
    # Stepping through all odd integers from 1 up to M, not including
    # M. So this loop only considers values of i where 1 <= i < M.
    for i in range(1,M,2):
            testGen = Mod(g^i,M)
            if testGen.multiplicative_order() == targetOrder:
                L.append(testGen.lift())
    # removing duplicates
    return Set(L)


if __name__ == "__main__":
    print("\n# CHAP04 -- Script-SAMPLE 10: =========")

    # AA_Start -- Testcases for enum_PrimitiveRoots_of_an_Integer(M)
    print("AA_Start -- Testcases for enum_PrimitiveRoots_of_an_Integer(M)")
    
    M=5; print( "-----------Testcase 1: M = %s" % M )
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=6; print( "-----------Testcase 2: M = %s" % M )
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=7; print( "-----------Testcase 3: M = %s" % M )
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=8; print( "-----------Testcase 4: M = %s" % M )
    # M=8 hat keine primitive root mod m. Checke, ob per try-except abgefangen.
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=9; print( "-----------Testcase 5: M = %s" % M )
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=10; print( "-----------Testcase 6: M = %s" % M )
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=11; print( "-----------Testcase 7: M = %s" % M )
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=12; print( "-----------Testcase 8: M = %s" % M )
    # M=12 hat keine primitive root mod m. Checke, ob per try-except abgefangen.
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    M=17; print( "-----------Testcase 9: M = %s" % M )
    LL = enum_PrimitiveRoots_of_an_Integer(M)
    if LL==None:
        print("None")
    else:
        print(LL)
    
    
    L=enum_PrimitiveRoots_of_an_Integer(541); L
    print("\nAll %d primitive roots of 541:\n" % len(L), L)

#------------------------------------
# CHAP04 -- Script-SAMPLE 10: =========
# AA_Start -- Testcases for enum_PrimitiveRoots_of_an_Integer(M)
# -----------Testcase 1: M = 5
# {2, 3}
# -----------Testcase 2: M = 6
# {5}
# -----------Testcase 3: M = 7
# {3, 5}
# -----------Testcase 4: M = 8
# None
# -----------Testcase 5: M = 9
# {2, 5}
# -----------Testcase 6: M = 10
# {3, 7}
# -----------Testcase 7: M = 11
# {8, 2, 6, 7}
# -----------Testcase 8: M = 12
# None
# -----------Testcase 9: M = 17
# {3, 5, 6, 7, 10, 11, 12, 14}
# 
# All 144 primitive roots of 541:
# {2, 517, 10, 523, 13, 14, 527, 528, 18, 531, 24, 539, 30, 37, 40, 51,
# 54, 55, 59, 62, 65, 67, 68, 72, 73, 77, 83, 86, 87, 91, 94, 96, 98,
# 99, 107, 113, 114, 116, 117, 126, 127, 128, 131, 132, 138, 150, 152,
# 153, 156, 158, 163, 176, 181, 183, 184, 195, 197, 199, 206, 208,
# 210, 213, 218, 220, 223, 224, 244, 248, 250, 257, 258, 259, 260,
# 261, 263, 267, 269, 270, 271, 272, 274, 278, 280, 281, 282, 283,
# 284, 291, 293, 297, 317, 318, 321, 323, 328, 331, 333, 335, 342,
# 344, 346, 357, 358, 360, 365, 378, 383, 385, 388, 389, 391, 403,
# 409, 410, 413, 414, 415, 424, 425, 427, 428, 434, 442, 443, 445,
# 447, 450, 454, 455, 458, 464, 468, 469, 473, 474, 476, 479, 482,
# 486, 487, 490, 501, 504, 511}
