# 课前准备

## Before Anything Else

有一些基本的事情需要在开始之前准备好. 最重要的是,

- __不要用国内的搜索引擎!__
- __不要用国内的搜索引擎!!__
- __不要用国内的搜索引擎!!!__

另外, 为了能快速获取正确的信息:

- __在同时有中英文文档时, 请尽量查看英文文档__, 不然你会对什么是 _爪哇_ 编程语言感到困惑;
- __请避免 CSDN__, 除非你不求甚解, 只想不计后果解决问题;
- __请谨慎使用 ChatGPT__, 它说的大多数是对的, 但是很多时候并不全对.

所以:

- __优先查找官方文档__, 包括 __官方网站的文档__, __Linux Manual (man)__, __官方 Repo 与 Issue__, __Help Page (-h / --help / -?)__ 等;
- __其次查找官方论坛和 Stack Overflow 等论坛__;
- __其次找论坛和博客, 当然找学长不失为好方法__;

## Linux

你需要一个 Linux / Mac 系统.

- __如果你是 Linux / Mac 用户:__ 恭喜你, 你已经拥有了一个 Linux / Mac 系统. 你可以考虑直接使用你自己的系统; 如果你怕误操作, 可以考虑使用 [__Docker__](https://www.docker.com/products/docker-desktop/) / [__Lxc__](https://linuxcontainers.org/) / [__Systemd-nspawn__](https://wiki.debian.org/nspawn) / VMWare (找不着) / [__VirtualBox__](https://www.virtualbox.org/wiki/Downloads) 等容器化 / 虚拟化技术来制造一个干净的 Linux 环境.
- __如果你是 Windows 用户:__ 我推荐你成为 Linux / Mac 用户这样你就能使用原生的 Linux / Mac 系统了 (这很重要!). 当然, 如果你享受在 Windows 上配环境, 想干个啥都要与一坨奇怪的环境问题做斗争, 那么欢迎使用 [__WSL2__](https://learn.microsoft.com/en-us/windows/wsl/install) 或者也可以使用 [__Hyper-V__](https://ubuntu.com/server/docs/how-to-set-up-ubuntu-on-hyper-v) / VMWare / [__VirtualBox__](https://www.virtualbox.org/wiki/Downloads) 等虚拟化技术或 [__Docker__](https://www.docker.com/products/docker-desktop/) 来制造一个干净的 Linux 环境.
- __如果你是什么别的系统的用户:__ 反正我没见过, 但是既然你已经开始使用奇怪的系统了, 怎么制造一个 Linux 环境应该不是问题.

## Git

你需要为你的环境安装 Git. [Git 的官方网站](https://git-scm.com/downloads) 提供了详细的安装说明; 大致分解为:

- __Linux:__ 你可以使用你的包管理器安装 Git, 例如 `sudo apt install git` 或 `sudo yum install git`.
- __Mac:__ 你可以使用 [Homebrew](https://brew.sh/) 安装 Git, 例如 `brew install git`.
- __Windows:__ 你可以使用 [Git for Windows](https://gitforwindows.org/).

## VSCode / JetBrains IDEs

你需要一个现代的 IDE. [__VSCode__](https://code.visualstudio.com/) 是一个中规中矩的选择. 但考虑到学校有 JetBrains IDE 的正版教育版授权, 你可以参考 [JetBrains 系列软件安装指南](https://software.tsinghua.edu.cn/JetBrains/JetBrainsSeriesSoftwareInstallationGuide.pdf) 进行安装; 其他同学可以申请自己学校的 JetBrains 授权.

如果你习惯使用 Vim / Notepad 进行开发, 你的境界已经超脱了这个课程的范畴 (雾). 但如果你的开发方式停留在 CodeBlocks / DevCpp, 我建议转而使用现代的 IDE: 一款优秀的 IDE 能够显著提高你的开发效率, 这也是我希望在课程中传递的中心观点之一.

## Learning Materials

在之前的暑培 / 基础技能培训中, 已经有很多学长细致地讲解过 Linux / Git 的使用. 为了避免同质化与节约时间, 我将这些材料放在这里, 辅助你进行学习:

- 2023 年暑培 Linux / Git: [sast2023-linux-git](https://github.com/sast-summer-training-2023/sast2023-linux-git); 鱼大用非常详细的讲义 [handout.pdf](https://github.com/sast-summer-training-2023/sast2023-linux-git/blob/main/handout.pdf) 讲解了 Linux. 反正比我懂得多就是. 同时, 鱼大在讲义里面提供了一个 Docker 镜像, 可以去玩玩.

- 2023 年基础技能培训 PPT: [Fuyuki 学长的 Git PPT](./2024春季%20第一次基础技能培训%20Linux%20Git.pptx), 事无巨细, 含有大量图片, 讲解了 Git 分支管理与命令行的大量命令.
