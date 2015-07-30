---
output: 
  html_document: 
    theme: journal
---

## Pair Correlation Function of Point Pattern

Estimates the pair correlation function of a point pattern using kernel methods.

### Details

The pair correlation function *g(r)* is a summary of the dependence between points in a spatial point process. The best intuitive interpretation is the following: the probability *p(r)* of finding two points at locations *x* and *y* separated by a distance *r* is equal to

> *p(r) = lambda^2 * g(r) dx dy*

where *lambda* is the intensity of the point process. For a completely random (uniform Poisson) process, *p(r) = lambda^2 * dx * dy* so *g(r) = 1*. Formally, the pair correlation function of a stationary point process is defined by

> *g(r) = K'(r)/ ( 2 * pi * r)*

where *K'(r)* is the derivative of *K(r)*, the reduced second moment function (aka “Ripley's K function”) of the point process. See Kest for information about *K(r)*.

For a stationary Poisson process, the pair correlation function is identically equal to 1. Values *g(r) < 1* suggest inhibition between points; values greater than 1 suggest clustering.