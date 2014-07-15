#!/usr/bin/python 

# non-linear fitting 

import numpy as np
from scipy.optimize import curve_fit
import pylab as pl


def func(x, a, b, c):
    """fitting function with unknown variables
    """
    return a*np.exp(-b*x) + c


# data points (x,y)
x = np.linspace(0,4,50)
y = func(x, 2.5, 1.3, 0.5)

yn = y + 0.2*np.random.normal(size=len(x))

p0 = [0.5,0.5,0.6]

# p0: initial guess; sigma : data points weights 
popt, pcov = curve_fit(func, x, yn, p0,sigma=None)

#print(curve_fit.__doc__)

yfit = func(x, popt[0], popt[1], popt[2])

pl.subplot(111)
pl.plot(x,yn,'-',label='source')
pl.plot(x,yfit,'r--',label='fit')
pl.legend()
pl.savefig('fit.pdf')
pl.show()

