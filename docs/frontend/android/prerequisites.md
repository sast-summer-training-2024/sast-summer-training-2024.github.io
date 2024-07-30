<!-- 若图片失效，请移步 images/android/。-->

## Android 简介

Android 是一个基于 Linux 内核的开源操作系统，主要用于移动设备，如智能手机和平板电脑。它由 Google 领导开发，并由开放手机联盟（Open Handset Alliance）支持。自 2008 年首次发布以来，Android 已经成为全球最受欢迎的移动操作系统之一。

> Android 操作系统的每个主要版本通常会有一个版本号和一个以甜品为主题的昵称。以下是一些主要的 Android 版本号和对应的昵称：
>
> 1. **Android 1.5** - Cupcake
> 2. **Android 1.6** - Donut
> 3. **Android 2.0/2.1** - Eclair
> 4. **Android 2.2/2.3** - Froyo
> 5. **Android 3.0** - Gingerbread
> 6. **Android 4.0** - Ice Cream Sandwich
> 7. **Android 4.1/4.2/4.3** - Jelly Bean
> 8. **Android 4.4** - KitKat
> 9. **Android 5.0/5.1** - Lollipop
> 10. **Android 6.0** - Marshmallow
> 11. **Android 7.0/7.1** - Nougat
> 12. **Android 8.0/8.1** - Oreo
> 13. **Android 9** - Pie
>
> 从 Android 10 开始，Google 决定不再使用甜品昵称来命名新版本，而是直接使用数字表示。

### 发展历程

1. **2008年**：Google 宣布 Android 操作系统，并成立开放手机联盟。
2. **2009年**：HTC Dream（也称为 T-Mobile G1）成为第一款商用 Android 设备。
3. **2010年**：Android 2.2（Froyo）发布，引入了对 Adobe Flash 的支持。
4. **2011年**：Android 4.0（Ice Cream Sandwich）发布，带来了全新的用户界面和改进的多任务处理能力。
5. **2014年**：Android 5.0（Lollipop）发布，引入了 Material Design 设计语言。
6. **2019年**：Android 10 引入了更严格的隐私保护措施和改进的用户体验。
7. **2021年**：Android 12 带来了全新的设计语言 Material You，以及更强大的隐私控制。

### 开发工具

1. **Android Studio**：官方集成开发环境（IDE），支持 Android 应用开发。
2. **Android SDK**：包含开发 Android 应用所需的工具和库。
3. **Android Virtual Device（AVD）**：模拟器，用于测试应用在不同设备和配置上的表现。
4. **Gradle**：构建系统，用于编译和管理 Android 应用的依赖。

通过这些工具，开发者可以高效地开发、测试和发布 Android 应用。

## 课前准备

### 环境配置

#### 下载 Android Studio

> **注意**：目前不支持采用 ARM CPU 的 Windows/Linux 计算机。

请从官网上下载并安装 Android Studio。官方文档 [安装 Android Studio](https://developer.android.google.cn/studio/install?hl=zh-cn) 给出了一个详尽的（甚至包含视频演示）下载并安装 Android Studio 的方法。

安装时请务必安装 Android Virtual Device。

![安装 Android Virtual Device](https://leverimmy.top/gallery/Introduction-to-Android/install-avd.png)

#### 安装 SDK

大概率你的电脑上并没有 Android SDK。在安装完 Android Studio 并打开后，它有可能会提示你“Missing SDK”。

![未找到 SDK](https://leverimmy.top/gallery/Introduction-to-Android/missing-sdk.png)

此时你应该跟随安装程序，继续安装 SDK。将红色框内所有能选的选项均选中（你的界面可能与我的不同，多的也都选上）。

![安装 SDK](https://leverimmy.top/gallery/Introduction-to-Android/install-sdk.png)

然后进行漫长的等待即可。

![下载 SDK](https://leverimmy.top/gallery/Introduction-to-Android/download-sdk.png)

### Hello world!

#### 新建项目

我们在 Android Studio 里新建一个项目，模板我这里选用的是 Bottom Navigation Views Activity，大家也可以多多尝试，看这些模板有什么不同。

![新建项目模板](https://leverimmy.top/gallery/Introduction-to-Android/new-project-template.png)

然后选择**编程语言**、**最低 SDK 版本**和**构建语言**。我分别选择的是 **Java**、**API 25** 和 **Kotlin DSL**。

![新建项目配置](https://leverimmy.top/gallery/Introduction-to-Android/new-project-config.png)

完成之后 Gradle 会进行一次构建。如果不出意外的话，构建应该会**失败**。这是因为项目的部分包（package）需要联网获取；而在国内，由于某些原因，对那些网络资源的访问不够顺畅。因此我们需要修改配置，将其换为国内镜像。

#### 修改配置

首先，修改 `gradle/wrapper/gradle-wrapper.properties`，将 Gradle 镜像改为腾讯镜像，同时将版本设置为 8.9。

**`gradle-wrapper.properties` 原文件（节选）**

```properties gradle-wrapper.properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.7-bin.zip
```

**`gradle-wrapper.properties` 修改后的文件（节选）**

```properties gradle-wrapper.properties
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.9-all.zip
```

其次，修改 `settings.gradle.kts`，将 Maven 镜像改为阿里云镜像。

**`settings.gradle.kts` 原文件（节选）**

```kotlin settings.gradle.kts
pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
```

**`settings.gradle.kts` 修改后的文件（节选）**

```kotlin settings.gradle.kts
pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }

        maven { url = uri("https://maven.aliyun.com/repository/gradle-plugin") }
        maven { url = uri("https://maven.aliyun.com/repository/google") }
        maven { url = uri("https://maven.aliyun.com/repository/jcenter") }
        maven { url = uri("https://maven.aliyun.com/repository/public") }
        mavenLocal()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        maven { url = uri("https://maven.aliyun.com/repository/gradle-plugin") }
        maven { url = uri("https://maven.aliyun.com/repository/google") }
        maven { url = uri("https://maven.aliyun.com/repository/jcenter") }
        maven { url = uri("https://maven.aliyun.com/repository/public") }
        mavenLocal()
        mavenCentral()
    }
}
```

至此，配置已修改完毕。

重新进行 Gradle Project Sync 即可完成 Gradle 构建。如果下方出现 `BUILD SUCCESSFUL in **s` 的字样，这说明你的第一个 Android 应用程序就已经构建完成了！

![Gradle 重新构建](https://leverimmy.top/gallery/Introduction-to-Android/gradle-sync.png)

#### 新建虚拟机

通过 Device Manager 添加一台新的虚拟机。

![Device Manager](https://leverimmy.top/gallery/Introduction-to-Android/device-manager.png)

选择机型，我选择的是 Pixel 8。

![Select Hardware](https://leverimmy.top/gallery/Introduction-to-Android/select-hardware.png)

选择虚拟机上 SDK 版本。我选择的是 API 25。如果你还记得的话，我们在新建项目时设置了最低 SDK 版本。也就是说，我们的程序在 API 小于 25 的机器上均不能运行。所以这里至少需要选择 API 25。

![System Image](https://leverimmy.top/gallery/Introduction-to-Android/system-image.png)

#### 构建并将应用安装到虚拟机上

点击“运行”按钮即可。

![Run App](https://leverimmy.top/gallery/Introduction-to-Android/run-app.png)

最后在虚拟机上的运行结果应当如下：

![Virtual Device](https://leverimmy.top/gallery/Introduction-to-Android/virtual-device.png)
