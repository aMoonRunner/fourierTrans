# 傅里叶变换学习笔记

## 离散傅里叶变换

创建时间 _2023 年 10 月 18 日_

_纸上得来终觉浅，觉知此事要躬行，想搞懂离散傅里叶变换，最好是自己做一遍，回想起来，从来没有真正手算过傅里叶变换_

本文只求理解，会用，不追求严谨的推导

---

首先是离散傅里叶变换的公式，傅里叶变换后得到的$X[k]$为

$$
X[k]=\sum_{n=0}^{N-1}{x[n]e^{-j(2\pi/N)kn}},(0\leq k \leq N-1)
$$

然后是离散傅里叶**反**变换的公式，原信号$x(t)$的采样信号$x(n)$可以表示为

$$
x[n]=\frac{1}{N}\sum_{k=0}^{N-1}{X[k]e^{j(2\pi/N)kn}}
$$

---

对于$e^{-2\pi\frac{k}{N}n}$,如果不好理解，就根据欧拉公式$e^{i\theta}=cos(\theta)+isin(\theta)$先拆分一下，（最好是能够理解）

$$
X[k]=   \sum_{n=0}^{N-1}{x[n]cos(-2\pi\frac{k}{N}n)}+
        j\sum_{n=0}^{N-1}{x[n]sin(-2\pi\frac{k}{N}n)}
        ,(0\leq k \leq N-1)
$$

也就是

$$
X[k]=   \sum_{n=0}^{N-1}{x[n]cos(2\pi\frac{k}{N}n)}-
        j\sum_{n=0}^{N-1}{x[n]sin(2\pi\frac{k}{N}n)}
        ,(0\leq k \leq N-1)
$$

先看$cos$项，对于$X[k]$，可以这样理解，在原信号的每个采样点$x[n]$所在的位置，按照某个特定频率的余弦信号也生成一个点（离散化），逐点相乘，再求和，这样可以寻找原始信号$x[n]$，与这个余弦信号$cos(2\pi\frac{k}{N}n)$之间的相关性

因为这个操作有个很奇妙的地方，如果这两个信号不相关，$X[k]$算出来就是 0

举个例子，假设原信号$x(t)=cos(4\pi x)$,在两个周期内采样 20 个点
$$x[n]=cos(4\pi\times\frac{n}{N})$$

$X[1]$计算结果如下,$X[2]=0$
![](pictures/2023-10-18-22-34-40.png)
$X[2]$计算结果如下,$X[2]=10$
