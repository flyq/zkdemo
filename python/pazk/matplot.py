import numpy
import matplotlib.pyplot as pyplot

x = numpy.arange(-2.5,2.5, 0.01)
p1 = numpy.polynomial.Polynomial.fromroots((-2,0,2))
y1 = p1(x)
p2 = numpy.polynomial.Polynomial((0))
y2 = p2(x)

pyplot.title(r'$y = x^3 - 4x$')
pyplot.plot(x, y1)
pyplot.plot(x, y2)

pyplot.show()
