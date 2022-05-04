This folder contains an algorithm for Simpson's 1/3 rule. This algorithm numerically evaluates the integral of a data set using Simpson's 1/3 rule. Obviously, the numerical integral is not the exact value of the actual integral, and depending on the size of the data, the evaluated integral could be a worse estimate than other methods.

*Inputs*:

**x** = the vector of equally spaced independent variable

**y** = the vector of function values with respect to x

*Outputs*:

**I** = the numerical integral calculated

If an odd number of segments are present in the data, a trapezodial rule will automatically be applied at the end of the Simpson's evaluation.
