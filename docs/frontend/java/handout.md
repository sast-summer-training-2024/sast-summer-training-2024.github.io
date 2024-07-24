## 基础语法

Java 的基础语法与 C++ 较为类似。以下代码均包含于 `src/main/java/examples/introduction` 中。

### 输入输出

```java title="IOExample.java"
package examples.introduction;

import java.util.Scanner;

public class IO {
    public static void main(String[] args) {
        // Console Output
        System.out.println("This is an output with a new line.");
        System.out.print("This is an output without a new line.");
        System.out.println("So this sentence will appear right after the last one.");

        // Console Input
        Scanner input = new Scanner(System.in);
        System.out.print("Enter your name: ");
        String name = input.nextLine();
        System.out.print("Enter your age: ");
        int age = input.nextInt();
        System.out.println("Hello " + name + ", you are " + age + " years old!");
    }
}
```

这个程序中展现了 Java 中基础的输入输出方式。相较于 C++ 而言，输入输出所用函数名较长，但也并不繁琐。

### 变量

Java 中的变量类型和 C++ 类似，但也有细微的差别。

#### 整型数：`byte`、`short`、`int` 和 `long`

|  类型   |   大小   |         最小值          |        最大值         |
| :-----: | :------: | :---------------------: | :-------------------: |
| `byte`  | $1$ 字节 |      $-2^7 = -128$      |     $2^7-1 = 127$     |
| `short` | $2$ 字节 |    $-2^{15}=-32768$     |   $2^{15}-1=32767$    |
|  `int`  | $4$ 字节 | $-2^{31} = -2147483648$ | $2^{31}-1=2147483647$ |
| `long`  | $8$ 字节 |        $-2^{63}$        |      $2^{63}-1$       |

#### 浮点数：`float` 和 `double`

在 Java 中，浮点数字面量可以写为 `123.45`、`.5`，或 `321.4f` 等。其中以 `f` 结尾的浮点数字面量是 `float` 类型，其余均为 `double` 类型。因此，以下的语句是不合法的：

```java
float doubleVariable = 3.1415;
```

#### 布尔型变量：`boolean`

在 Java 中，布尔型变量用 `boolean` 来定义，而非像 C++ 一样使用关键字 `bool`。

#### 字符：`char`

在 Java 中，`char` 类型用于表示 Unicode 字符，而不是 ASCII。每个 `char` 类型的变量可以存储一个 Unicode 码点，其数值范围从 $0$ 到 $65535$（即 $\text{0xFFFF}$）。这意味着 Java 的 `char` 类型甚至能够表示汉字。

#### 数组

在 Java 中，推荐将数组的定义（`[]`）写在类型后面，例如 `int[] arr`、`String[][] array_2d` 等，而非 `double xs[]`。

#### 代码示例

```java title="VariablesExample.java"
package examples.introduction;

public class Variables {
    public static void main(String[] args) {
        // Integers
        byte byteVariable = 123;
        short shortVariable = 12345;
        int intVariable = 1234567890;
        long longVariable = 1234567890123456789L;

        // Floating-point Numbers
        float floatVariable = 3.14f;
        double doubleVariable = 3.14159265358979;

        // Character
        char charVariable = 'A';

        // Boolean
        boolean booleanVariable = true;

        // Printing the values
        System.out.println("byte: " + byteVariable);
        System.out.println("short: " + shortVariable);
        System.out.println("int: " + intVariable);
        System.out.println("long: " + longVariable);
        System.out.println("float: " + floatVariable);
        System.out.println("double: " + doubleVariable);
        System.out.println("char: " + charVariable);
        System.out.println("boolean: " + booleanVariable);

        // Integer array
        int[] intArray = {1, 2, 3, 4, 5};

        // Accessing array elements
        System.out.println("First element: " + intArray[0]);
        System.out.println("Last element: " + intArray[intArray.length - 1]);

        // Iterating through the array
        System.out.println("Iterating through the array:");
        for (int i = 0; i < intArray.length; i++) {
            System.out.println(intArray[i]);
        }

        // Character array
        char[] charArray = {'a', 'b', 'c', 'd', 'e'};

        // Iterating through the character array
        System.out.println("Iterating through the character array:");
        for (char c : charArray) {
            System.out.println(c);
        }
    }
}
```

### 运算符

运算符中可能仅有 `>>>` 不常见。`>>>` 是专门针对**有符号数**设计的“逻辑右移”。

和 `>>`（算术右移）不同的是，逻辑右移在最高位补 0；而算术右移补的是符号位（即，符号位为 1 则补 1，符号位为 0 则补 0）。

例如，`int x = -4;`，即 `11111111 11111111 11111111 11111100`，则：

- `x >>> 1` 为 `01111111 11111111 11111111 11111110`，即 $2147483646$；
- `x >> 1` 为 `11111111 11111111 11111111 11111110`，即 $-2$。

```java title="OperatorsExample.java"
package examples.introduction;

public class Operators {
    public static void main(String[] args) {
        int a = 114;
        int b = 514;
        System.out.println("a + b = " + (a + b));
        System.out.println("a - b = " + (a - b));
        System.out.println("a * b = " + (a * b));

        // int / int = int
        System.out.println("a / b = " + (a / b));
        // int / double = double
        System.out.println("a / b = " + (a / (double) b));

        System.out.println("a % b = " + (a % b));
        System.out.println("a++ = " + (a++));
        System.out.println("++a = " + (++a));
        System.out.println("b += 100 = " + (b += 100));
        System.out.println("a == b = " + (a == b));
        System.out.println("a != b = " + (a != b));
        System.out.println("a > b = " + (a > b));
        System.out.println("a >= b = " + (a >= b));
        System.out.println("a & b = " + (a & b));
        System.out.println("a | b = " + (a | b));
        System.out.println("a ^ b = " + (a ^ b));
        System.out.println("~a = " + (~a));
        System.out.println("a << 2 = " + (a << 2));

        int x = -4;
        // Arithmetic shift
        System.out.println("x >> 2 = " + (x >> 1));
        // Logical shift
        System.out.println("x >>> 2 = " + (x >>> 1));

        boolean c = true;
        boolean d = false;
        System.out.println("c && d = " + (c && d));
        System.out.println("c || d = " + (c || d));
        System.out.println("!c = " + (!c));
        System.out.println("c ? 'T' : 'F' = " + (c ? 'T' : 'F'));
    }
}
```

### 控制流语句

Java 和 C++ 的控制流语句大同小异，可以结合以下例子进行学习。

```java title="ControlFlowExample.java"
package examples.introduction;

public class ControlFlow {
    public static void main(String[] args) {
        // if-else example
        int age = 18;
        if (age >= 18) {
            System.out.println("You are an adult.");
        } else {
            System.out.println("You are a minor.");
        }

        // switch example
        int month = 3;
        String monthName;
        switch (month) {
            case 1:
                monthName = "January";
                break;
            case 2:
                monthName = "February";
                break;
            case 3:
                monthName = "March";
                break;
            default:
                monthName = "Invalid month";
        }
        System.out.println("The month is " + monthName);

        // for loop example
        System.out.println("Counting from 1 to 5:");
        for (int i = 1; i <= 5; i++) {
            System.out.println(i);
        }

        // while loop example
        int counter = 0;
        while (counter < 3) {
            System.out.println("Counter value: " + counter);
            counter++;
        }

        // do-while loop example
        int number = 5;
        do {
            System.out.println("Number value: " + number);
            number--;
        } while (number > 0);

        // break example
        for (int i = 0; i < 10; i++) {
            if (i == 5) {
                System.out.println("Breaking the loop at i = 5");
                break;
            }
            System.out.println("i = " + i);
        }

        // continue example
        for (int i = 0; i < 10; i++) {
            if (i % 2 == 0) {
                continue;
            }
            System.out.println("Odd number: " + i);
        }
    }
}
```

### 异常处理

Java 将异常分为两大类：

1. **受检异常（Checked Exceptions）**：
   - 编译器会检查这些异常是否被处理或声明抛出。
   - 如果方法可能抛出受检异常，调用者必须要么捕获该异常，要么在方法签名中声明抛出该异常。
   - 常见的受检异常有 `IOException`、`SQLException`、`ClassNotFoundException` 等。
2. **非受检异常（Unchecked Exceptions）**：
   - 这些异常不会被编译器检查。
   - 包括 `RuntimeException` 及其子类，如 `NullPointerException`、`ArrayIndexOutOfBoundsException`、`IllegalArgumentException` 等。
   - 非受检异常可以不被显式捕获，也可以在方法签名中不声明抛出。

对于非受检异常，Java 并不要求开发者必须显式捕获或声明抛出。这是因为非受检异常通常是由于程序逻辑错误或输入数据错误导致的，应该在代码设计和编写时就尽量避免这类异常的发生。

相比之下，受检异常通常是由于外部原因（如 I/O 错误、网络异常等）导致的，开发者无法完全控制。因此，Java 要求开发者必须处理这些异常，以确保程序的健壮性和可靠性。

```java title="ExceptionHandlingExample.java"
package examples.introduction;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ExceptionHandling {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a non-negative integer n, and I will try to calculate 100 / n: ");
        try {
            int n = sc.nextInt();
            int result = 100 / n; // if n = 0 then `ArithmeticException` will be thrown
            if (n < 0)
                throw new IllegalArgumentException("Number is negative."); // custom exception
            System.out.println("Result: " + result);
        } catch (ArithmeticException e) { // will be executed if n = 0
            System.out.println("Number is zero.");
        } catch (InputMismatchException e) {
            System.out.println("Number is not a integer.");
        } catch (Exception e) { // will be executed if other exception occurs
            e.printStackTrace();
        } finally { // will be executed always
            System.out.println("Finally block is always executed.");
            sc.close();
        }
    }
}
```

不过，在程序开发过程中，即使出现了未捕获的异常导致程序发生 Runtime Error，也可以通过**查看调用栈**中的调试信息，来找到问题出错的根源。

## 标准库

正如 C++ 中的 STL 一样，Java 也有很多标准库。以下代码均包含于 `src/main/java/examples/datastructures` 中。

### `BigInteger` 和 `BigDecimal`

`BigInteger` 和 `BigDecimal` 是 Java 中用于处理大数和高精度计算的两个类。它们属于 `java.math` 包。

- **`BigInteger`** 类用于表示整数值，它不受 Java 内置的 `int` 和 `long` 类型所受的固定大小限制。`BigInteger` 可以处理任意精度的整数，包括非常大的数值，例如在示例代码中展示的 `123456789012345678901234567890`。

- **`BigDecimal`** 类用于表示具有精确小数位的小数值，它提供了对小数点后任意位数的精确控制。`BigDecimal` 常用于需要高精度计算的金融领域。

示例代码展示了 `BigInteger` 和 `BigDecimal` 的基本使用，包括创建实例、执行基本的算术操作（加、减、乘、除），以及展示 `BigDecimal` 的精度控制。

```java title="BigIntegerAndBigDecimalExample.java"
package examples.datastructures;

import java.math.BigDecimal;
import java.math.BigInteger;

public class BigIntegerAndBigDecimalExample {
    public static void main(String[] args) {
        // Example usage of BigInteger
        BigInteger bigInt = new BigInteger("123456789012345678901234567890");
        System.out.println("BigInteger: " + bigInt);

        // Arithmetic operations with BigInteger
        BigInteger bigInt1 = new BigInteger("987654321098765432109876543210");
        BigInteger bigInt2 = new BigInteger("100");
        BigInteger sum = bigInt1.add(bigInt2);
        BigInteger difference = bigInt1.subtract(bigInt2);
        BigInteger product = bigInt1.multiply(bigInt2);
        BigInteger quotient = bigInt1.divide(bigInt2);

        System.out.println("Sum: " + sum);
        System.out.println("Difference: " + difference);
        System.out.println("Product: " + product);
        System.out.println("Quotient: " + quotient);

        // Example usage of BigDecimal
        BigDecimal bigDec = new BigDecimal("1234567890.12345678901234567890");
        System.out.println("BigDecimal: " + bigDec);

        // Arithmetic operations with BigDecimal
        BigDecimal bigDec1 = new BigDecimal("987654321.098765432109876543210");
        BigDecimal bigDec2 = new BigDecimal("0.0012345");
        BigDecimal sumBD = bigDec1.add(bigDec2);
        BigDecimal differenceBD = bigDec1.subtract(bigDec2);
        BigDecimal productBD = bigDec1.multiply(bigDec2);
        BigDecimal quotientBD = bigDec1.divide(bigDec2, 10, BigDecimal.ROUND_HALF_UP);

        System.out.println("BigDecimal Sum: " + sumBD);
        System.out.println("BigDecimal Difference: " + differenceBD);
        System.out.println("BigDecimal Product: " + productBD);
        System.out.println("BigDecimal Quotient (rounded to 10 scale): " + quotientBD);

        // Demonstrate precision of BigDecimal
        BigDecimal pi = new BigDecimal(Math.PI);
        System.out.println("Pi (to 10 scale): " + pi.setScale(10, BigDecimal.ROUND_HALF_UP));
    }
}
```

### `String`、`StringBuffer` 和 `StringBuilder`

Java 中的 `String` 类表示**不可变字符串**，这意味着对 `String` 对象的任何修改都会生成一个**新的 `String` 对象**。`StringBuffer` 和 `StringBuilder` 都是可变的字符串缓冲区，允许在不创建新对象的情况下修改字符串。

- **`String`** 类的示例代码展示了字符串的不可变性。每次使用 `+` 操作符连接字符串时，都会创建一个新的 `String` 对象。

- **`StringBuffer`** 是线程安全的，可以在多线程环境中使用。示例代码展示了如何使用 `append`、`insert` 和其他方法来修改 `StringBuffer` 的内容。

- **`StringBuilder`** 与 `StringBuffer` 类似，但它不是线程安全的，因此在单线程环境中使用时通常比 `StringBuffer` 更快。示例代码演示了 `StringBuilder` 的使用，包括清空内容、追加字符串、插入字符串等操作。

```java title="StringAndStringBufferAndStringBuilderExample.java"
package examples.datastructures;

public class StringAndStringBufferAndStringBuilderExample {
    public static void main(String[] args) {
        // String array
        String[] stringArray = {"apple", "banana", "cherry"};

        // Iterating through the string array
        System.out.println("Iterating through the string array:");
        for (String s : stringArray) {
            System.out.println(s);
        }

        // Demonstrating String immutability
        String str = "Hello";
        System.out.println("Original String: " + str);
        str += " World"; // New String object is created
        System.out.println("After concatenation: " + str);

        // Demonstrating StringBuffer usage
        StringBuffer stringBuffer = new StringBuffer("Initial");
        stringBuffer.append(" String"); // Appending to StringBuffer
        stringBuffer.insert(0, "Another "); // Inserting into StringBuffer
        System.out.println("StringBuffer: " + stringBuffer);

        // Demonstrating StringBuilder usage
        StringBuilder stringBuilder = new StringBuilder("Initial");
        stringBuilder.append(" String"); // Appending to StringBuilder
        stringBuilder.insert(0, "Another "); // Inserting into StringBuilder
        System.out.println("StringBuilder: " + stringBuilder);

        // StringBuilder is generally faster than StringBuffer
        // because it is not synchronized, making it ideal for single-threaded scenarios.

        // Example of using StringBuilder for complex string manipulations
        System.out.println("Complex StringBuilder operations:");
        stringBuilder.setLength(0); // Clear the StringBuilder content
        stringBuilder.append("Looping and ");
        stringBuilder.append("building a long ");
        stringBuilder.append("string in a ");
        stringBuilder.append("StringBuilder.");
        System.out.println(stringBuilder);

        // Convert StringBuilder to String
        String finalString = stringBuilder.toString();
        System.out.println("StringBuilder converted to String: " + finalString);
    }
}
```

### `Arrays` 和 `ArrayList`

`Arrays` 类提供了一系列静态方法来操作数组，而 `ArrayList` 是一个基于数组实现的可调整大小的集合。

- **`Arrays`** 类的示例代码展示了如何使用 `Arrays` 类来打印数组内容、获取数组长度、执行二分查找、复制数组、排序以及填充数组。

- **`ArrayList`** 是 `java.util` 包中的一个类，提供了动态数组的功能。示例代码展示了如何向 `ArrayList` 中添加元素、检查元素是否存在、获取和设置元素、移除元素以及清空列表。

```java title="ArraysAndArrayListExample.java"
package examples.datastructures;

import java.util.ArrayList;
import java.util.Arrays;

public class ArraysAndArrayListExample {
    public static void main(String[] args) {
        // Example usage of Arrays
        int[] numbersArray = {1, 1, 4, 5, 1, 4};

        // Print the length of the array
        System.out.println("numbersArray.length = " + numbersArray.length);

        // Print the first element of the array
        System.out.println("numbersArray[0] = " + numbersArray[0]);

        // Use Arrays.toString to print the contents of the array
        System.out.println("Arrays.toString(numbersArray) = " + Arrays.toString(numbersArray));

        // Check if the array is equal to itself
        System.out.println("Arrays.equals(numbersArray, numbersArray) = " + Arrays.equals(numbersArray, numbersArray));

        // Use Arrays.binarySearch to perform binary search for the element 4
        System.out.println("Arrays.binarySearch(numbersArray, 4) = " + Arrays.binarySearch(numbersArray, 4));

        // Use Arrays.copyOf to create a new array containing the first 3 elements of the original array
        System.out.println("Arrays.copyOf(numbersArray, 3) = " + Arrays.toString(Arrays.copyOf(numbersArray, 3)));

        // Use Arrays.copyOfRange to create a subarray from index 1 to 3
        System.out.println("Arrays.copyOfRange(numbersArray, 1, 3) = " + Arrays.toString(Arrays.copyOfRange(numbersArray, 1, 3)));

        // Use Arrays.sort to sort the array
        Arrays.sort(numbersArray);
        System.out.println("Arrays.sort(numbersArray) = " + Arrays.toString(numbersArray));

        // Use Arrays.fill to fill the array with zeros
        Arrays.fill(numbersArray, 0);
        System.out.println("Arrays.fill(numbersArray, 0) = " + Arrays.toString(numbersArray));

        // Print the hash code of the array after filling with zeros
        System.out.println("Arrays.hashCode(numbersArray) = " + Arrays.hashCode(numbersArray));

        // Example usage of ArrayList
        ArrayList<String> sitesList = new ArrayList<>();

        // Add elements to the ArrayList
        sitesList.add("Google");
        sitesList.add("Runoob");
        sitesList.add("Taobao");
        sitesList.add("Weibo");

        // Print all elements in the ArrayList
        System.out.println("ArrayList<String> sitesList = " + sitesList);

        // Example of other ArrayList operations
        // Check if the ArrayList contains a specific element
        System.out.println("sitesList.contains(\"Runoob\") = " + sitesList.contains("Runoob"));

        // Get the size of the ArrayList
        System.out.println("sitesList.size() = " + sitesList.size());

        // Remove an element from the ArrayList
        sitesList.remove("Taobao");
        System.out.println("sitesList after removing \"Taobao\" = " + sitesList);

        // Get an element at a specific index
        System.out.println("sitesList.get(1) = " + sitesList.get(1));

        // Set an element at a specific index
        sitesList.set(1, "Baidu");
        System.out.println("sitesList after setting index 1 to \"Baidu\" = " + sitesList);

        // Clear all elements in the ArrayList
        sitesList.clear();
        System.out.println("sitesList after clear() = " + sitesList);
    }
}
```

### `LinkedList`

`LinkedList` 是 Java 中的一个双向链表实现，允许对列表中的元素进行高效的插入、删除操作。

示例代码展示了如何创建 `LinkedList` 实例、添加和删除元素、访问首尾元素、以及遍历链表。

```java title="LinkedListExample.java"
package examples.datastructures;

import java.util.LinkedList;
import java.util.List;

public class LinkedListExample {
    public static void main(String[] args) {
        // Create a new LinkedList instance
        List<String> linkedList = new LinkedList<>();

        // Add elements to the LinkedList
        linkedList.add("Element 1");
        linkedList.add("Element 2");
        linkedList.add("Element 3");

        // Print the LinkedList
        System.out.println("Initial LinkedList: " + linkedList);

        // Access the first element
        String firstElement = linkedList.get(0);
        System.out.println("First Element: " + firstElement);

        // Access the last element
        String lastElement = linkedList.get(linkedList.size() - 1);
        System.out.println("Last Element: " + lastElement);

        // Remove the first occurrence of an element
        linkedList.remove("Element 2");
        System.out.println("LinkedList after removing 'Element 2': " + linkedList);

        // Add an element at the beginning
        linkedList.addFirst("New First Element");
        System.out.println("LinkedList after adding new first element: " + linkedList);

        // Add an element at the end
        linkedList.addLast("New Last Element");
        System.out.println("LinkedList after adding new last element: " + linkedList);

        // Remove the first element
        linkedList.removeFirst();
        System.out.println("LinkedList after removing the first element: " + linkedList);

        // Remove the last element
        linkedList.removeLast();
        System.out.println("LinkedList after removing the last element: " + linkedList);

        // Get the size of the LinkedList
        int size = linkedList.size();
        System.out.println("Size of the LinkedList: " + size);

        // Check if the LinkedList is empty
        boolean isEmpty = linkedList.isEmpty();
        System.out.println("Is the LinkedList empty? " + isEmpty);

        // Clear all elements from the LinkedList
        linkedList.clear();
        System.out.println("LinkedList after clear(): " + linkedList);

        // Demonstrate iteration over LinkedList elements
        System.out.println("Iterating over LinkedList elements:");
        for (String element : linkedList) {
            System.out.println(element);
        }
    }
}
```

### `HashSet`

`HashSet` 是 Java 中的一个不允许重复元素的集合实现。它基于 `HashMap` 实现，因此具有快速的查找速度。

示例代码中的 `HashSetExample` 应为 `HashSetExample` 而不是 `HashMapExample`。代码应该展示如何使用 `HashSet` 来添加元素、检查元素是否存在、移除元素以及遍历集合。

```java title="HashSetExample.java"
package examples.datastructures;

import java.util.HashMap;
import java.util.Map;

public class HashMapExample {
    public static void main(String[] args) {
        // Create a new HashMap instance
        Map<String, Integer> map = new HashMap<>();

        // Put key-value pairs into the HashMap
        map.put("One", 1);
        map.put("Two", 2);
        map.put("Three", 3);

        // Print the HashMap
        System.out.println("Initial HashMap: " + map);

        // Get the value associated with a key
        Integer value = map.get("Two");
        System.out.println("Value for key 'Two': " + value);

        // Check if a key exists in the HashMap
        boolean containsKey = map.containsKey("Three");
        System.out.println("Does the key 'Three' exist? " + containsKey);

        // Remove a key-value pair from the HashMap
        map.remove("One");
        System.out.println("HashMap after removing 'One': " + map);

        // Get the size of the HashMap
        int size = map.size();
        System.out.println("Size of the HashMap: " + size);

        // Check if the HashMap is empty
        boolean isEmpty = map.isEmpty();
        System.out.println("Is the HashMap empty? " + isEmpty);

        // Clear all key-value pairs from the HashMap
        map.clear();
        System.out.println("HashMap after clear(): " + map);

        // Demonstrate iteration over HashMap entries
        System.out.println("Iterating over HashMap entries:");
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }
}
```

### `HashMap`

`HashMap` 是 Java 中的一个键值对集合，它允许存储唯一的键和对应的值。`HashMap` 不保证元素的顺序，并且不是线程安全的。

示例代码展示了如何创建 `HashMap` 实例、添加键值对、获取与键关联的值、检查键是否存在、移除键值对、获取 `HashMap` 的大小、检查 `HashMap` 是否为空以及清空 `HashMap`。

```java title="HashMapExample.java"
package examples.datastructures;

import java.util.HashMap;
import java.util.Map;

public class HashMapExample {
    public static void main(String[] args) {
        // Create a new HashMap instance
        Map<String, Integer> map = new HashMap<>();

        // Put key-value pairs into the HashMap
        map.put("One", 1);
        map.put("Two", 2);
        map.put("Three", 3);

        // Print the HashMap
        System.out.println("Initial HashMap: " + map);

        // Get the value associated with a key
        Integer value = map.get("Two");
        System.out.println("Value for key 'Two': " + value);

        // Check if a key exists in the HashMap
        boolean containsKey = map.containsKey("Three");
        System.out.println("Does the key 'Three' exist? " + containsKey);

        // Remove a key-value pair from the HashMap
        map.remove("One");
        System.out.println("HashMap after removing 'One': " + map);

        // Get the size of the HashMap
        int size = map.size();
        System.out.println("Size of the HashMap: " + size);

        // Check if the HashMap is empty
        boolean isEmpty = map.isEmpty();
        System.out.println("Is the HashMap empty? " + isEmpty);

        // Clear all key-value pairs from the HashMap
        map.clear();
        System.out.println("HashMap after clear(): " + map);

        // Demonstrate iteration over HashMap entries
        System.out.println("Iterating over HashMap entries:");
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }
}
```

## 面向对象程序设计

Java 最初的设计目标之一就是成为一种纯粹的面向对象语言。所有的代码都必须包含在类（Class）中，基本上所有元素都是对象（基本数据类型除外）。它支持封装、继承和多态等面向对象的核心概念，并鼓励开发者使用这些概念构建模块化和可重用的代码。具体地说，**所有的 Java 代码都需要封装在类里，每一个 `.java` 文件恰有一个与其同名的 `public` 类**。

> 面向对象编程的基本流程为：
>
> 1. 设计类 `class Car { /* ... */ }`
> 2. 创建/实例化对象 `Car myCar = new Car();`
> 3. 向对象发送消息 `myCar.move();`

Java 使用垃圾回收（Garbage Collection，GC）机制进行内存管理。开发者不需要显式地分配和释放内存，这减轻了开发负担并减少了内存泄漏和悬挂指针等常见的错误。也就是说，**Java 没有指针的概念**。函数传参**只有传值没有传引用**。

Java 程序员只需要关心何时 `new` 一个对象，而不需要考虑何时 `delete` 它。

Java 通过封装的概念将数据和操作封装在对象中。对象可以隐藏其内部状态和实现细节，只暴露出对外提供的接口。这种封装性可以保护数据的安全性和一致性，并提供更好的模块化和代码组织。

以下代码均包含于 `src/main/java/examples/oop` 中。

### Package

Java 通过包（package）来组织代码。

- 包名使用 `.` 建立层次结构，应当与文件目录结构相同。
- 包名通常全小写且单词之间无分隔。

```java title="package1/package2/PackageExample.java"
package examples.oop.package1.package2;

public class PackageExample {
    public static void main(String[] args) {
        System.out.println("This is a package example");
    }
}
```

以上代码在目录中的组织结构为：

```
examples
│
└───oop
    │
    └───package1
        │
        └───package2
            │
            └───PackageExample.java
```

### `class`

Java 中的 `class` 和 C++ 中的 `class` 比较类似。

#### 类修饰符：`public`、`protected` 和 `private`

与 C++ 中相同，Java 中也有 `public`、`protected` 和 `private` 修饰符。

#### 构造函数

Java 中**构造函数**的声明与 C++ 相同。

```java
class Test {
    private int variable_1;
    private String variable_2;
    
    public Test(int variable_1, String variable) { // 构造函数
        this.variable = variable_1; // 与参数同名，则需要显式写出 this
        variable_2 = variable; // 不同名，则不需要显式写出 this
    }
}
```

#### 析构函数

Java 语言本身并没有像 C++ 中那样明确定义的**析构函数**。Java 采用的是垃圾回收机制（Garbage Collection，GC）来自动管理内存，因此不需要程序员手动释放对象占用的内存。

虽然 Java 中也有类似于析构函数的 `finalize()` 语句，但它并不被推荐使用，具体的原因也不在这里多做介绍。感兴趣的同学可以查找 `finalize()` 方法、`try-with-resource` 语句和 `AutoClosable` 接口等相关资料。

#### `static`

`static` 是 Java 编程语言中的一个关键字，用于表示某个成员（变量或方法）属于类本身，而不是类的某个特定对象（实例）。这意味着使用 `static` 修饰的成员可以在不创建类实例的情况下被访问和使用。

**主要特点**

1. **类级别的属性**：`static` 变量是类的所有实例共享的，称为类变量或静态变量。
2. **无需实例化**：可以直接通过类名访问 `static` 方法和变量，无需创建类的实例。
3. **存储位置**：`static` 变量存储在 Java 堆内存的方法区，而非某个具体对象的内存空间。
4. **生命周期**：`static` 变量和方法的生命周期与类加载和卸载的过程相关联。
5. **不变性**：`static` 方法不能访问类的非静态成员变量和方法，因为它们与任何具体对象的状态无关。

**代码示例**

在下面这份代码中，在 `Car` 这个类里，`counter` 是一个静态变量。

- **静态变量作为计数器**：`counter` 作为静态变量，用于跟踪创建的 `Car` 实例数量。每次创建 `Car` 实例时，`counter` 都会递增。这说明，静态变量在实例化过程中具有“共享”的特性。
- **无需实例化访问**：直接使用类名 `Car`，可以访问静态变量 `counter`。即使没有创建类的实例，也可以访问和操作静态成员。

```java title="StaticExample.java"
package examples.oop;

public class StaticExample {
    static class Car {
        static int counter = 0;
        String name;

        Car(String name) {
            this.name = name;
            counter++;
        }
    }
    public static void main(String[] args) {
        Car a = new Car("Benz");
        System.out.println("First car: " + a + ". Total car count: " + Car.counter);
        Car b = new Car("Honda");
        System.out.println("Second car: " + b + ". Total car count: " + Car.counter);
        Car c = new Car("Volkswagen");
        System.out.println("Third car: " + c + ". Total car count: " + Car.counter);
    }
}
```

#### 实例初始化块

在类中直接使用 `{}` 扩起来的部分称为实例初始化块，它会在任何构造器运行之前运行。

```java
class Test {
    { System.out.println("This is an Instance Initialization Block."); }
    public Test() {
        System.out.println("This is a constructor.");
    }
}
```

当实例化一个 `Test` 类型的对象时，运行结果将会是

```
This is an Instance Initialization Block.
This is a constructor.
```

#### `final`

`final` 修饰的成员变量是**常量**，因此除了声明赋值、构造函数、实例初始化块之外，不允许对其进行其他修改。

通常使用 `static final` 来定义**静态常量**。一般使用 SCREAMING_SNAKE_CASE（全字母大写，用下划线分隔）来命名。例如：

```java
public class Wordle {
    static final int ALPHABET_SIZE = 26;            // The size of the alphabet
    static final int WORD_LENGTH = 5;               // The length of words
    static final int TOTAL_CHANCES = 6;             // The chances in total
    // ...
}
```

### 组合与继承

#### 组合

- **概念**：组合是一种对象包含其他对象的关系，展示了“has-a”关系。例如，一个汽车对象可能包含引擎和轮胎对象。
- **实现**：通过在类中创建其他类的实例作为成员变量来实现。
- **优点**：提供了更大的灵活性，因为组合的对象可以独立于组合类存在，并且可以在运行时动态地替换或修改。

**代码示例**

在这份代码中，一个汽车对象包含了一个引擎对象和一个轮胎对象。每个类（`Engine`、`Tyre` 和 `Car`）都封装了自己的属性和行为，提供了一个清晰的接口来与外部世界交互。

```java title="CompositionExample.java"
package examples.oop;

public class CompositionExample {
    static class Engine {
        int typeCode;

        Engine(int typeCode) {
            this.typeCode = typeCode;
        }
        @Override
        public String toString() {
            return "Engine [typeCode=" + typeCode + "]";
        }
    }
    static class Tyre {
        int radius;

        Tyre(int radius) {
            this.radius = radius;
        }
        @Override
        public String toString() {
            return "Tyre [radius=" + radius + "]";
        }
    }
    static class Car {
        Engine engine;
        Tyre tyre;

        Car(int engineTypeCode, int tyreRadius) {
            this.engine = new Engine(engineTypeCode);
            this.tyre = new Tyre(tyreRadius);
        }
        @Override
        public String toString() {
            return "Car {" + engine + ", " + tyre + "}";
        }
    }
    public static void main(String[] args) {
        Car car = new Car(3, 5);
        System.out.println(car);
    }
}
```

#### 继承

- **概念**：继承是一种类与类之间的层级关系，展示了“is-a”关系。例如，狗类和猫类可以继承动物类的特性。
- **实现**：通过使用 `extends` 关键字来实现基类（父类）的继承。
- **优点**：支持代码复用，允许新类自动拥有基类的属性和方法。

**代码示例**

以下代码展示了 `Dog` 类和 `Cat` 类对于 `Animal` 类的继承关系。

1. **`Animal` 类**：这是一个父类，代表动物，有两个属性 `age` 和 `weight`，以及一个 `makeSound()` 方法，该方法在被调用时打印 "Make sound"。
2. **`Dog` 类**：这个类继承自 `Animal` 类，是子类。它添加了一个新属性 `color`，并在其构造函数中调用了父类的构造函数 `super(age, weight)` 来初始化继承的属性。它还重写了 `makeSound()` 方法，以打印 "Bark bark."。
3. **`Cat` 类**：与 `Dog` 类似，`Cat` 类也继承自 `Animal` 类，添加了新属性 `name`。它同样调用了父类的构造函数来初始化继承的属性，并重写了 `makeSound()` 方法，以打印 "Meow meow."。

```java title="InheritanceExample.java"
package examples.oop;

public class InheritanceExample {
    static class Animal {
        int age, weight;

        public Animal(int age, int weight) {
            this.age = age;
            this.weight = weight;
        }
        void makeSound() {
            System.out.println("Make sound");
        }
    }
    static class Dog extends Animal {
        String color;

        Dog(int age, int weight, String color) {
            super(age, weight);
            this.color = color;
        }
        @Override
        void makeSound() {
            System.out.println("Bark bark.");
        }
    }
    static class Cat extends Animal {
        String name;

        Cat(int age, int weight, String name) {
            super(age, weight);
            this.name = name;
        }
        @Override
        void makeSound() {
            System.out.println("Meow meow.");
        }
    }
    public static void main(String[] args) {
        Dog dog = new Dog(3, 25, "White");
        Cat cat = new Cat(4, 4, "Kitty");
        dog.makeSound();
        cat.makeSound();
    }
}
```

### 抽象类

事实上，在“继承”的代码示例中，我们会发现，`Animal` 类的 `makeSound()` 方法并没有被调用；这个方法被所有继承 `Animal` 类的子类都重载了。我们还会发现一个逻辑上的问题——世界上不存在一个仅仅是“动物”的对象。它可以是“狗”、可以是“猫”，但它不能仅仅是“动物”。

因此，我们应该将 `Animal` 类实现为一个**抽象类**。抽象类是一种**不能被实例化**的类，它通常被用作其他类的基类。抽象类可以包含抽象方法，这些方法没有具体的实现，就像 C++ 中的纯虚函数一样。

而 `Animal` 类中的 `makeSound()` 方法就是一个抽象方法。它只需要被声明，而不需要被定义。

更改后的代码如下：

```java title="AbstractClassExample.java"
package examples.oop;

public class AbstractClassExample {
    abstract static class Animal {
        int age, weight;

        public Animal(int age, int weight) {
            this.age = age;
            this.weight = weight;
        }
        abstract void makeSound();
    }
    static class Dog extends Animal {
        String color;

        Dog(int age, int weight, String color) {
            super(age, weight);
            this.color = color;
        }
        @Override
        void makeSound() {
            System.out.println("Bark bark.");
        }
    }
    static class Cat extends Animal {
        String name;

        Cat(int age, int weight, String name) {
            super(age, weight);
            this.name = name;
        }
        @Override
        void makeSound() {
            System.out.println("Meow meow.");
        }
    }
    public static void main(String[] args) {
        Dog dog = new Dog(3, 25, "White");
        Cat cat = new Cat(4, 4, "Kitty");
        dog.makeSound();
        cat.makeSound();
        // Animal animal = new Animal(1, 2); // This is prohibited
    }
}
```

### 多重继承与接口

#### 多重继承

多重继承是指一个类可以同时继承多个父类。然而，在 Java 中，类的多重继承是不被支持的，这意味着 Java 类不能直接从多个类继承。这是因为多重继承可能导致所谓的“菱形问题”（Diamond Problem）。

假设其中继承的两个父类可能都定义了相同的方法，那么应该从哪个接口中继承该方法呢？这没有办法确定。

#### 接口

由于 Java 不支持类的多重继承，接口提供了一种替代方案来实现类似多重继承的特性。接口是一组抽象方法的集合，它可以被任何类实现，而不受这个类继承体系的限制。

~~如果你学过 Rust，那么你会发现，这类似于 Rust 里的 `trait`。~~

```java title="InterfaceExample.java"
package examples.oop;

public class InterfaceExample {
    interface Flyable {
        void fly();
    }

    interface Drivable {
        void drive();
    }
    
    static class Vehicle implements Flyable, Drivable {
        @Override
        public void fly() {
            System.out.println("Flying");
        }

        @Override
        public void drive() {
            System.out.println("Driving");
        }
    }
    public static void main(String[] args) {
        Vehicle vehicle = new Vehicle();
        vehicle.fly();
        vehicle.drive();
    }
}
```

### `java.lang.Object`

> 所有对象都是它的对象。

在 Java 中，`java.lang.Object` 是所有类的根类，它位于类继承层次结构的顶端。每个 Java 类（除了 `Object` 本身）都隐式地继承自 `Object` 类。`Object` 类提供了一些基本方法，这些方法必须在子类中正确实现，以确保正确处理“判断两个对象是否相等”这一问题。

#### 对象的字符串描述：`toString()`

- `toString()` 方法默认返回 `<类型名>@<哈希码的十六进制表示>` 的形式，例如 `Student@68be2bc2`。这种默认实现通常没有实际用途。

- 为了提供更有用的字符串描述，通常需要重写 `toString()` 方法。例如

  ```java
  @Override
  public String toString() {
      return "Person [name=" + name + ", age=" + age + "]";
  }
  ```

#### 比较二者是否相等：`equals()`

`equals()` 方法用于比较两个对象的**内容是否相等**，而不是它们的内存地址。

- **自反性**：`x.equals(x)` 应返回 `true`。
- **对称性**：`x.equals(y)` 应与 `y.equals(x)` 相等。
- **传递性**：如果 `x.equals(y)` 和 `y.equals(z)` 都返回 `true`，则 `x.equals(z)` 也应返回 `true`。
- **一致性**：多次调用 `equals()` 方法的结果应保持一致。
- **非空性**：`x.equals(null)` 应返回 `false`。

推荐的 `equals()` 的重载方法如下：

```java
@Override
public boolean equals(Object o) {
    if (this == o) return true; // 如果两个对象引用相同，那内容一定相同
    if (o == null || getClass() != o.getClass()) return false; // 如果不是这个类的对象，那么一定不相同
    Student student = (Student) o; // 强制转换为此类对象
    if (studentID != student.studentID) return false; // 依次比较各个域
    if (age != student.age) return false; // 依次比较各个域
    // ...
    // 依次比较各个域
    return true;
}
```

#### 哈希码：`hashCode()`

哈希码是用于哈希表（如 `HashMap` 和 `HashSet`）中快速查找对象的关键。正确实现哈希码对于这些数据结构的性能至关重要。

- **一致性**：如果两个对象通过 `equals()` 方法比较相等，则它们的哈希码也必须相等。
- **不同对象的哈希码应尽可能不同**：这有助于减少哈希冲突。

为了减轻程序员设计哈希函数的负担，`Objects.hash()` 已经提供了一种哈希函数：

```java
@Override
public int hashCode() {
    return Objects.hash( /* 填入各个成员域 */ );
}
```

#### 代码示例

```java title="ObjectExample.java"
package examples.oop;

import java.util.Objects;

public class ObjectExample {
    static abstract class Person {
        String name;
        int age;

        public Person(String name, int age) {
            this.name = name;
            this.age = age;
        }
        @Override
        public String toString() {
            return "Person [name=" + name + ", age=" + age + "]";
        }
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Person person = (Person) o;
            if (age != person.age) return false;
            return Objects.equals(name, person.name);
        }
        @Override
        public int hashCode() {
            return Objects.hash(name, age);
        }
    }
    static class Student extends Person {
        int studentID;

        public Student(String name, int age, int studentID) {
            super(name, age);
            this.studentID = studentID;
        }
        @Override
        public String toString() {
            return "Student [name=" + name + ", age=" + age + ", studentID=" + studentID + "]";
        }
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Student student = (Student) o;
            if (studentID != student.studentID) return false;
            if (age != student.age) return false;
            return Objects.equals(name, student.name);
        }
        @Override
        public int hashCode() {
            return Objects.hash(name, age, studentID);
        }
    }
    static class Teacher extends Person {
        int teacherID;

        public Teacher(String name, int age, int teacherID) {
            super(name, age);
            this.teacherID = teacherID;
        }
        @Override
        public String toString() {
            return "Teacher [name=" + name + ", age=" + age + ", teacherID=" + teacherID + "]";
        }
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Teacher teacher = (Teacher) o;
            if (teacherID != teacher.teacherID) return false;
            if (age != teacher.age) return false;
            return Objects.equals(name, teacher.name);
        }
    }
    public static void main(String[] args) {
        Student student_1 = new Student("Alice", 18, 2023000000);
        Teacher teacher_1 = new Teacher("Bob", 50, 2000000000);
        Teacher teacher_2 = new Teacher("Carol", 45, 2000000001);
        Teacher teacher_3 = new Teacher("Bob", 50, 2000000000);
        System.out.println("student_1 = " + student_1);
        System.out.println("teacher_1 = " + teacher_1);
        System.out.println("teacher_2 = " + teacher_2);
        System.out.println("student_1 == teacher_1 ? " + student_1.equals(teacher_1));
        System.out.println("teacher_1 == teacher_2 ? " + teacher_1.equals(teacher_2));
        System.out.println("teacher_1 == teacher_3 ? " + teacher_1.equals(teacher_3));
    }
}
```

### 包装类

在 Java 中，基本数据类型是预定义的，它们是原始类型，直接存储在内存中，而不是对象。Java 提供了一种特殊的类，称为**包装类**（Wrapper Class），用于将基本类型包装为对象。

以下是 Java 中的基本类型及其对应的包装类：

| 基本类型  |   包装类    |
| :-------: | :---------: |
|   `int`   |  `Integer`  |
| `double`  |  `Double`   |
|  `float`  |   `Float`   |
|  `char`   | `Character` |
|  `byte`   |   `Byte`    |
|  `short`  |   `Short`   |
|  `long`   |   `Long`    |
| `boolean` |  `Boolean`  |

基本类型不能直接参与面向对象的编程，但包装类可以。这些包装类允许基本类型参与到面向对象的编程中，例如在集合框架中使用。这意味着，`HashSet<int>` 其实是不合法的，你应写 `HashSet<Integer>`。

#### 举例：`Integer` 类

`Integer` 类是 `int` 类型的包装类。以下是一些常用的 `Integer` 类方法：

- **`parseInt(String s)`**：将字符串解析为整数。
- **`toString(int i)`**：将整数转换为字符串。
- **`valueOf(String s)`**：将字符串转换为 `Integer` 对象。
- **`compare(int x, int y)`**：比较两个整数的大小。
- **`max(int a, int b)`** 和 **`min(int a, int b)`**：返回两个整数中的最大值或最小值。

#### 其他包装类

其他包装类如 `Double`、`Float`、`Character` 等也提供了类似的功能。例如：

- **`Double.parseDouble(String s)`**：将字符串解析为双精度浮点数。
- **`Character.isDigit(char ch)`**：检查字符是否为数字。
- **`Byte.parseByte(String s, int radix)`**：将字符串解析为 `byte` 类型的整数。

#### 自动装箱和拆箱

Java 5 引入了自动装箱（Autoboxing）和拆箱（Unboxing）的概念，使得基本类型和其对应的包装类之间的转换更加方便：

- **自动装箱**：将基本类型自动转换为相应的包装类对象。

  ```java
  int i = 5;
  Integer iObject = i; // 自动装箱
  ```

- **自动拆箱**：将包装类对象自动转换为基本类型。

  ```java
  Integer iObject = new Integer(5);
  int i = iObject; // 自动拆箱
  ```

虽然自动装箱和拆箱使得代码更简洁，但过度使用可能会导致性能问题，尤其是在循环中。此外，包装类也有缓存机制，例如 `Integer.valueOf(int i)` 方法在 `-128` 到 `127` 范围内的值会被缓存。

### 枚举类

Java 中的枚举类型是一种特殊的类，它允许定义**一组固定的常量**。枚举类型提供了一种方式来定义一个类型安全的枚举，并且可以包含字段、方法和构造函数。

#### 常见方法

枚举类中有以下常见方法：

- **`values()`**：返回枚举类型的所有枚举常量的数组。
- **`toString()`**：返回枚举常量的字符串表示形式。默认情况下，它返回枚举常量的名称。
- **`hashCode()`**：返回枚举常量的哈希码。
- **`ordinal()`**：返回枚举常量在枚举声明中的顺序，从零开始。

对于枚举类中更多的方法，详情请见 [Enum (Java SE 21 & JDK 21)](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/Enum.html#hashCode())。

#### 特点

枚举类型在需要一组固定的常量时非常有用，例如星期、月份、颜色、方向等，枚举类能使得代码更加清晰和易于维护。

- 枚举类型是**单例的**，每个枚举项都是唯一的实例。
- 枚举可以包含字段、方法和构造函数，但**构造函数不能是公开的**。
- 枚举类型默认继承自 `java.lang.Enum` 类。

#### 代码示例

```java title="EnumExample.java"
package examples.oop;

public class EnumExample {
    public enum Color {
        RED, GREEN, YELLOW, BLACK, WHITE
    }
    public enum ColorWithAbbr {
        RED("R"), GREEN("G"), YELLOW("Y"), BLACK("B"), WHITE("W");

        private final String abbr;
        ColorWithAbbr(String abbr) { // equivalent to `private ColorWithAbbr(...)`
            this.abbr = abbr;
        }
        public String getAbbr() {
            return abbr;
        }
    }
    public static void main(String[] args) {
        Color[] colors = Color.values();
        for (Color color : colors) {
            System.out.println(color + " toString() = " + color.toString());
            System.out.println(color + " hashCode() = " + color.hashCode());
            System.out.println(color + " ordinal() = " + color.ordinal());
        }

        ColorWithAbbr[] colorsWithAbbr = ColorWithAbbr.values();
        for (ColorWithAbbr color : colorsWithAbbr) {
            System.out.println(color + " getAbbr() = " + color.getAbbr());
            System.out.println(color + " toString() = " + color);
            System.out.println(color + " hashCode() = " + color.hashCode());
            System.out.println(color + " ordinal() = " + color.ordinal());
        }
    }
}
```

## 参考资料

- 感谢 [Clancy](https://github.com/Clancy-Zhu/) 在 2023 年暑期培训中的 [Java 部分的讲义](https://summer23.net9.org/frontend/java/)。
- 感谢 [xsun2001](https://github.com/xsun2001/) 的 [tour-of-java](https://github.com/xsun2001/tour-of-java)。
- 感谢[菜鸟教程 - Java](https://www.runoob.com/java/)，提供了一份详尽但略显复杂的讲义框架。