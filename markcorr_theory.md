---
output: 
  html_document: 
    theme: journal
---

## Mark Correlation Function

Estimate the marked correlation function of a marked point pattern.

### Details

For a point process *X* with numeric marks, Stoyan's mark correlation function *k[mm](r)*, is

> *k[mm](r) = E[0u](M(0) * M(u))/E(M * M')*

where *E[0u]* denotes the conditional expectation given that there are points of the process at the locations *0* and *u* separated by a distance *r*, and where *M(0),M(u)* denote the marks attached to these two points. On the denominator, *M,M'* are random marks drawn independently from the marginal distribution of marks, and *E* is the usual expectation