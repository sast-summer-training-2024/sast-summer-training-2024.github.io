# React

Web 应用已经从简单的显示文字进化到展示图片等多媒体资源，乃至到如今复杂多样的高交互性内容展示。在这种进化的背后，是 Web 应用的开发方式的一轮轮迭代更新。本课程希望为大家介绍当下流行的 Web 应用前端开发框架之一——React 的基本使用方式。React 具有易于学习，渲染高效的特点，同时社区活跃，拥有广泛的第三方库。此外，对 React 框架的学习将会为你在软件工程这门计算机系必修课程中的前端开发奠定基础（实际上 React 也是目前软工课程推荐的前端框架），让你能够轻松快捷地开发 Web 应用。学习这门课程后，你将能够自己开发简单的 Web 应用，例如作业中的选课系统或网页小游戏。

## You are doing React!

- HTML、CSS、JS
- 通过框架，我们无需直接接触复杂的原生Web代码，能够以更简单的方式实现可维护性和鲁棒性更高的网页应用
- 当前常用的框架：React、Vue、Angular

### Step 1 理解 TSX 

React 对 TypeScript 语言作了一定的拓展，拓展后的 TSX 在拥有 TypeScript 特性的同时具有一些类似HTML的特征，其中最显著的特点就是标签语法的引入。

``` typescript
const p = <p>Hello world!</p>;
```

这定义了一个标签对象，讲过编译后，会变成如下浏览器可以直接执行的TS代码

``` typescript
const p = React.createElement('p', null, 'Hello world!');
```

此外，我们还可以在标签对象中嵌入TS表达式，其会运算出其值后转为字符串嵌入：

```typescript
const name = 'React';
const p = <p>Hello {name}!</p>;
```

这里需要注意的是，在TSX中，只能在以下两种场景中使用大括号：

1. 用作 JSX 标签内的文本：`<h1>{name}'s To Do List</h1>` 是有效的，但是 `<{tag}>Gregorio Y. Zara's To Do List</{tag}>` 无效。
2. 用作紧跟在 `=` 符号后的 属性：`src={avatar}` 会读取 `avatar` 变量，但是 `src="{avatar}"` 只会传一个字符串 `{avatar}`。

### Step 2 理解组件（Component）

React 应用程序是由 **组件** 组成的。一个组件是 UI（用户界面）的一部分，它拥有自己的逻辑和外观。组件可以小到一个按钮，也可以大到整个页面。

React 框架支持两种组件，一种是类组件，一种是函数组件，但是目前 React 推荐使用函数组件，官方文档也是函数组件为主。

函数组件可以理解为返回标签的 TypeScript 函数，换言之，函数组件的返回值，就是这个组件在屏幕上（浏览器里的）展示形式。

```typescript
function RedSquare() {
  return <div style={{width: 100, height: 100, backgroundColor: "red"}} />;
}

const App = () => {

  return (
    <div>
      <h1>There is a red square below.</h1>
      <RedSquare />
    </div>
  );
}

export default APP;

```

以上的 RedSquare 与 App 都是函数组件，其中 App 组件返回了一个包含 RedSquare 组件的 div 标签，效果是在浏览器中显示一个红色的正方形。其中`export default`关键字指定了文件中的主要组件。

需要注意的是，React 组件必须以大写字母开头，而 HTML 标签应该使用小写字母 (实际上不区分大写或者小写，但按照代码规范，标签应当使用小写格式)。

此外，React还支持通过组件列表进行渲染。

```typescript
const products = [
  { title: 'Cabbage', isFruit: false, id: 1 },
  { title: 'Garlic', isFruit: false, id: 2 },
  { title: 'Apple', isFruit: true, id: 3 },
];

export default function ShoppingList() {
  const listItems = products.map(product =>
    <li
      key={product.id}
      style={{
        color: product.isFruit ? 'magenta' : 'darkgreen'
      }}
    >
      {product.title}
    </li>
  );

  return (
    <ul>{listItems}</ul>
  );
}
```

以上代码中，`ShoppingList` 组件返回了一个包含 `products` 列表中所有产品的 `ul` 标签，每个产品都由一个 `li` 标签表示。`map` 函数用于将 `products` 列表中的每个产品转换为 `li` 标签，并根据是否是水果呈现不同的颜色，添加到 `listItems` 数组中。最后，`listItems` 数组被渲染为 `ul` 标签的子元素。


### Step 3 理解属性（Props）

类似 HTML 规定标签属性语法，你可以通过通过 `props` 实现父组件对子组件的控制。具体而言，`props` 会包装成一个对象传入函数组件的参数之中。

```typescript
function Todo(props) {
  return (
    <li>{props.person} should {props.todo}</li>
  )
}


export default function TodoList() {
  return (
    <ul style={{
      backgroundColor: 'black',
      color: 'pink'
    }}>
      <Todo person="I" todo="play Genshen Impact"/>
      <Todo person="ljr" todo="play Honkai: Star Rail"/>
      <Todo person="John" todo="cope with his bugs"/>
    </ul>
  );
}
```

以上代码中，`TodoList` 组件返回了一个包含三个 `Todo` 组件的 `ul` 标签，每个 `Todo` 组件都接收一个 `person` 和一个 `todo` 属性，并显示在 `li` 标签中。

实际上，`props` 是一个对象，它包含了组件的所有属性。在上述代码中，`props` 对象包含了 `person` 和 `todo` 属性，这些属性被传递给了 `Todo` 组件。其中，函数组件 `Todo` 另一种写法是：

```typescript
function Todo({ person, todo }) {
  return (
    <li>{person} should {todo}</li>
  )
}
```

这种写法是解构赋值，它将 `props` 对象中的 `person` 和 `todo` 属性直接赋值给同名的变量。

类似函数的参数，函数组件的props也可以指定默认值，例如：

```typescript
function Todo({ person = 'John', todo }) {
  return (
    <li>{person} should {todo}</li>
  )
}
```
以上代码中，`person` 属性有一个默认值 `'John'`，如果父组件没有传递 `person` 属性，那么 `person` 的值就会是 `'John'`。

### Step 4 理解状态（State）

函数组件之中需要使用 Hooks，形而上地写成 `const [state, setState] = useState(initState);`，状态是组件自我管理的数据，不需要依赖父组件的控制。

```typescript
import { useState } from 'react'; //要使用useState，我们首先需要进行导入

const products = [
  { title: 'Cabbage', isFruit: false, id: 1 },
  { title: 'Garlic', isFruit: false, id: 2 },
  { title: 'Apple', isFruit: true, id: 3 },
];

export default function ShoppingList() {

  const [targetId, setTargetId] = useState(1);

  function Next(){
    setTargetId(targetId + 1);
  }

  return (
    <div>
    <button onClick={Next}>Next</button>
    <h2> {targetId}/{products.length} </h2>
    <p>You need to buy {products[targetId - 1].title}</p>
    </div>
  );
}
```

需要注意的是，我们应该将组件的状态视为只读的，不能直接进行赋值，也就是不允许 mutation。在上面的例子中，`setTargetId(targetId + 1)`是正确的写法，而`targetId = targetId + 1`则是错误的写法，换言之，如果你想要改变组件状态，你需要创建一个新对象并把它传递给 state 的设置函数。

此外， useState 也支持直接使用展开语法进行状态的更新，例如：

```typescript
import { useState } from 'react';

export default function Form() {
  const [person, setPerson] = useState({
    firstName: 'Barbara',
    lastName: 'Hepworth',
    email: 'bhepworth@sculpture.com'
  });

  function handleFirstNameChange(e) {
    setPerson({
      ...person,
      firstName: e.target.value
    });
  }

  function handleLastNameChange(e) {
    setPerson({
      ...person,
      lastName: e.target.value
    });
  }

  function handleEmailChange(e) {
    setPerson({
      ...person,
      email: e.target.value
    });
  }

  return (
    <>
      <label>
        First name:
        <input
          value={person.firstName}
          onChange={handleFirstNameChange}
        />
      </label>
      <label>
        Last name:
        <input
          value={person.lastName}
          onChange={handleLastNameChange}
        />
      </label>
      <label>
        Email:
        <input
          value={person.email}
          onChange={handleEmailChange}
        />
      </label>
      <p>
        {person.firstName}{' '}
        {person.lastName}{' '}
        ({person.email})
      </p>
    </>
  );
}

```

此外，**State 是隔离且私有的**，换句话说，State 是屏幕上组件实例内部的状态，如果你渲染同一个组件两次，每个副本都会有**完全隔离的 state**，改变其中一个不会影响另一个。

例如：
```typescript
import { useState } from 'react'; //要使用useState，我们首先需要进行导入

const products = [
  { title: 'Cabbage', isFruit: false, id: 1 },
  { title: 'Garlic', isFruit: false, id: 2 },
  { title: 'Apple', isFruit: true, id: 3 },
];

function ShoppingList() {

  const [targetId, setTargetId] = useState(1);

  function Next(){
    if(targetId === 3)
      setTargetId(1);
    else
      setTargetId(targetId + 1);
  }

  return (
    <div>
    <button onClick={Next}>Next</button>
    <h2> {targetId}/{products.length} </h2>
    <p>You need to buy {products[targetId - 1].title}</p>
    </div>
  );
}

export default function MyApp(){
  return(
    <>
      <ShoppingList />
      <ShoppingList />
    </>
  );
} 
```
可以看到，上下两个ShoppingList中的targetId状态是相互独立的。

组件调用（渲染）的时机：
1. 初次渲染，React会调用根组件。
2. 对于后续的渲染, React 会调用内部状态更新触发了渲染的函数组件。

调用某个组件时会递归地渲染该组件本身以及其所有的子组件（所有该函数组件会返回的内容）



对于情况二，例如：
```typescript
import { useState } from 'react';

export default function Form() {
  const [isSent, setIsSent] = useState(false);
  const [message, setMessage] = useState('Hi!');
  if (isSent) {
    return <h1>Your message is on its way!</h1>
  }
  return (
    <form onSubmit={(e) => {
      e.preventDefault();
      setIsSent(true);
      sendMessage(message);
    }}>
      <textarea
        placeholder="Message"
        value={message}
        onChange={e => setMessage(e.target.value)}
      />
      <button type="submit">Send</button>
    </form>
  );
}

function sendMessage(message) {
  // ...
}
```

当你按下 “send” 时，setIsSent(true) 会通知 React 重新渲染 UI。

当你单击按钮时会发生以下情况：

1. 执行 onSubmit 事件处理函数。
2. setIsSent(true) 将 isSent 设置为 true 并排列一个新的渲染。
3. React 根据新的 isSent 值重新渲染组件。

让我们更深入地考虑 state 和渲染之间的关系。请看下面的例子，看看你点击“+3”按钮时会发生什么：
```typescript
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 1);
        setNumber(number + 1);
        setNumber(number + 1);
      }}>+3</button>
    </>
  )
}
```

我们“惊讶地”发现，结果是1而非3！

实际上，也许 state 变量看起来和一般的可读写的 TypeScript 变量类似。但 state 在其表现出的特性上更像是一张快照。设置它不会更改你已有的 state 变量，但会触发重新渲染。实际上渲染就意味着 React 调用你的组件——一个函数。你从该函数返回的 JSX 就像是在某个时间点上 UI 的快照。它的 props、事件处理函数和内部变量都是 根据当前渲染时的 state 被计算出来的。

作为一个组件的记忆，state 不同于在你的函数返回之后就会消失的普通变量。state 实际上“活”在 React 本身中——就像被摆在一个架子上！——位于你的函数之外。当 React 调用你的组件时，它会为特定的那一次渲染提供一张 state 快照。你的组件会在其 JSX 中返回一张包含一整套新的 props 和事件处理函数的 UI 快照 ，其中所有的值都是 根据那一次渲染中 state 的值 被计算出来的！

![img](../../images/update_state.png)

在了解这些原理后，我们再来分析上述的例子，在按下按钮后，发生了三次 setNumber() ，当前快照 number 为 0 ，生成一张新快照，这三次 setNumber 分别做了这样的事情：
1. setNumber(number + 1)：number 是 0 所以 setNumber(0 + 1)。React 准备在下一次渲染时将 number 更改为 1。
2. setNumber(number + 1)：number 是 0 所以 setNumber(0 + 1)。React 准备在下一次渲染时将 number 更改为 1。
3. setNumber(number + 1)：number 是 0 所以 setNumber(0 + 1)。React 准备在下一次渲染时将 number 更改为 1。

因此，尽管你调用了三次 setNumber(number + 1)，但在**这次渲染的**事件处理函数中 number 会一直是 0，所以你会三次将 state 设置成 1。这就是为什么在你的事件处理函数执行完以后，React 重新渲染的组件中的 number 等于 1 而不是 3。

但是这里还有另外一个影响因素需要讨论。React 会等到事件处理函数中的**所有**代码都运行完毕再处理你的 state 更新。 这就是为什么重新渲染只会发生在所有这些 setNumber() 调用之后的原因。这就像餐厅里帮你点菜的服务员。服务员不会在你说第一道菜的时候就跑到厨房！相反，他们会让你把菜点完，让你修改菜品，甚至会帮桌上的其他人点菜。

这让你可以更新多个 state 变量——甚至来自多个组件的 state 变量，而不会触发太多的重新渲染。但这也意味着只有在你的事件处理函数及其中任何代码执行完成之后，UI 才会更新。这种特性也就是**批处理**，它会使你的 React 应用运行得更快。它还会帮你避免处理只​​更新了一部分 state 变量的令人困惑的“半成品”渲染。

那么，如果我希望在下次渲染前多次更新同一个 `state` 并且我需要用到这个 `state` 在变更过程中的中间值，应该怎么做呢？请看下面的例子：
```typescript
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(n => n + 1);
        setNumber(n => n + 1);
        setNumber(n => n + 1);
      }}>+3</button>
    </>
  )
}
```

在这里，n => n + 1 被称为 更新函数。当你将它传递给一个 state 设置函数时：

1. React 会将此函数加入队列，以便在事件处理函数中的所有其他代码运行后进行处理。
2. 在下一次渲染期间，React 会遍历队列并给你更新之后的最终 state。

当你在下次渲染期间调用 useState 时，React 会遍历队列。之前的 number state 的值是 0，所以这就是 React 作为参数 n 传递给第一个更新函数的值。然后 React 会获取你上一个更新函数的返回值，并将其作为 n 传递给下一个更新函数，以此类推：

| 更新队列       | n | 返回值       |
|------------|---|-----------|
| n => n + 1 | 0 | 0 + 1 = 1 |
| n => n + 1 | 1 | 1 + 1 = 2 |
| n => n + 1 | 2 | 2 + 1 = 3 |

React 会保存 3 为最终结果并从 useState 中返回。
这就是为什么在上面的示例中点击“+3”正确地将值增加“+3”。

下面我们考虑，替换 state 后更新 state 会发生什么：
```typescript
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 5);
        setNumber(n => n + 1);
      }}>增加数字</button>
    </>
  )
}
```

以下是 React 在执行事件处理函数时处理这几行代码的过程：

1. setNumber(number + 5)：number 为 0，所以 setNumber(0 + 5)。React 将 “替换为 5” 添加到其队列中。
2. setNumber(n => n + 1)：n => n + 1 是一个更新函数。React 将该函数添加到其队列中。
3. setNumber(42)：React 将 “替换为 42” 添加到其队列中。
   
在下一次渲染期间，React 会遍历 state 队列：

| 更新队列       | n      | 返回值       |
|------------|--------|-----------|
| “替换为 5”    | 0（未使用） | 5         |
| n => n + 1 | 5      | 5 + 1 = 6 |
| “替换为 42”   | 6（未使用） | 42        |

然后 React 会保存 42 为最终结果并从 useState 中返回。

总而言之，以下是你可以考虑传递给 setNumber state 设置函数的内容：

- 一个更新函数（例如：n => n + 1）会被添加到队列中。
- 任何其他的值（例如：数字 5）会导致“替换为 5”被添加到队列中，已经在队列中的内容会被忽略。

事件处理函数执行完成后，React 将触发重新渲染。**在重新渲染期间**，React 将处理队列。更新函数会在渲染期间执行，因此 更新函数必须是**纯函数**并且**只返回结果**。不要尝试从它们内部设置 state 或者执行其他副作用。在严格模式下，React 会执行每个更新函数两次（但是丢弃第二个结果）以便帮助你发现错误。

实际上，setState(x) 会像 setState(n => x) 一样运行，只是没有使用 n！因此，上述代码也可以解释为

| 更新队列       | n      | 返回值       |
|------------|--------|-----------|
| n => 5    | 0（未使用） | 5         |
| n => n + 1 | 5      | 5 + 1 = 6 |
| n => 42   | 6（未使用） | 42        |

此外，需要注意的是，React 会在组件更新后的状态与更新前一致时，跳过对组件的重新渲染。
- 对于数字、字符串等类型，React 会比较值是否相等。
- 对于数组、对象等复杂类型，React 将检查引用的地址是否相等。
这种行为可以优化性能，但有时会造成意外的组件不更新，请注意这一点

### Step 5 理解副作用（Effect）

函数组件的主作用是渲染组件，所有其他的操作都归类于副作用，所有的副作用都应当写成回调函数使用 `useEffect` Hook 裹住。

Effect 允许你指定由渲染本身，而不是特定事件引起的副作用。

考虑一个 ChatRoom 组件，它在屏幕上可见时必须连接到聊天服务器。连接到服务器不是一个纯计算（它包含副作用），因此它不能在渲染过程中发生。然而，并没有一个特定的事件（比如点击）导致 ChatRoom 被显示。在聊天中发送消息是一个“事件”，因为它直接由用户点击特定按钮引起。然而，建立服务器连接是 Effect，因为无论哪种交互致使组件出现，它都会发生。Effect 在屏幕更新后的提交阶段运行。这是一个很好的时机，可以将 React 组件与某个外部系统（如网络或第三方库）同步。

`useEffect Hook` 语法由三部分构成:


``` typescript
useEffect(() => {
  // 在这⾥写你需要执⾏的副作⽤
  // 例如获取数据、设定计时器等
  return () => {
  // 在这⾥写副作⽤的清除，不需要清除的副作⽤可以不写返回值
  // ⽐如设定计时器之后需要回收计时器
  // 下⼀次渲染的时候上⼀次渲染所定义的副作⽤会被这个函数清除
  // 组件本身销毁的时候也会执⾏
  };
}, /* depList(依赖列表) ⽤于控制上述副作⽤何时触发 */);
```

什么时候执行副作用，依赖于 `useEffect` Hook 的第二个参数（依赖列表）
  - 如果依赖列表缺失（即 `undefined`），每一次渲染都会执行副作用
  - 如果依赖列表是空列表（即 `[]`），只在第一次渲染时执行副作用（多用于组件初始化的时候从服务器拉取数据）
  - 如果依赖列表里面有变量，则在依赖列表中变量发生改变的时候执行副作用

### Step 6 理解反向数据流

反向数据流实际上是一个很常见的需求，比如说分页器。分页器在 UI 构成上而言，仅仅是一个网页的部分，但是它的状态却决定了整个网页应当显示的内容。从而我们必须构建从分页器向父组件的数据流，让分页器起到作用。

这里我们沿用先前的代码进行说明：

```typescript
import { useState } from 'react'; //要使用useState，我们首先需要进行导入

const products = [
  { title: 'Cabbage', isFruit: false, id: 1 },
  { title: 'Garlic', isFruit: false, id: 2 },
  { title: 'Apple', isFruit: true, id: 3 },
];

function ShoppingList(props) {

  const [targetId, setTargetId] = useState(1);

  function Next(){
    if(targetId === 3)
      setTargetId(1);
    else
      setTargetId(targetId + 1);
  }

  return (
    <div>
    <button onClick={Next}>Next</button>
    <h2> {targetId}/{products.length} </h2>
    <button onClick={props.buy}>购买 {products[targetId - 1].title}</button>
    </div>
  );
}

export default function MyApp(){
  const [number, setNumber] = useState(0);
   
  function Buy(){
    setNumber(number + 1);
  }

  return(
    <>
      <ShoppingList buy={Buy} />
      <p>总购买数量：{number}</p>
    </>
  );
} 
```

在上述代码中，`ShoppingList` 组件通过 `props.buy` 将 `number` 的改变传递给了父组件 `MyApp`，从而实现了反向数据流。


### Step 7 理解 Next.js 路由

路由（routers）是应用的重要组成部分。所谓路由，有多种定义，对于应用层的单页应用程序而言，路由是一个决定 URL 如何呈现的库，在服务层实现 API 时，路由是解析请求并将请求定向到处理程序的组件。简单的来说，在 Next.js 中，路由决定了一个页面如何渲染或者一个请求该如何返回。

Next.js 目前有两套路由解决方案，之前的方案称之为“Pages Router”，目前的方案称之为“App Router”，两套方案是兼容的，都可以在 Next.js 中使用。

Next.js 从 v13 起就使用了新的路由模式 —— App Router。从 v13.4 起，App Router 正式进入稳定化阶段，App Router 功能更强、性能更好、代码组织更灵活。

那么这两者到底有什么区别呢？为什么要选择更新到App Router呢？

Pages Router 是 Next.js 最早的路由方案，它将 pages 目录下的所有文件都视作路由文件，并且文件名就是路由的路径。
例如，我们有一个 pages 目录，其结构如下：

```
└── pages
    ├── index.js
    ├── about.js
    └── more.js
```

这种方式有一个弊端，那就是 pages 目录的所有 js 文件都会被当成路由文件，这就导致比如组件不能写在 pages 目录下，这就不符合开发者的使用习惯。（当然 Pages Router 还有很多其他的问题，只不过目前我们介绍的内容还太少，为了不增加大家的理解成本，就不多说了）

升级为新的 App Router 后，现在的目录结构类似于：

```
src/
└── app
    ├── page.js 
    ├── layout.js
    ├── template.js
    ├── loading.js
    ├── error.js
    └── not-found.js
    ├── about
    │   └── page.js
    └── more
        └── page.js
```

首先，app 目录必须包含根布局，也就是 app/layout.js 这个文件是必需的。

布局是指多个页面共享的 UI。在导航的时候，布局会保留状态，保持可交互性并且不会重新渲染，比如用来实现后台管理系统的侧边导航栏。

定义一个布局，你需要新建一个名为 layout.js的文件，该文件默认导出一个 React 组件，该组件应接收一个 children prop，chidren 表示子布局（如果有的话）或者子页面。

默认根布局是服务端组件，且不能设置为客户端组件。


使用`useRouter`进行路由跳转的，例如:
```typescript
import { useRouter } from 'next/router'

export default function Home() {
  const router = useRouter()

  const goToAbout = () => {
    router.push('/about')
  }

  return (
    <div>
      <h1>Home Page</h1>
      <button onClick={goToAbout}>Go to About Page</button>
    </div>
  )
}
```
在按下按钮后会前往`About`页面


### Extra

- 在上述的数据传递中，数据依然局限于父子之间，如果需要在多个复杂的组件树上共享状态，推荐使用 Redux
- 组件库，帮助大家很快写出来“有设计感的” UI，组件库比如说 Ant Design 之类

## 课程作业
[前后端联合作业（推荐）](https://github.com/sast-summer-training-2024/react-homework-2)或[前端单独作业](https://github.com/sast-summer-training-2024/sast2024-react)

### 参考文献
1. [清华大学计算机系科协2023年暑培讲义](https://summer23.net9.org)
2. 清华大学计算机系2024年春软件工程课程讲义
3. [React 官方文档](https://reactjs.org/docs/getting-started.html)
4. [Next.js 官方文档](https://nextjs.org/docs/getting-started)
5. 博客：https://www.cnblogs.com/silva/p/17948723