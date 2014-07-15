#!/usr/bin/python

import numpy as np
import pylab as pl

data = np.genfromtxt(fname='en.dat')
dat = np.genfromtxt(fname='../../helium_solid/dat12/energy.dat')

pl.subplot(211)
pl.xlim(0,4)
pl.title('two-steps fitting alg')
pl.ylabel('Energy [hartree]')
#pl.plot(data[:,0],data[:,2],'b--',linewidth=2,label='Potential')
pl.plot(dat[:,0],dat[:,4],'r-',linewidth=2,label='lqf')
#pl.plot(data[:,0],data[:,3],'g-.',linewidth=2,label='Quantum Potential')
pl.plot(data[:,0],data[:,4],'k-',linewidth=2,label='Energy')
#pl.legend(bbox_to_anchor=(0.5, 0.38, 0.42, .302), loc=3,ncol=1, mode="expand", borderaxespad=0.)

pl.subplot(212)
pl.xlim(0,4)
pl.xlabel('time [a.u.]')
pl.ylabel('Energy [hartree]')
pl.plot(data[:,0],data[:,1],'r--',linewidth=2,label='Kinetic')
#pl.plot(dat[:,0],dat[:,1],'k-',linewidth=2)
pl.yscale('log')
pl.legend()

pl.savefig('energy.pdf')
pl.show() 
