---
output: 
  html_document: 
    theme: journal
---

## Nearest Neighbour Distance Function G

Estimates the nearest neighbour distance distribution function *G(r)* from a point pattern in a window of arbitrary shape.

### Details

The nearest neighbour distance distribution function (also called the “*event-to-event*” or “*inter-event*” distribution) of a point process *X* is the cumulative distribution function *G* of the distance from a typical random point of *X* to the nearest other point of *X*.

An estimate of *G* derived from a spatial point pattern dataset can be used in exploratory data analysis and formal inference about the pattern (Cressie, 1991; Diggle, 1983; Ripley, 1988). In exploratory analyses, the estimate of *G* is a useful statistic summarising one aspect of the “clustering” of points. For inferential purposes, the estimate of *G* is usually compared to the true value of *G* for a completely random (Poisson) point process, which is

> *G(r) = 1 - exp( - lambda * pi * r^2)*

where *lambda* is the intensity (expected number of points per unit area). Deviations between the empirical and theoretical *G* curves may suggest spatial clustering or spatial regularity.