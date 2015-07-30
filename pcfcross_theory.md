---
output: 
  html_document: 
    theme: journal
---

## Multitype pair correlation function (cross-type)

Calculates an estimate of the cross-type pair correlation function for a multitype point pattern.

### Details

The cross-type pair correlation function is a generalisation of the pair correlation function pcf to multitype point patterns.

For two locations *x* and *y* separated by a distance *r*, the probability *p(r)* of finding a point of type *i* at location *x* and a point of type *j* at location *y* is

> *p(r) = lambda[i] * lambda[j] * g[i,j](r) dx dy*

where *lambda[i]* is the intensity of the points of type *i*. For a completely random Poisson marked point process, *p(r) = lambda[i] * lambda[j] so g[i,j](r) = 1*. Indeed for any marked point pattern in which the points of type *i* are independent of the points of type *j*, the theoretical value of the cross-type pair correlation is *g[i,j](r) = 1*.

For a stationary multitype point process, the cross-type pair correlation function between marks i and j is formally defined as

> *g(r) = K[i,j]'(r)/ ( 2 * pi * r)*

where *K[i,j]'(r)* is the derivative of the cross-type *K* function *K[i,j](r)* of the point process.