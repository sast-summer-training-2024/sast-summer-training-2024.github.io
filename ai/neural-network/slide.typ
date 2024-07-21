#import "@preview/touying:0.4.2": *

#let s = themes.metropolis.register(aspect-ratio: "16-9", footer: [#counter(page).display() of #locate((loc) => {counter(page).final(loc).first()})])
#let s = (s.methods.info)(
  self: s,
  title: "（人工）神经网络",
  subtitle: "Artificial Neural Networks",
  date: "2024-8-4",
  institution: "SAST summer training",
  author: "王思图"
)
#let (init, slides, touying-outline, alert, speaker-note) = utils.methods(s)
#show: init

#show strong: alert

#let (slide, empty-slide, title-slide, new-section-slide, focus-slide) = utils.slides(s)
#show: slides

#new-section-slide("What is ANN?")
#slide(title: "The positioning of ANN in the field of AI")[
  #rect("人工智能"+rect("机器学习"+rect(" 统计机器学习"+rect("人工神经网络"))))][人工智能：智能主体（intelligent agent）的研究与设计。智能主体指一个可以观察周遭环境并作出行动以达致目标的系统][
    机器学习：对能通过经验自动改进的计算机算法的研究

    统计机器学习：计算机系统通过运用数据及统计方法提高系统性能的机器学习
  ][
    人工神经网络：一种模仿生物神经网络的结构和功能的数学模型，用于对函数进行估计或近似。能在外界信息的基础上改变内部结构，是一种自适应系统.
  ]


#slide(title: "Definition of ANN")[
  #block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt)[神经网络是由#alert[包含或不包含参数的简单处理单元]相互连接构成的#alert[大规模结构]。它能够#alert[将数据经过由连接和参数决定的流程]进行计算，将输入映射到输出。]
]

#slide(title: "What can it do? What is its advantage?")[
  = 能干什么？
  - 从数据中获取并保存信息（数据驱动任务）
  - 拥有结构化的、相对大量的结构化输入-输出对数据，有明确、可计算的性能评估指标
  省流：常见的有分类、预测、生成任务

  = 能干好什么？
  - 可以形成拥有大规模参数的结构：信息提取和保存能力强，泛化性能好
  - 可扩展性：结构化的输入和输出，便于扩展和复用
  - 非线性：从输入特征空间到输出特征空间的映射是非线性的
  省流：可以做成很大规模，适合建模极为复杂且有大量结构化数据的问题
]

#new-section-slide("What is Machine Learning?")

#slide(title: "Machine Learning Tasks")[
  = Definition
  #block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
  "机器学习任务是由"+alert("模型M、经验E、任务T、性能量度P") + "组成的。 模型的学习是指"+alert("模型M通过得到经验E，在性能量度P意义下相对得到经验E并运行学习算法前在任务T上有所改进。 ")
)
= Hint
在神经网络意义下，模型M即为神经网络本身，经验E为数据，性能量度P为损失函数，任务T为希望使用神经网络解决的机器学习问题。]

#slide(title: "Machine Learning Tasks")[
= Example
== 某个用于图像分类的神经网络模型的学习任务
- 任务T：正确分类输入的图像
- 模型M：这个神经网络
- 经验E：114514张标注了类别的图像数据
- 性能量度P：在某组给定的114张图片上的分类正确率

= teminology
在神经网络学习任务中，我们称使用数据作为经验E，对神经网络使用学习算法进行优化的过程为#alert[训练]
]

#slide(title: "Formal Discription of Machine Learning Tasks")[
  = 如何形式化地建模一个任务
  考虑数据的生成过程。从统计学角度，我们认为数据是某一分布的某种采样。
  = 统计机器学习的三个基础假设
  1. 真实分布假设：认为数据符合某个#alert[确定的真实分布]
  2. 独立同分布假设：认为数据是从真实分布中#alert[独立同分布采样]的
  3. 低维流形假设：自然的#alert[原始数据是低维的流形]嵌入于原始数据所在的高维空间（因为我们无法通过有限空间和时间估计无穷维样本空间上的概率分布）
]
#slide(title: "Data and Experience")[
  = Definition
  #block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
  "对于某个样本空间已知而概率未知的概率空间"+$(Omega, cal(F), PP)$+"，任务T定义为通过独立同分布的采样结果"+${X_i} ~ PP(x) " " i.i.d$+" 估计分布"+$PP$+"。我们称采样结果"+${X_i}$+"为"+alert()[数据]
)
  = Hint
  在该定义下，经验E即为数据。经验E是指通过观察和分析得到的规律、模式和信息。我们注意到数据中确实包含了这些信息。
]

#slide(title: "Performance Metrics and Loss Functions")[
= Why we need Loss Functions
请为以下翻译结果打分：#block(
  fill: luma(230),)[参考译文：故事从洋务运动说起，蒸汽机和内燃机进入中国。这些技术来自西方，归洋鬼子管的。殖民地的人民受洋鬼子的奴役，机械需要地下产的煤和石油来驱动运转，大英帝国的维多利亚女王来管着他们。你以为我跟你闹着玩呢。]#block(
  fill: luma(230),)[待测译文：你有这么高速运转的机械进入中国，记住我给出的原理，小的时候，就是研发人，就研发这个东西的原理是阴间政权管，你知道为为什么有生灵给他运转先位，还有还有专门饲养这个，为什么地下产这种东西，他管着他是五世同堂旗下子孙，我你以为我跟你闹着玩呢。]
]

#slide(title: "Performance Metrics and Loss Functions")[
我们需要一个能够不需要人类参与的性能度量算法，以便神经网络自行迭代而无需人类的干预从而显著提升效率。 由于人类经验的复杂性，我们通常只能够近似地评估模型的性能。在神经网络学习任务中，性能量度P被称为损失函数

= Definition
#block(
  fill: luma(230),
)[对于给定的模型M，和给定的经验E，损失函数定义为函数$cal(L):(M，E) -> RR$，#alert()[损失函数值越大，代表人类认为模型M在任务T上的表现与经验E的表现差距越大]]

= Example
在图像分类任务中，$cal(L)(M，E)$可以为在某一组标注好类别图像数据上，模型在预测这组图像类别时的错误率。 
]

#slide(title: "Performance Metrics and Test Set")[
  = Why we need Test Set
  在神经网络的评估中，一个重要的指标是其泛化能力，即对于在经验E没有涉及的、同时位于任务T的样本空间范围内的点的估计效果。 通常我们会从训练数据中单独分出一小部分，在训练时不作为样本对模型进行训练，并评估模型在这些样本上的性能。 我们称 #alert[在训练时作为样本对模型进行训练的数据集合为数据集，分出来的那一小部分为测试集]。 通常，为了得知模型在训练过程中的性能变化趋势，我们还会从测试集中分出一小部分作为#alert[验证集]，在训练中途多次在验证集上测试模型的性能表现。 
]

#new-section-slide("Construction of ANN")
#slide(title:"Construction of ANN")[
我们在第一节强调了神经网络构成的两个部分：带参数或不带参数的简单结构，以及它们的连接。在本节中将以感知机为例详细说明这两部分。 
]

#slide(title:"Perceptron")[
  线性感知机算法（PLA）1957年由Frank Rosenblatt提出。感知机是二分类的线性分类模型，其输入为实例的特征向量，输出为实例的类别，取值为+1和-1。 

  #block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[perceptron: 
$ f(arrow(x)) = s i g n(arrow(w)^T arrow(x) + b) $
where $w，x in RR^n，b in RR$]
显然，这是一个含参数$w$的，且能够将输入根据参数$w$唯一映射到输出的简单结构。

感知机是神经网络中最常使用、最简单的含参结构。虽然感知机只能进行简单的线性可分分类问题，但通过连接大量感知机，以及更换符号函数为其他非线性函数，我们可以构造出复杂的结构。
]

#slide(title: "Multilayer Perceptron - MLP")[
多层感知机是通过感知机的拼接组成的结构。它是最简单也是最重要的神经网络结构。这个结构在几乎所有的现代深度神经网络中都存在。

#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[multiple layer perceptron: 
$ f(arrow(x)) = f_N circle.tiny dots.c circle.tiny f_0 $

$ f_i(arrow(x)) = sigma_i (W arrow(x) + arrow(b)) $

，where $W in RR^(n_i times n_(i+1))，b in RR^n_(i+1)，i in {0，dots ，N}$]
][#image("imgs/mlp.png")
其中的$h_i、o_i$代表一个将符号函数替换为非线性激活函数的感知机。
]

#new-section-slide("The learning Algorithm of ANN")

#slide(title:"The Training Process of ANN")[
我们已经探讨了机器学习任务，并定义了神经网络中的性能量度——损失函数。另外，我们也已经获得了一个典型的神经网络模型。于是，我们自然需要讨论如何通过使用经验E，即数据，使得神经网络在损失函数意义下获得性能提升。这个优化过程称为神经网络的#alert[训练]。
]

#slide(title:"Maximize Performance and Minimize the Loss Function")[
注意到损失函数的定义，我们假定了模型性能越差，损失函数越大。也就是说，#alert()[我们只需要反过来通过调整M，在经验E上最小化损失函数，就能达到提高模型M在任务T上表现的目的。]于是，神经网络的优化任务可以如下形式化定义：
#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[$ theta^* = arg min_theta cal(L)(M_theta，E) $]
其中$theta$是模型中#alert()[所有的可调整参数]。通过损失函数，我们成功将主观的性能评估和改进问题，转化为了计算和优化损失函数的问题，进而可以通过数值方法解决。可以认为，通过设计损失函数，我们将主观性转移至了损失函数中。 
]

#new-section-slide("Gradient-based Optimization Method")

#slide()[
  在数值计算领域，最常用、效果最好的数值优化算法绝大部分是基于梯度的算法。由于神经网络的简单基本结构的可导性以及参数空间的连续性，我们可以方便地使用梯度法作为优化方法。
]

#slide(title:"Gradient Descent Algorithm")[
基于梯度的优化方法中最易理解的是梯度下降算法：
= Definition
#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[令$ theta_(n+1) = theta_(n) - eta (partial cal(L)(M_theta_n，E))/(partial theta_n) $
则对于一类性质较好的$cal(L)$和$M_theta$，我们有
$ lim_(eta arrow 0，n arrow infinity) theta_n = theta^* $
]
我们知道梯度的反向是该点邻域中函数值下降最快的方向，因此当函数不太差时，沿梯度的反向进行参数的更新都有机会达到函数的最小值。
]

#slide(title:"Gradient Descent Algorithm")[
  = 梯度下降算法的缺点
  1. 该方法对于函数的性质有要求，否则对于参数的初值较为敏感，容易陷入局部极小值。(考虑有两个谷的函数)
  2. 该方法需要在全部样本上计算出梯度，并求平均。这极大的降低了梯度下降的效率。
]

#slide(title:"Stochastic Gradient Descent (SDE)")[
随机梯度下降算法是目前几乎所有神经网络的学习算法。 目前已知的绝大多数算法都是基于这个方法的优化或微调。或者说，#alert()[今天我们所讲的神经网络就是指能够使用随机梯度下降算法进行训练的神经网络]。
= Definition
#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[令$ theta_(n+1) = theta_(n) - eta (partial cal(L)(M_theta_n，{X_i} subset E))/(partial theta_n) $
则对于大多数$cal(L)$和$M_theta$，我们有
$lim_(eta arrow 0，n arrow infinity) theta_n = theta^*$
]
随机梯度下降法使得神经网络能够通过每次选取部分数据计算梯度，即可根据#alert()[学习率$eta$]更新网络参数
]

#slide(title:"How to Compute Gradient")[
  理论上，给定任何不含有不可微结构的确定的网络结构，我们都可以写出梯度的解析表达。然而当网络规模增大时，这显然是不可实现的。因此我们需要寻找数值方法计算参数的梯度。
]

#slide(title:"How to Compute Gradient")[
  = 数值微分法
  #block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[$ hat(theta_(n+1,i))' = (cal(L)(M_(hat(theta_(n,i)) + epsilon)，{X_i}) - cal(L(M_(hat(theta_(n,i)) - epsilon)，{X_i})))/(2 epsilon) $]
该方法的时间复杂度是$cal(O)(N) times cal(O)("forward")$，$N$是参数规模。 通常来说，$cal(O)("forward")$ 与参数量成近似线性关系，因此总的复杂度为$cal(O)(N^2)$。 这个复杂度在参数量很大(现代深度神经网络的参数量通常在千万到百亿级别)时是不可接受的。

我们注意到，在进行网络中靠近输出部分的参数的梯度计算时，两次正向传播中有#alert[大量的重复计算]。我们是否能够找到一种能够复用计算结果的方法来降低重复计算的开销？
]

#slide(title:"Backward Propagation")[
  = 反向传播
  反向传播法是现有的神经网络计算梯度的最优方法。现代深度神经网络训练框架#alert[全部]使用反向传播进行梯度计算。

]

#slide(title:"Backward Propagation")[
  = Theorem 链式法则 
#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[令
$f: RR^a -> RR^b ，g: RR^b -> RR^c ，c in RR^a$，则有
$ partial(g^((i))(arrow(f)(arrow(x))))/(partial x^((j))) = sum_(t = 1)^b (partial g^((i))(f^((1))(arrow(x))，dots，f^((b))(arrow(x))))/(partial f^((t))(arrow(x))) dot (partial f^((t))(arrow(x)))/(partial x^((j))) $
]
可以发现，对于任何完全由复合函数构成的函数，我们都可以将其分为两部分进行计算，这两部分都仅与构成复合函数的部分自身相关。 回顾神经网络的定义，我们发现神经网络#alert[确实由这样可导的简单部分相互连接(即复合)构成的]。这表明我们对于神经网络的任意分割，都可以分别计算它们各自的参数的梯度，再将其按照网络结构的连接关系进行组合得到整个网络的参数的梯度。
]

#slide(title:"Backward Propagation")[
  =  计算图
  计算图是一种有向无环图，其中节点表示计算操作，边表示数据流。计算图提供了一种清晰的方式来表示复杂的计算过程，并允许方便的使用使用链式法则来计算梯度

  计算图由两部分组成: 节点上的运算(通常用圈表示)，以及复合关系(通常用箭头表示)。 一个神经网络唯一对应了一个计算图。
][
  一个典型的计算图:
#image("imgs/graph.svg")
计算图最重要的一点是实现了#alert[局部计算]: 对于每个节点，我们只需要保存正向过程的输入，并且获得下一级节点的梯度，就可以函数关于本节点的梯度。
]

#slide(title:"Backward Propagation")[
  = Algorithm 反向传播算法
  #block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
)[
  1. 前向传播：计算所有激活值和加权输入
    - 计算每一层的输出，同时保存输入输出信息 
	2. 计算损失函数的偏导数
	  -	计算输出层的误差
  - 将误差作为损失函数层的微元系数，并计算对于每个输入的微元系数
	3. 反向传播误差
    - 对于每个已经计算出微元系数的节点的拓扑排序位于更前方的节点，读取传播过来的系数
	  - 使用该系数与本节点保存的信息，计算本节点的微元系数
  - 将系数继续向前面的层传播
]
]
#slide(title:"Backward Propagation")[
#image("imgs/graph.svg")]

#slide(title:"Backward Propagation")[
= 高效性
时间复杂度$cal(O)("forward")$，大部分情况下与参数量呈线性关系
= 实现的简便性
局部计算除了通过信息的复用显著降低了梯度求解的时间复杂度以外，也方便了使用现代编程语言实现神经网络。我们可以简单的将每个计算节点实例化为一个对象，这些相互不耦合的对象可以通过数据的传递完成一个完整神经网络的功能。
= 演示
一个简单“神经网络”的实现和训练
]

#new-section-slide("Generalization of Neural Networks")

#slide(title: "Metrics that Determine the Effectiveness of ANN")[
  在训练过程中，我们通过假设损失函数能够完全反映模型性能来对模型进行改进。然而在实际情况中并不如此。首先，损失函数#alert[并不一定能完全反映模型性能]，例如在生成模型中很难找到一个合适的完全反映生成质量的损失函数。其次，在神经网络学习任务中，我们通过最小化训练集上的误差（通常被称为训练误差）来训练模型。而#alert[机器学习问题和优化问题的本质不同在于，我们也希望泛化误差（也被称为测试误差）很低]。

  泛化能力是指模型在新数据上的表现能力，即模型在训练集之外的数据上仍能保持良好性能的能力。一个理想的机器学习模型不仅在训练集上表现优异，还能在测试集上取得低误差。通过前面的统计学习的数据生成过程假设中的独立同分布假设，我们可以得知训练误差的期望和测试误差的期望在理论上是相同的。然而期望相同不代表表现一致，神经网络在训练集上的实际表现并不一定与测试集上相同。
]

#slide(title:"Underfitting and Overfitting")[
模型的泛化能力面临两个主要挑战：欠拟合和过拟合。
#alert[欠拟合（Underfitting）是指模型在训练集上的表现不佳]，即模型无法捕捉到训练数据中的主要模式或结构。这通常是由于模型过于简单，无法有效学习数据中的复杂关系所致。

#alert[过拟合（Overfitting）是指模型在训练集上表现优异]，但在测试集上的表现较差。这通常是因为在训练过程中过于“记住”训练数据中的噪声和细节，而忽略了数据的整体结构。过拟合通常发生在模型过于复杂或训练数据不足的情况下。

][#image("imgs/fitting.svg", width: 60%)
#image("imgs/fitting2.png", height: 50%)]

#slide(title: "Network structure and hypothesis space")[
  首先我们需要明确神经网络的结构影响了哪些因素。考虑输入n维，输出m维的神经网络。从神经网络的数学描述中可以看出，对于任意结构，任意给定参数的神经网络，其都是从$RR^n$到$RR^m$的函数空间的元素。于是，对于拥有k个可变参数的神经网络，其能表达的函数为${F_theta|theta in RR^k}$。这是上述函数空间的一个子集。我们发现，#alert[不同结构的神经网络实际上是上述函数空间的不同子集]。该空间称为神经网络的#alert[假设空间]。

通过调整神经网络的结构，我们可以调整神经网络的假设空间，进而调整其表达能力。
]

#slide(title:"MLP’s Representation Ability")[
  为了理解神经网络结构设计的目的，我们首先引入表述MLP表达能力的一个定理：
  = Theorem
  
#block(fill: luma(230),
  inset: 8pt,
  radius: 4pt,)[
    $ forall f in cal(L)(RR^n), forall epsilon>0, exists F_theta in M L P, forall x in RR^n, s.t. |F_theta (x)-f(x)|<epsilon $
  ]
  这表明参数量足够大的MLP可以以任意精度逼近任何可测函数。这是否意味着我们对于任何学习任务都可以直接选取一个足够大的MLP在训练集上进行训练呢？
]
#slide(title:"MLP’s Representation Ability")[
  
  #alert[机器学习任务是这样的，模型只需要表达能力足够强就可以了，而我们让模型进行学习需要考虑的就很多了，梯度下降能不能找到最优解，在训练集上训练后是否会过拟合，都需要深思熟虑。]

  例如，严格来说，如果我们能够完全拟合训练集分布，那么我们会得到一个多点离散分布。这是离散化采样带来的必然结果。但这个估计显然是不合理的，例如我们如果在图像生成任务上完全拟合训练集，那么使用训练后的模型生成图片就变成了从训练集中随机挑选一张图片。
]

#slide(title:"MLP’s Representation Ability")[
  = Review
  = 机器学习问题和优化问题的根本区别在于，除了希望训练误差很低，我们也希望泛化误差很低。]

#slide(title:"Occam’s Razor Principle")[
  = 奥卡姆剃刀原则
  从理论上来说，仅通过离散化采样，我们永远无法完整得知真实分布。我们需要从所有符合条件的可能的分布中选取一个。#alert[奥卡姆剃刀原则（Occam’s Razor）]在逻辑学中是一条重要的指导原则。该原则陈述为如果关于同一个问题有许多种理论，每一种都能作出同样准确的预言，那么应该#alert[挑选其中最简单的]。尽管越复杂的方法通常能做出越好的预言，我们更倾向于引入外部因素更少的方法。例如给定数据集{(0,0), (1,1), (2,2)}，我们最好使用$y=a x$作为模型对数据集进行拟合，而非$y = sum_(k=1)^infinity a_k x^k$.

  = Thinking
  奥卡姆剃刀原则的另一种表述为：“在作出断言时，使用的假设越少越好”。这对应的是我们需要增大假设空间还是减小假设空间？
]

#slide(title: "Problem Structure and Network Structure")[
  根据奥卡姆剃刀原则，我们应该使得模型的假设空间#alert[在包含符合先验信息的所有可能假设的情况下尽可能小]。这表明我们需要对神经网络的结构进行合理的设计，排除掉不符合先验信息的假设，进而提高神经网络的泛化能力。

  然而，先验信息通常很难有显式的表达，并且对于各类不同任务，先验信息也大相径庭。事实上，深度神经网络的相当一部分研究都是通过研究甚至猜测先验信息的结构，进而设计出符合特定问题的网络结构，或调整问题结构使得问题符合神经网络的假设空间。#alert[神经网络的结构设计一定依赖于对于特定问题结构或者数据的信息结构的研究]。
]

#new-section-slide("Immutability and the Design of Network structures")

#slide()[
  = 不变性
  不变性是一种常见的问题结构。通过不变性，我们可以将解决全局问题缩小为解决结构相似的局部问题，再通过局部问题的解得到全局问题的解。下面阐述一些常见问题中的不变性，以及其对应的神经网络结构。
]

#slide(title:"Translation Invariance and CNN")[
平移不变性是指系统在受到平移操作时，其性质保持不变。这种不变性在图像处理、语音识别等领域中非常常见。例如，当我们处理图像时，无论#alert[图像]中的物体在什么位置，我们都希望模型能够识别出相同的物体。或者，当我们处理#alert[语音]时，无论某个音节出现在音频的哪一时刻，我们都希望识别出相同的音节。

为了解决平移不变性问题，#alert[卷积神经网络（Convolutional Neural Network, CNN）]被广泛应用。CNN通过使用一组特定的的卷积核在输入上进行卷积操作，使得网络能够提取平移不变的特征。
]

#slide(title:"CNN")[
  卷积操作是CNN的核心，通过在输入上应用卷积核来提取局部特征。每个卷积核扫描整个输入，生成一个特征张量。这些特征张量能够捕捉不同层次的特征，如边缘、纹理、形状等。卷积操作可以表示为如下形式：
#block(fill: luma(230),
  inset: 8pt,
  radius: 4pt,)[
$ h_(i dots j) = sum_m dots sum_n x_(i+m, dots, j+n) w_(m dots n) $
其中h为输出的特征，x是输入，w是卷积核。
]][
一个二维卷积的过程可以可视化为下图：
#image("imgs/convolution.png")
]

#slide(title:"CNN")[
卷积所得结果中，每个特征图像素点取值依赖于输入图像中的某个区域，该区域被称为#alert[感受野]。在卷积神经网络中，感受野是特征图上的点对应输入图像上的区域。感受野内每个元素数值的变动，都会影响输出点的数值变化。当仅增加卷积网络深度时，感受野将会增大（请自行推导），输出特征图中的一个像素点将会包含更多的图像语义信息。
][
卷积计算不局限于前面的简单过程，实际应用时，处理的问题要复杂的多。例如：对于彩色图片有RGB三个通道，需要处理多输入通道的场景，相应的输出特征图往往也会具有多个通道。在神经网络的计算中常常是把一个批次的样本放在一起计算，所以卷积算子需要具有批量处理多输入和多输出通道数据的功能。可以注意到，我们可以使用“一片”输入和“一片”卷积核获得“一片”特征图。显然，我们可以通过输入和卷积核的排列组合达到多通道输入输出的目的。
]

#slide(title:"Feature Space Invariance and Embedding")[
  回顾先前提到的低维流形假设：自然的原始数据是低维的流形嵌入于原始数据所在的高维空间。一个显然的问题是，我们能否使用低维描述表示这个流形？考虑可维流形的性质，我们只需要学习一个从高维欧空间到低维欧空间的可微映射来表示该流形。我们称该问题为#alert[嵌入（embedding）]问题。

嵌入过程要求保持特征空间的不变性，即在低维空间中保留原始数据的特征结构和相似性：
#block(fill: luma(230),
  inset: 8pt,
  radius: 4pt,)[
设  $f: cal(X) -> RR^d$  是从高维空间到低维空间的嵌入映射，那么对于任意两个数据点$x_i, x_j in cal(X)$ ，它们在低维空间中的距离或相似性  $|f(x_i) - f(x_j)|$  应该与它们在高维空间中的距离或相似性$|x_i - x_j|$  保持一致或近似一致。]
]

#slide(title:"Feature Space Invariance and Embedding")[特征空间中的点#alert[通常包含足够的信息，我们甚至能够仅通过特征空间还原原始数据]。这意味着即使经过降维处理，特征空间中的表示仍然应保留原始数据的关键特征和模式。同时，特征空间的维度通常远小于原始数据空间的维度。通过降低维度，我们能够#alert[去除数据中的冗余信息，提取出对数据描述最重要的特征]。这种低维表示有助于减少计算复杂度和存储需求。]

#slide(title: "Autoencoder")[
  = 自回归编码器（Autoencoder, AE）

自回归编码器实际上是一种生成模型。它由两个主要部分组成：编码器（Encoder）和解码器（Decoder）。编码器将高维输入数据映射到低维特征空间，而解码器则从低维特征空间中重构出原始数据。

#block(fill: luma(230),
  inset: 8pt,
  radius: 4pt,)[
编码器：$z = f(x)$ ，解码器：$hat(x) = g(z)$，
其中$x in cal(X), z in RR^d$
  ]
  特征空间不变性要求编码器将原始数据映射到特征空间中时，能够保留数据的关键特征和结构。自回归编码器通过保证能够仅通过特征空间中的编码向量还原原始数据来保证特征空间不变性。

自回归编码器通过#alert[最小化重构误差]来确保特征空间中的点能够有效地还原原始数据。重构误差通常通过均方误差来衡量：

$ cal(L)(x, hat(x)) = |x - hat(x)|^2 $
通过最小化重构误差，我们能够让编码器在学习到从原空间到低维流形的映射的同时使解码器学习到从低维流形到原空间的映射。编码器和解码器通常具有对称的结构，以确保特征空间中点的表示和原始数据之间的映射关系保持一致。
]

#slide(title:"Embedding")[
  “嵌入”在现代神经网络设计中具有极为重要的地位。实际上，嵌入就是数据在特征空间中的表示。这使得嵌入具有结构和表示上的极为优良的性质。例如，词向量的“可加性”正是来源于特征空间的不变性。
#image("imgs/wordvec.jpeg")]

#slide(title:"Transition Probability Invariance and RNN")[
  序列处理问题广泛存在于许多领域，包括自然语言处理、时间序列预测、语音识别等。这些问题通常涉及从输入序列中提取信息（序列识别）或生成新的序列（序列生成）。

在序列处理问题中，转移概率不变性是一个重要的概念。#alert[它指的是在序列的不同时间步之间，状态转移的概率保持不变]。换句话说，模型在每个时间步的状态转移规则是一致的，不依赖于时间步的具体位置。这一性质确保了模型能够一致地处理整个序列中的数据，无论序列的长度或位置如何。我们可以形式化地表述这一点：
#block(fill: luma(230),
  inset: 8pt,
  radius: 4pt,)[
设$h_t in RR^d$表示时间步$t$的隐藏状态($h$是特征空间中的向量），$x_t$表示时间步$t$的输入数据，那么隐藏状态的更新规则可以表示为：
$ h_t = f(h_(t-1), x_t, t) $
其中$f$是状态转移函数。]这意味着，对于所有的$t$，状态转移函数$f$的形式和参数都不变。
]

#slide(title: "RNN")[
  递归神经网络（Recurrent Neural Network, RNN）是一类适合处理序列数据的神经网络模型。RNN的设计基于特征空间不变性和转移概率不变性，能够有效捕捉序列数据的动态特征和时间依赖性。

RNN由一系列递归单元组成，每个单元在每个时间步接收当前输入和前一个时间步的隐藏状态，并输出新的隐藏状态。这种结构可以如下形式化表示：
#block(fill: luma(230),
  inset: 8pt,
  radius: 4pt,)[
$h_t = sigma(W_h h_(t-1) + W_x x_t + W_t t + b_h)$

$y_t = sigma(W_y h_t + b_y)$]
][RNN通常可以用时序图来表示：
  #figure(image("imgs/rnn.png", width: 70%))]

#slide(title: "Feature Space Invariance in RNN")[
  在RNN中，特征空间不变性通过两处设计来实现。首先是#text(fill: purple.darken(10%))[共享权重]：RNN在每个时间步使用相同的权重，确保所有时间步的输入和隐藏状态都在相同的特征空间中处理。其二是#text(fill: purple.darken(10%))[隐藏状态的连续性]：隐藏状态在时间序列中连续传递，确保每个时间步的特征表示与前后时间步的特征表示之间的关系保持一致。
]

#new-section-slide("Summary")

#slide()[
  神经网络算法是典型的统计机器学习算法：从数据中获取信息，进而实现特定任务。通过使用基于梯度的优化算法，我们在数据上训练神经网络，使其在任务上具有更好的表现。通过一些对于数据和真实分布性质的假定，我们期望神经网络能够拥有超越经典优化问题的特点——泛化性。同时，通过研究问题、数据与信息的结构，我们设计和改进神经网络的结构，进而提高神经网络的训练和泛化性能。希望大家能够体会到机器学习的核心：数据与信息，任务与模型，进而理解并适当使用神经网络这一强大的工具。
]

#slide()[
  = 请自行思考以下关键词的含义，以及它们之间的关系：
  #columns(3)[
    - 任务

    - 经验

    - 性能量度
    - 模型

    - 结构

    - 数据

    - 特征
    - 优化
    - 学习
    - 泛化
    - 估计
    - 统计学习的三个假设
    - 问题结构
    - 不变性
    - 样本空间
    - 特征空间
    - 嵌入（Embedding）
    - 数据生成过程
    - 计算图
    - 局部计算
    - 梯度法
    - 损失函数
    - 转移概率
    - 可优化参数
    - 表达能力
    - 过拟合
    - 欠拟合
  ]
]