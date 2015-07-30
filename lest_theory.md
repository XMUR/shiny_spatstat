---
output: 
  html_document: 
    theme: journal
---

## L-function

Calculates an estimate of the *L*-function (Besag's transformation of Ripley's K-function) for a spatial point pattern.

### Description

This command computes an estimate of the *L*-function for the spatial point pattern *X*. The *L*-function is a transformation of Ripley's *K*-function,

> *L(r) = sqrt(K(r)/pi)*

where *K(r)* is the *K*-function.

For a completely random (uniform Poisson) point pattern, the theoretical value of the *L*-function is *L(r) = r*. The square root also has the effect of stabilising the variance of the estimator, so that *L(r)* is more appropriate for use in simulation envelopes and hypothesis tests.