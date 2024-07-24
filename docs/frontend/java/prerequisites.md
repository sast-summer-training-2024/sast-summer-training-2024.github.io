<!-- 若图片失效，请移步 images/java/。-->

## Java 简介

Java 是一种广泛使用的计算机编程语言，于 1995 年由 Sun Microsystems 公司推出。它是一种面向对象的编程语言，旨在减少编程中可能出现的错误，并易于理解和维护。

尽管近年来面临一些新兴语言的挑战，Java 由于它的跨平台性、良好的安全性、前向兼容性以及不算差的性能，仍是一门历史地位和业界地位都极其崇高的语言。庞大的 Java 社区和海量的 Java 项目，使得对任何想要接触业界的贵系同学来说，你也许可以不精通它，但至少应当对这门简单、强大、通用的语言有一些了解。

![编程语言排名](https://img.picgo.net/2024/07/24/rank3f7238361e89b876.jpeg)

### 发展历史

Java 发明于 20 世纪 90 年代初，由 Sun Microsystems（后来被 Oracle 收购）的工程师团队开发。最初的目标是创建一种用于家电设备的编程语言。1995 年，Java 1.0 正式发布，带来了跨平台的能力，也就是“Write Once, Run Anywhere”（一次编写，随处运行）。这一特性是通过将 Java 代码编译为中间表示形式（字节码）实现的，然后在任何支持 Java 虚拟机（JVM）的平台上运行。

随着时间的推移，Java 不仅仅成为一种用于嵌入式系统的语言，它还发展成为一种强大的服务器端、企业级应用、Web 和移动应用的开发语言。

### 优势与不足

#### 优势

1. **跨平台性**：Java 采用“一次编写，到处运行”的理念，代码可以在不同操作系统（Windows、macOS、Linux 等）上运行，无需重新编写。这得益于 Java 虚拟机（Java Virtual Machine，JVM）的设计。
2. **面向对象**：Java 是一种**纯粹的面向对象编程语言**，支持封装、继承和多态等 OOP 特性，有利于代码的复用和维护。
3. **安全性**：Java 具有强大的安全机制，如垃圾回收机制（Garbage Collection，GC）、异常处理等，可以有效地防范程序运行过程中的安全隐患。
4. **丰富的标准库**：Java 附带了大量的标准库，涵盖了网络、图形界面、数据库等各个方面，开发者可以直接调用这些库（而无需重复造轮子），提高开发效率。
5. **广泛的应用领域**：Java 可用于开发桌面应用程序、Web 应用程序、移动应用程序、大数据处理、机器学习等各种类型的软件。

#### 不足

1. **性能**：与编译成本地机器代码的语言（例如 C、C++）相比，Java 的性能通常较低。这是因为 Java 程序需要在 JVM 上运行，这增加了额外的抽象层。
2. **内存消耗**：Java 应用程序通常比其他编程语言的应用程序消耗更多的内存。这是由于其“面向对象”导向的设计和垃圾回收机制。
3. **冗长的代码**：与一些现代编程语言（例如 Rust）相比，Java 的代码可能显得冗长和繁琐，这也可能会使开发过程变得复杂和耗时。

尽管存在这些不足，Java 仍然是世界上最受欢迎和广泛使用的编程语言之一。它在企业级应用程序、移动应用程序（尤其是 Android）和大型系统中得到了广泛应用。

## 课前准备

### 环境配置

要运行 Java 程序，你需要先安装 Java Developer Kit（JDK）。Windows 或 Mac 用户建议直接在 Oracle 官网[下载 JDK21](https://www.oracle.com/java/technologies/downloads/#java21)；而 Linux 用户（这里以 Ubuntu 为例，其余平台请自行百度 / Google）则可以使用如下命令：

```bash
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java21-installer --install-recommends
```

本教程将使用 JDK21 这一版本。请使用 `java -version` 命令来确认 JDK 是否安装完成（以下输出仅供参考）：

```
java version "21.0.3" 2024-04-16 LTS
Java(TM) SE Runtime Environment (build 21.0.3+7-LTS-152)
Java HotSpot(TM) 64-Bit Server VM (build 21.0.3+7-LTS-152, mixed mode, sharing)
```

你可以使用如下命令编译运行 Java 程序：

```bash
javac YourProgram.java	# 编译
java YourProgram        # 运行
java YourProgram.java   # 编译 & 运行
```

同时，本教程将使用，也强烈推荐使用 [IntelliJ IDEA](https://www.jetbrains.com.cn/idea/) 作为 IDE 来辅助开发。如果你就读于清华大学，建议使用 `<你的邮箱名>@mail.thu.edu.cn` 来获取[面向学生和教师的个人许可证](https://www.jetbrains.com.cn/community/education/#students)，以获得“Ultimate Experience”（类似于 Professional 版本）。

### Hello world!

在 IntelliJ IDEA 中，点击 File-New-New Project... 新建一个新的项目，项目名为 `hello-world`：

![新建一个新的项目](https://img.picgo.net/2024/07/24/create-new-projecta43ca141ce16cc4e.jpeg)

IDEA 会自动生成一个 demo 代码，代码内容如下：

```java Main.java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
    }
}
```

点击右上角的“编译并运行”按钮。

![编译并运行后的输出界面](https://img.picgo.net/2024/07/24/compile-and-run55c1c0b56df66150.jpeg)

如果你的程序输出：`Hello world!`，那么，你已经能够成功编译并运行 Java 程序了！

最后，请在 GitHub 上 fork [sast-summer-training-2024/sast2024-java](https://github.com/sast-summer-training-2024/sast2024-java) 至自己的账户，并使用 Git 将**自己账号**下的仓库 clone 至本地。

至此，课前准备环节结束。

> 另外，[sast-summer-training-2024/sast2024-java](https://github.com/sast-summer-training-2024/sast2024-java) 中的代码使用的是 Gradle 构建的，并且带有单元测试。具体而言，可以按照以下方式创建：
>
> ![创建带有测试的代码结构](https://img.picgo.net/2024/07/24/create-with-tests09feaa6ac3eea616.jpeg)
>
> 你也可以尝试运行 demo 代码。你可能会发现，输出十分冗长，但是其中应该也是有 `Hello world!` 的。
