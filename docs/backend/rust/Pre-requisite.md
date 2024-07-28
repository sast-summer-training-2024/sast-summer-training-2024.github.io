# 课前准备

这里假设大家已经有了一定的编程基础，对于一些基本的概念和术语有所了解。如果你是一个完全的新手，建议你先学习一些基础的编程课程，比如 Python、C、C++ 等。

## 了解常见资源

相信通过之前的课程的学习，大家应该在方法论上有了一定的认识，知道如何去查找资料，如何去学习新的编程语言。
和之前推荐的一样，优先推荐大家阅读官方文档和教程。如果遇到问题，也可以通过恰当的搜索引擎搜索和相应恰当的关键词来找到答案。

Rust的官网是 <https://www.rust-lang.org/>。

## 安装Rust

Rust 的安装逻辑是先安装 Rustup，然后由 Rustup 负责安装和管理不同版本的 Rust。

Rust 的安装步骤可以参考 <https://www.rust-lang.org/zh-CN/learn/get-started>。

经常查阅官方文档是一个好习惯，因为官方文档通常是最权威的。
学会按照官方文档的指示完成安装是一个很好的学习机会，Rust 的安装过程通常不会遇到什么困难，因此请尽量尝试自行解决遇到的一些问题。

如果你在终端输入

```bash
rustc --version
```

你应该可以看到按照以下格式显示的最新稳定版本的版本号、对应的 Commit Hash 和 Commit 日期：

```
rustc x.y.z (abcabcabc yyyy-mm-dd)
```

这证明 Rust 已经成功安装了。恭喜你已经成功入坑 Rust！

你可以尝试写一个 Hello World 程序并命名为 main.rs：

```rust
// main.rs
fn main() {
    println!("Hello, world!");
}
```

然后尝试使用`rustc`编译，这与使用`gcc`或者`g++`编译类似

```bash
rustc main.rs
```

如果你的可执行文件给出了正确的结果，那么恭喜你，你已经成功编译了并运行了你的第一个 Rust 程序！

## 了解Cargo和Rust项目管理

如果你接触过Python或者Nodejs的话，你会发现在包管理方面 Rust 的 Cargo 和 Python 的 pip、Nodejs 的 npm 有很多相似之处。
Rust作为一个现代化的编程语言，它的包管理工具 Cargo 也是非常强大的，Cargo 可以帮助我们完成项目的初始化、编译、运行、测试、打包等工作。

Rust 通常以 Cargo 项目的形式组织，一个Cargo项目通常包含一个 Cargo.toml 文件和一个 src 目录，src 目录下包含了项目的源代码。

你可以使用 Cargo 来初始化一个新的 Rust 项目：

```bash
cargo new my_project
```

得到的目录结构应该会类似

```
my_project
├── Cargo.toml
└── src
    └── main.rs
```

你可以在 Cargo.toml 中配置项目的元信息，比如项目的名称、版本、作者、依赖等。

在目前这个阶段，我们先考虑只包含一个 main.rs 的项目。

常用的Cargo命令有：

- `cargo run`：编译并运行项目，这是目前最常用的命令。
- `cargo check`：检查项目是否可以编译通过，这个命令会比`cargo run`快很多。
- `cargo build`：编译项目单步执行的时候，生成可执行文件到target目录。

## 使用IDE

一个优秀的 IDE 可以帮助我们更好地编写代码，调试代码，查看文档等。这里我推荐大家使用 Jetbrains 的 RustRover，当然也可以依据个人喜好使用 VSCode + Rust 插件。

Jetbrains 的 IDE 对学生是免费的，可以通过直接申请 Jetbrains Education License 得到，也可以通过申请 Github Student Pack 得到。当然目前学校也提供了 Jetbrains 的 IDE 的授权，也可以直接使用。详情请访问 <https://its.tsinghua.edu.cn>。



