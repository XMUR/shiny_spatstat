---
output: 
  html_document: 
    theme: journal
---

## Quadrat counting for a point pattern

Divides window into quadrats and counts the numbers of points in each quadrat.

# Arguments nx and ny

Numbers of rectangular quadrats in the x and y directions. 

### Details

**If X is a point pattern**, then by default, the window containing the point pattern *X* is divided into an (nx x ny) grid of rectangular tiles or ‘quadrats’. (If the window is not a rectangle, then these tiles are intersected with the window.) The number of points of *X* falling in each quadrat is counted. These numbers are returned as a contingency table.

 
