---
layout: post
title: 'Accelerated Doubly Stochastic Gradient Algorithm for Large-scale Empirical Risk Minimization'
date: '2017-09-08'
header-img: "img/post-bg-unix.jpg"
tags:
     - optimation
     - SGD
     - SCD
     - Doubly staochastic algorithm
author: 'zhui'
---

## Accelerated Doubly Stochastic Gradient Algorithm for Large-scale Empirical Risk Minimization

### Problem
solve large scale empirical risk minimization problem for learning tasks.

### method
* a doubly stochastic algorithm with 
* a novel accelerating multi-momentum technique

### Convgence
* general convex case
$O( log(1/ \epsilon ) / \sqrt{\epsilon} )$
* strongly convex
$O( (n+ \sqrt{n \kappa}) log(1/ \epsilon) )$


***

### Doubly staochastic algorithm
#### SGD
* Variance Reduction: SAGA,SVRG->Katyusha
* Nesterov’s optimal accelerated

#### SCD
* Randomized Block Coordinate Descent (RBCD) -> APPROX,APCG
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
* Average funvtion F is $L_b$-smooth 
* Function P is µ-strongly convex

#### Momentum Accelerating Technique



