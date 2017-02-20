---
layout: post
title: 'MathJax测试,公式求导'
date: '2017-02-19'
header-img: "img/post-bg-unix.jpg"
tags:
     - latex
     - mathjax
author: 'zhui'
---

原函数

$$
\begin{equation}
    F(V) = 
    \frac{1}{2} \sum_{t=1}^T \sum_{i =1}^N \sum_{j=1}^M
    I_{ij}^t [R_{ij}^t-(U_i^t)^T V_j ]^2
    - \lambda_P \sum_{j=1}^M \sum_{q =1}^K \sum_{p=1}^K 
    I(q >_j^+ p) \ln \frac{1}{1 + e^{-(V_{jq} -V_{jp})}}
    + \frac{\lambda_V}{2} \sum_{i=1}^{M} \| V_i \|_F^2
\end{equation}
$$

逐项求导,`Part 1`:
$$
\begin{align}
    Part 1 =  \frac{1}{2} \sum_{t=1}^T \sum_{i =1}^N \sum_{j=1}^M
    I_{ij}^t [R_{ij}^t-(U_i^t)^T V_j ]^2
\end{align}
$$

$$
\begin{align*}
    \nabla V_{jk} &=  - \sum_{t=1}^T \sum_{i =1}^N      I_{ij}^t [R_{ij}^t -　U_i^T V_j ] U_{ik}^t 
\end{align*}
$$


逐项求导,`Part 2`:
$$
\begin{align}
    Part 2 = - \lambda_P \sum_{j=1}^M
	\sum_{q =1}^K \sum_{p=1}^K 
	I(q >_j^+ p) \ln \frac{1}{1 + e^{-(V_{jq} -V_{jp})}} 
\end{align}
$$

$$
\begin{align*}
    \frac{\nabla ln(1/h(x))}{\nabla x} 
        &= h(x) \frac{\nabla 1/h(x)}{\nabla x} \\
        &= -h(x)*h(x)^{-2} \frac{\nabla h(x)}{\nabla x} \\
        &= -\frac{1}{h(x)} \frac{\nabla h(x)}{\nabla x} \\
        \\
    h(x) = 1 + e^{-(V_{jq} -V_{jp})} , x =  V_{jq}
    \\
    \nabla V_{jq} &= -\frac{1}{h(x)} *[- e^{-(V_{jq} -V_{jp})}]  \\
        &= \frac{ e^{-(V_{jq} -V_{jp})}}{1 + e^{-(V_{jq} -V_{jp})}} 
    \\
    h(x) = 1 + e^{-(V_{jq} -V_{jp})} ,x =  V_{jp} \\
    \nabla V_{jp} &= -\frac{1}{h(x)}  *[e^{-(V_{jq} -V_{jp})}] \\
    &= \frac{ - e^{-(V_{jq} -V_{jp})}}{1 + e^{-(V_{jq} -V_{jp})}} 
    \\
    \nabla V_{jk} &= - \lambda_P \sum_{p=1}^K I(k >_j^+ p) \nabla V_jq
        - \lambda_P \sum_{q=1}^K I(q >_j^+ k) \nabla V_jp \\
     &=  - \lambda_P \sum_{p=1}^K I(k >_j^+ p) \frac{ e^{-(V_{jk} -V_{jp})}}{1 + e^{-(V_{jk} -V_{jp})}} 
     - \lambda_P \sum_{q=1}^K I(q >_j^+ k)  \frac{ - e^{-(V_{jq} -V_{jk})}}{1 + e^{-(V_{jq} -V_{jk})}} 
\end{align*}
$$

逐项求导,`Part 3`:
$$
\begin{align}
	Part 3 = \frac{\lambda_V}{2} \sum_{i=1}^{M} \| V_i \|_F^2
\end{align}
$$

$$
\begin{align*}
	\nabla V_{jk} &=  \lambda_V V_{jk}
\end{align*}
$$

Finally $$\nabla V_{jk}$$ is:
$$
\begin{align}
\nabla V_{jk} &= 
	\frac{1}{2} \sum_{t=1}^T \sum_{i =1}^N \sum_{j=1}^M
	I_{ij}^t [R_{ij}^t-(U_i^t)^T V_j ]^2 
    + \lambda_V V_{jk}
    - \lambda_P \sum_{p=1}^K I(k >_j^+ p) \frac{ e^{-(V_{jk} -V_{jp})}}{1 + e^{-(V_{jk} -V_{jp})}} 
    - \lambda_P \sum_{q=1}^K I(q >_j^+ k)  \frac{ - e^{-(V_{jq} -V_{jk})}}{1 + e^{-(V_{jq} -V_{jk})}} 
\end{align}
$$

> 如有任何知识产权、版权问题或理论错误，还请指正。
>
> 转载请注明原作者及以上信息。
