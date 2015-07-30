---
output: 
  html_document: 
    theme: journal
---

## Kernel Smoothed Intensity of Point Pattern

Compute a kernel smoothed intensity function from a point pattern.

# Argument sigma

Standard deviation of isotropic Gaussian smoothing kernel. Either a numerical value, or a function that computes an appropriate value of sigma.

### Details

It computes a fixed-bandwidth kernel estimate (Diggle, 1985) of the intensity function of the point process that generated the point pattern *x*.

