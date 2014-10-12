from numpy import *
from pylab import *
from matplotlib import rc, rcParams
import matplotlib.units as units
import matplotlib.ticker as ticker
import sys
import os
import matplotlib.pyplot as plt
import numpy as np

rc('text',usetex=True)
rc('font',**{'family':'serif','serif':['Separation energy for nickel isotopes']})
title(r'{\bf Population of hares and lynx from 1900 to 1920}', fontsize=20)     
# Load in data file
popdata = loadtxt("popdata.dat")
# Make arrays containing x-axis and hares and lynx populations
year = popdata[:,0]
hares = popdata[:,1]
lynx = popdata[:,2]  
axis([1895,1925,0, 100.0])
# Put lables on axes
xlabel(r'Year',fontsize=20)
ylabel(r'Numbers of hares and lynx ',fontsize=20)
# Then plot
plot(year, hares ,'b-*',   year, lynx, 'r:.',  markersize=7)
legend(('Hares','Lynx'),
           'upper right', shadow=False, fancybox=False,prop={"size":18})
legend(loc='upper right')
savefig('popdata.pdf', format='pdf')

show()
