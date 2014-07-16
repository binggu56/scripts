
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint
#plt.ion()

m = 1.0
# solve the system dx/dt = p/m, dp/dm = -dV for h.o.

def f(y, t):
        xi = y[0]
        pi = y[1]
        # the model equations (see Munz et al. 2009)
        f0 = pi/m
        f1 = -0.5*xi 
        return [f0, f1]

# initial conditions
x0 = -1.0                  # initial zombie population
p0 = 1.0               # initial death population
y0 = [x0, p0]       # initial condition vector
t  = np.linspace(0, 50., 1000)   # time grid

# solve the DEs
soln = odeint(f, y0, t)
x = soln[:, 0]
p = soln[:, 1]

# plot results
plt.figure()
plt.subplot(211)
plt.plot(t, x, label='position')
plt.subplot(212)
plt.plot(t, p, label='momentum')
#plt.xlabel('Days from outbreak')
#plt.ylabel('Population')
#plt.title('Zombie Apocalypse - No Init. Dead Pop.; No New Births.')
plt.legend(loc=0)

plt.show()
