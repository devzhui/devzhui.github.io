---
layout: post
title: 'Accelerated Doubly Stochastic Gradient Algorithm for Large-scale Empirical Risk Minimization'
date: '2017-09-08'
header-img: "img/post-bg-opt.jpg"
tags:
     - Optimization
     - ADSG
     - ERM
     - Doubly stochastic algorithm
     - Momentum
     - Accelerating
author: 'zhui'
---

## Accelerated Doubly Stochastic Gradient Algorithm for Large-scale Empirical Risk Minimization

[Paper Link](/paper/ijcai-17-adsg.pdf)

### Problem
solve large scale empirical risk minimization problem for learning tasks.

### method
* a doubly stochastic algorithm with 
* a novel accelerating multi-momentum technique

### Convergence
* general convex case
  $O( log(1/ \epsilon ) / \sqrt{\epsilon} )$
* strongly convex
  $O( (n+ \sqrt{n \kappa}) log(1/ \epsilon) )$


***
|   Method    |  S.A.  |    V.O.     | General Convex                           | Strongly Convex                          |
| :---------: | :----: | :---------: | :--------------------------------------- | :--------------------------------------- |
|     APG     | $O(n)$ |   $O(d)$    | $O(dn \sqrt{L/ \epsilon})$               | $O(dn \sqrt{\kappa}log\frac{1}{\epsilon})$ |
|    RBCD     | $O(n)$ | $O(\Omega)$ | $O(dnL/ \epsilon)$                       | $O(dn\kappa log\frac{1}{\epsilon})$      |
|    APCG     | $O(n)$ | $O(\Omega)$ | $O(dn \sqrt{L/ \epsilon})$               | $O(dn \sqrt{\kappa}log\frac{1}{\epsilon})$ |
|    SVRG     | $O(1)$ |   $O(d)$    | $O(d(n+L/\epsilon)log\frac{1}{\epsilon})$ | $O(d(n+\kappa) log\frac{1}{\epsilon})$   |
|  Katyusha   | $O(1)$ |   $O(d)$    | $O(d(n+\sqrt{nL/\epsilon})/\sqrt{\epsilon}$ | $O(d(n+\sqrt{n \kappa}) log\frac{1}{\epsilon})$ |
| MRBCD/ASBCD | $O(1)$ | $O(\Omega)$ | $O(d(n+L/\epsilon)log\frac{1}{\epsilon})$ | $O(d(n+\kappa)log\frac{1}{\epsilon})$    |
|    ADSG     | $O(1)$ | $O(\Omega)$ | $O(d(n+\sqrt{nL/\epsilon})log\frac{1}{\epsilon})$ | $O(d(n+\sqrt{n \kappa}) log\frac{1}{\epsilon})$ |

***

### Doubly stochastic algorithm
#### SGD
* Variance Reduction: SAGA,SVRG->Katyusha
* Nesterov’s optimal accelerated

#### SCD
* Randomized Block Coordinate Descent (RBCD) -> APPROX,[ Lin et al., 2015b ]
* Drawback : all samples have to be accessed in each iteration.

#### Doubly
* $ n $ and $ d $ are large at the same time.
* randomness from sample choosing and coordinate selection
* Mini-batch Randomized Block Coordinate Descent with variance reduction(linear convergence in strongly convex case)
* Accelerated Stochastic Block Coordinate Descent (ASBCD) (incorporates RBCD into SAGA)

***

### ADSG
Accelerated Doubly Stochastic Gradient algorithm.
* Contribution 1: two novel coupling steps and  three momenta
* Contribution 2: prove convergence rate
  Further, Experiments with more than 10M samples and 1M features.

#### Assumption
* Each function $f_i$ is L-smooth
* Average function F is $L_b$-smooth 
* Function P is $\mu$-strongly convex

#### Momentum Accelerating Technique
randomness is involved in data point sampling, making the acceleration much harder.
* outer-inner loop manner [ Lin et al., 2015a ]
* from a dual perspective [ Shalev-Shwartz and Zhang, 2014 ] 
* or under a primal-dual framework [ Zhang and Xiao, 2015 ]


