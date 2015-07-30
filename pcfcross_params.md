#### r 

The argument r is the vector of values for the distance *r* at which *g(r)* should be evaluated. There is a sensible default. If it is specified, r must be a vector of increasing numbers starting from r[1] = 0, and max(r) must not exceed half the diameter of the window.

#### nsim

Number of simulated point patterns to be generated when computing the envelopes.

#### nrank

Integer. Rank of the envelope value amongst the nsim simulated values. A rank of 1 means that the minimum and maximum simulated values will be used.

#### stoyan (Bandwidth coefficient)

Stoyan and Stoyan (1994, page 285) recommend using the Epanechnikov kernel with support [-h,h] chosen by the rule of thumn h = c/sqrt(lambda), where lambda is the (estimated) intensity of the point process, and c is a constant in the range from 0.1 to 0.2. See equation (15.16). If bw is missing, then this rule of thumb will be applied. The argument stoyan determines the value of c. 
