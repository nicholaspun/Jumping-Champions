# Summer-Research-2016

This repository contains relevant scripts and functions used to create prime signals using generalized sampling theory. The code is written in MATLAB.

The following is a quick rundown of the contents of each folder:

1.  Outlook - Contains functions that can be used for future research projects
  * calc_alpha_prime.m - Function used to calculate the new derivatives of the an array shifted by "alpha".  
  * calc_t_alpha.m - Function used to calculate the time values of an array shifted by "alpha". 
2.  borrowed-functions
  * PrimesDataBase.mat - A database used by function "nthprime".
  * nthprime.m - Function used to find the nth prime. Taken from [here](https://www.mathworks.com/matlabcentral/fileexchange/27073-nthprime). Huge thanks to the person who wrote this code, it was extremely useful and efficient :)
3.  functions
  * calc_t_prime.m - Function used to calculate the initial derivatives of a given lattice of time values. 
  * findgaps.m - Function used to calculate the gaps corresponding to a specific frequency in a Fourier transform.
  * greconv2.m - Function used to reconstruct a signal using generalized sampling theory. 
  * primorial.m	- Function used to calculate the nth primorial.
  * reconstruct.m - Function used to reconstruct a signal using classical shannon sampling theory. 
4.  scripts
  * signal_generation.m - Script used to generate the prime signals using generalized sampling theory.

For more information on generalized sampling theory, a great resource can be found [here](http://ieeexplore.ieee.org/document/4895514/?reload=true&arnumber=4895514), a paper written by Yufang Hao and Achim Kempf. 
