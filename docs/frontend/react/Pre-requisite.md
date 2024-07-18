# 课前准备

## 环境配置

如果你未参与过 TypeScript 语言课程，可以参考 [其课前准备部分](/frontend/js-ts/#_1) 配置 TypeScript 语言环境以及 Yarn 包管理器。

在此基础上，你可以尝试建立一个 React 起步项目。只需要在某个你想要建立该项目的目录下，运行 React 官方提供的脚手架：

```bash
yarn create react-app learn-react --template typescript
```

正确创建完毕后，你可以进入该项目并运行：

```bash
cd learn-react
yarn start
```

之后在浏览器中访问 `http://localhost:3000` 就应当能看到 React 的 Logo 和提示，这样你就启动了你的第一个 React 应用。

然而由于 React 官方脚手架提供的起始文件并不都是必要的。我们提供了一个最小化的 React 应用代码，你可以从 <a href="https://docs.net9.org/static/frontend/react/src.zip" target="_blank" download="src.zip">该链接</a> 下载一个压缩包，解压后用内部的 `src` 目录替换掉刚刚 React 项目中的 `src` 目录。如果你此时还没有用 Ctrl+C 中止 React 应用，只要保存代码修改，就应当能看到浏览器中的页面刷新，并且仅有一行 `Hello, React!` 提示文字。如果你已经中止 React 应用，重新使用 `yarn start` 启动即可。

此外，你也可以通过 next.js 创建一个包含路由的 React 项目。
```bash
yarn create next-app
```

安装过程中会出现若干选项：
```
What is your project named? my-app
Would you like to use TypeScript? No / Yes
Would you like to use ESLint? No / Yes
Would you like to use Tailwind CSS? No / Yes
Would you like to use `src/` directory? No / Yes
Would you like to use App Router? (recommended) No / Yes
Would you like to customize the default import alias (@/*)? No / Yes
What import alias would you like configured? @/*
```

然后进入该项目并运行：

```bash
yarn dev
```

## 使用沙盒

如果你不想进行环境配置，你也可以直接使用 React 的[沙盒](https://codesandbox.io/s/react-new)，该沙盒足够完成本节课的教学内容。