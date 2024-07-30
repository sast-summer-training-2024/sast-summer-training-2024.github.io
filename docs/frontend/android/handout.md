## Android 项目结构

### Manifests

在 Android 应用中，`AndroidManifest.xml` 文件是必不可少的。它是 Android 应用的核心配置文件，它包含了应用的元数据和配置信息，用于描述应用的结构和行为。这个文件为系统提供了关于应用的各种关键信息，如应用的**包名**、**应用图标**、**版本信息**、**支持的 Android 版本**、**对外暴露的组件**（如 Activity、Service、BroadcastReceiver 等），以及其他系统需要知道的设置和权限。

以下是一个 `AndroidManifest.xml` 文件的示例：

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <application
        android:allowBackup="true"
        android:dataExtractionRules="@xml/data_extraction_rules"
        android:fullBackupContent="@xml/backup_rules"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.Wordle"
        tools:targetApi="31">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

### Fragments/Activities/Services/Adapters/Intents

这些组件是 Android 应用的基本组成部分，位于 `app/src/main/java/` 文件夹里。

- **Fragments**：可以看作是活动的一部分，用于管理用户界面的一部分。
- **Activities**：是应用中的一个单独的屏幕，用户可以与之交互。
- **Services**：用于在后台执行长时间运行的操作，而不会干扰用户界面。
- **Adapters**：用于将数据绑定到视图组件，如列表视图或网格视图。
- **Intents**：用于启动活动、服务或广播，还可以在应用之间传递数据。

其中，`MainActivity.java` 通常作为应用的主入口点，它是一个继承自 `Activity` 的类，用于定义应用的主界面和用户交互逻辑。

### Tests

测试是确保应用质量和稳定性的重要部分。测试文件通常位于以下两个目录：

- `app/src/test/`：包含单元测试，这些测试在开发人员的机器上运行。
- `app/src/androidTest/`：包含仪器测试，这些测试在设备或模拟器上运行。

### Resources

资源文件是应用的非代码部分，包括图像、字符串、颜色定义等。资源文件位于 `app/src/main/res/` 文件夹中，主要包括：

- `drawable/`：存放图像资源。
- `values/`：存放字符串、颜色定义、尺寸定义等。
- `layout/`：存放应用的布局文件，如 XML 文件。

### Gradle Scripts

Gradle 是 Android 应用的构建系统。Gradle Scripts 用于定义项目的构建过程和依赖关系。主要文件包括：

- `gradle.properties`：定义全局配置，如最小 SDK 版本。
- `gradle-wrapper.properties`：定义 Gradle 包装器的配置。
- `settings.gradle.kts`：定义项目设置，如模块名称。
- `build.gradle.kts`：定义模块的构建逻辑，包括依赖项和插件。

## 基础组件

### Activity

**Activity** 是一个可以包含用户界面的组件，它允许用户在应用程序中执行特定的任务或操作。每个 Activity 代表应用程序中的一个单独的屏幕。

详情可参考 [4.1.1 Activity初学乍练 | 菜鸟教程 (runoob.com)](https://www.runoob.com/w3cnote/android-tutorial-activity.html)。

#### 生命周期

Activity 的生命周期是其最重要的概念之一，它定义了 Activity 在创建、运行、暂停、恢复、停止和销毁时的行为。以下是 Activity 生命周期的主要状态：

- **onCreate(Bundle savedInstanceState)**: 当 Activity 第一次被创建时调用。这是执行初始化设置的地方，如设置布局和恢复保存的状态。
- **onStart()**: 当 Activity 对用户可见时调用，但还没有获得焦点。
- **onResume()**: 当 Activity 可见并开始与用户交互时调用。这是执行动画或计时器等资源密集型操作的地方。
- **onPause()**: 当 Activity 失去焦点或即将停止时调用。这是一个保存应用程序状态或停止动画的好时机。
- **onStop()**: 当 Activity 完全不可见时调用。
- **onDestroy()**: 当 Activity 被销毁时调用，用于清理资源。

### Fragment

**Fragment** 是一个可以包含用户界面部分的组件，它使得程序员可以构建一个复杂的 UI，该 UI 可以独立于 Activity 存在。Fragment 可以被动态地添加、移除或替换。

详情可参考 [5.1 Fragment基本概述 | 菜鸟教程 (runoob.com)](https://www.runoob.com/w3cnote/android-tutorial-fragment-base.html)。

### Service 和 Intent

#### Service

并不是所有组件都是 Activity 和 Fragment，还有很多组件和界面无关，比如播放音乐或下载文件的组件。这就需要用到 Service。它的生命周期与 Activity 等有些差异。

下面的代码中展示了一个音乐播放的 Service，在 `onStartCommand()` 方法中，我们通过接收 Intent 中的音乐 URL，使用 MediaPlayer 播放音乐。在服务销毁时，我们则需要释放 MediaPlayer 的资源。

```java
public class MusicPlayerService extends Service {

    private MediaPlayer mediaPlayer;

    @Override
    public void onCreate() {
        super.onCreate();
        mediaPlayer = new MediaPlayer();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String musicUrl = intent.getStringExtra("music_url");
        try {
            mediaPlayer.setDataSource(musicUrl);
            mediaPlayer.prepare();
            mediaPlayer.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return START_NOT_STICKY; // don't restart when killed by system
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (mediaPlayer != null) {
            mediaPlayer.release();
            mediaPlayer = null;
        }
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
```

更多请见 [4.2.1 Service初涉 | 菜鸟教程 (runoob.com)](https://www.runoob.com/w3cnote/android-tutorial-service-1.html)。

#### Intent

假如我们现在有了 Activity、Fragment 等组件，一个很自然的需求就是让他们之间可以进行通信。最简单的例子是，一个活动调用另一个（我们可以在活动之间传递信息，就像函数一样）。

```java
Intent intent = new Intent(CurrentActivity.this, TargetActivity.class);
/* optional:
    Bundle bundle = new Bundle();
    bundle.putString("string1", "YOUR_STRING");
    intent.putExtras(bundle);
*/
startActivity(intent);

/*  Get your bundle in the target activity:
    Bundle bundle = this.getIntent().getExtras();
    String str1 = bundle.getString("string1");
*/
```

更多请见 [4.5.1 Intent的基本使用 | 菜鸟教程 (runoob.com)](https://www.runoob.com/w3cnote/android-tutorial-intent-base.html)。

## 常用组件

### LinearLayout、GridLayout 和 TableLayout

**LinearLayout** 是一种布局容器，用于在垂直或水平方向上排列子视图。它提供了一种简单的方式来组织布局。

**TableLayout** 是一种用于创建表格布局的容器。它允许你创建行和列，并将子视图放置在这些行和列中。

比如以下组件，就综合运用了 LinearLayout 和 TableLayout 两种布局：

![Layout](https://leverimmy.top/gallery/Introduction-to-Android/layout.png)

整个“键盘”为一个四行的 TableLayout，每一行都是一个 LinearLayout 中包含数个 Button。 

代码如下：

```xml
<TableLayout
    android:id="@+id/KeyboardLayout"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    app:layout_constraintTop_toBottomOf="@id/InputLayout"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent" >

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="horizontal">

        <Button
            android:id="@+id/button_Q"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:padding="0dp"
            android:layout_marginEnd="1dp"
            android:text="Q" />

        <Button
            android:id="@+id/button_W"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:padding="0dp"
            android:layout_marginEnd="1dp"
            android:text="W" />
        <!-- Other buttons... -->

    </LinearLayout>
    
    <LinearLayout> <!-- Other lines... --> </LinearLayout>
    <LinearLayout> <!-- Other lines... --> </LinearLayout>
</TableLayout>
```

**GridLayout** 提供了一种将子视图排列在网格中的灵活方式。你可以指定行数和列数，或者让布局自动调整以适应内容。

例如以下的 GridLayout，可以在对应的 Java 代码中进行修改行数和列数，并给每一个 Grid 填充内容。

```xml
<GridLayout
    android:id="@+id/InputLayout"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent">
</GridLayout>
```

![GridLayout](https://leverimmy.top/gallery/Introduction-to-Android/gridlayout.png)

```java
GridLayout inputLayout = binding.InputLayout;

// 设置行数和列数
inputLayout.setRowCount(TOTAL_CHANCES);
inputLayout.setColumnCount(WORD_LENGTH);
// 设置元素居中方式
inputLayout.setForegroundGravity(Gravity.CENTER);

for (int row = 0; row < inputLayout.getRowCount(); row++) {
    for (int col = 0; col < inputLayout.getColumnCount(); col++) {
        
        // 每个 Grid 里准备放一个 TextView
        TextView textView = new TextView(getContext());
        textView.setText(" ");
        textView.setGravity(Gravity.CENTER);
        textView.setTextSize(50); // 设置文本大小
        textView.setTextColor(Color.WHITE.getRgbCode());
        textView.setBackgroundResource(R.drawable.gray_border); // 设置背景，默认为灰色
        // 设置参数
        GridLayout.LayoutParams params = new GridLayout.LayoutParams();
        params.columnSpec = GridLayout.spec(col, 1); // 设置 TextView 占据一个整列
        params.rowSpec = GridLayout.spec(row, 1); // 设置 TextView 占据一个整行

        int screenWidth = getResources().getDisplayMetrics().widthPixels;
        params.width = screenWidth / inputLayout.getColumnCount();
        params.height = WRAP_CONTENT;

        // 将 TextView 添加到 GridLayout
        inputLayout.addView(textView, params);
    }
}
```

### TextView

**TextView** 是用于显示文本的视图组件。它可以显示单行或多行文本，并且可以设置文本样式，如字体大小、颜色和对齐方式。

就在刚刚的代码中，我们向每个 Grid 中插入了一个 TextView 来展示文字。

```java
// 每个 Grid 里准备放一个 TextView
TextView textView = new TextView(getContext());
textView.setText(" "); // 设置文本内容
textView.setGravity(Gravity.CENTER); // 设置文本居中
textView.setTextSize(50); // 设置文本大小
textView.setTextColor(Color.WHITE.getRgbCode());
textView.setBackgroundResource(R.drawable.gray_border); // 设置背景，默认为灰色
```

### Button

**Button** 是一种用户可以点击的控件，用于触发事件或执行操作。你可以设置按钮的文本、图标和点击监听器。

```xml
<Button
    android:id="@+id/myButton"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:text="Click Me"
    android:textSize="18sp"
    android:textColor="#FFFFFF"
    android:background="@drawable/button_background"
    android:padding="16dp"
    android:layout_margin="8dp"
    android:onClick="onButtonClick" />
```

Button 控件可以通过设置 `OnClickListener` 来响应用户的点击事件：

```java
Button button = findViewById(R.id.myButton);
button.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        // 在这里处理点击事件
        Toast.makeText(this, "Button Clicked!", Toast.LENGTH_SHORT).show();
    }
});
```

### Toast

**Toast** 是 Android 中用于显示简短消息的一种组件，它是一种轻量级的通知方式，可以向用户显示信息，而不会打断用户当前的操作。Toast 消息通常出现在屏幕的底部，并且会在几秒钟后自动消失。

- **创建 Toast 消息**： 使用 `Toast.makeText()` 方法创建一个 Toast 对象，并传入上下文、要显示的消息和显示时长。

  ```java
  Toast toast = Toast.makeText(context, message, duration);
  ```

  - `context`：上下文，通常是 Activity 或 Service 的实例。
  - `message`：要显示的文本消息。
  - `duration`：显示时长，可以是 `Toast.LENGTH_SHORT` 或 `Toast.LENGTH_LONG`。

- **显示 Toast 消息**： 调用 `toast.show()` 方法来显示 Toast 消息。

  ```java
  toast.show();
  ```

- **设置文本颜色**： 使用 `setTextColor()` 方法设置文本颜色。

  ```java
  toast.setDuration(Toast.LENGTH_SHORT);
  toast.setTextColor(Color.WHITE);
  ```

- **设置背景颜色**： 使用 `setBackgroundColor()` 方法设置背景颜色。

  ```java
  TextView textView = toast.getView();
  textView.setBackgroundColor(Color.parseColor("#FF6347")); // tomato color
  ```

### AlertDialog

AlertDialog 是 Android 中用于显示对话框的一种组件，它允许开发者创建包含文本、按钮和其他 UI 元素的模态对话框。模态对话框会阻止用户与应用的其他部分交互，直到对话框被关闭。

**构建 AlertDialog**

1. **创建 Builder 对象**： 使用 `new AlertDialog.Builder(context)` 创建一个 `AlertDialog.Builder` 对象，其中 `context` 通常是当前的 Activity 或 Fragment。
2. **设置标题和消息**： 使用 `setTitle()` 和 `setMessage()` 方法设置对话框的标题和消息文本。
3. **添加按钮**： 使用 `setPositiveButton()`、`setNegativeButton()`、`setNeutralButton()` 方法添加按钮。这些方法接受按钮文本和 `OnClickListener` 作为参数。
4. **创建和显示对话框**： 调用 `create()` 创建对话框实例，然后调用 `show()` 显示对话框。

**按钮和监听器**

- **PositiveButton**：通常用于确认操作，例如 "确定" 或 "是"。
- **NegativeButton**：通常用于取消操作，例如 "取消" 或 "否"。
- **NeutralButton**（不常用）：可以用于提供第三种操作。

按钮的监听器是一个实现了 `DialogInterface.OnClickListener` 接口的匿名类，它提供了两个方法：`onClick(DialogInterface dialog, int which)`，其中 `which` 参数指示哪个按钮被点击。

**自定义 AlertDialog**

除了设置标题、消息和按钮，AlertDialog 还支持以下自定义选项：

- **图标**：使用 `setIcon()` 方法设置对话框的图标。
- **取消操作**：使用 `setCancelable(boolean)` 控制对话框是否可以被取消。
- **取消按钮**：使用 `setOnCancelListener()` 设置当对话框被取消时的监听器。
- **按键监听**：使用 `setOnKeyListener()` 设置当按键事件发生时的监听器。

```java
void processNewGame() {
    AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(getContext());
    dialogBuilder.setTitle("新的游戏")
        .setMessage("你确定要放弃此轮游戏吗？")
        .setPositiveButton("是，并查看答案", (dialogInterface, i) -> {
            Toast.makeText(getContext(), "答案为 " + state.answer.toLowerCase() + "。", Toast.LENGTH_SHORT).show();
            User user = ((MainActivity) getActivity()).loadUser();
            user.totalRounds += 1;
            ((MainActivity) getActivity()).saveUser(user);
            // 重新开始游戏
            startNewGame();
        })
        .setNegativeButton("否", (dialog, which) -> Log.i("DialogBuilder","点击了否"))
        .create().show();
}
```

### SharedPreferences

`SharedPreferences` 是一种轻量级的存储解决方案，用于存储少量的数据，如用户偏好设置。它可以存储键值对数据，并提供简单的 API 来读写这些数据。

- `getSharedPreferences(String name, int mode)`：获取一个 `SharedPreferences` 对象，`name` 是存储的名称，`mode` 是访问模式。
- `getInt(String key, int defValue)`：根据提供的键读取整数值，如果键不存在，则返回默认值 `defValue`。
- `MODE_PRIVATE`：一个常量，表示 `SharedPreferences` 文件只能被应用本身访问。

```java
public User loadUser() {
    Log.d("preferenceTest", "read");
    SharedPreferences preferences_winRounds =
            getSharedPreferences("winRounds", MODE_PRIVATE);
    SharedPreferences preferences_totalRounds =
            getSharedPreferences("totalRounds", MODE_PRIVATE);
    SharedPreferences preferences_guesses =
            getSharedPreferences("guesses", MODE_PRIVATE);

    int winRounds = preferences_winRounds.getInt("winRounds", 0);
    int totalRounds = preferences_totalRounds.getInt("totalRounds", 0);
    int[] guesses = new int[6];
    for (int i = 0; i < TOTAL_CHANCES; i++)
        guesses[i] = preferences_guesses.getInt("guesses[" + i + "]", 0);

    Log.d("preferenceTest", "Read [winRounds = " + winRounds +
            ", totalRounds = " + totalRounds +
            ", guesses = " + Arrays.toString(guesses) + "]");
    return new User(winRounds, totalRounds, guesses);
}
```

## 常用工具

### JSON

JSONObject 和 JSONArray 是在处理 JSON 数据时使用的两种基本数据结构。它们是轻量级的，并且通常用于在 Web 服务和移动应用之间传输数据。在 Android 开发中，这两个类通常由 `org.json` 库提供，这个库不是 Android 标准库的一部分，因此需要单独添加到项目中。

#### JSONObject

JSONObject 是一个映射表，用来存储键值对，其中键是字符串，值可以是以下类型之一：

- `String`
- `Number`
- `JSONObject`
- `JSONArray`
- `Boolean`
- `null`

**基本用法**:

1. **创建 JSONObject**:

   ```java
   JSONObject jsonObject = new JSONObject();
   ```

2. **添加数据**:

   ```java
   jsonObject.put("key", "value");
   jsonObject.put("key2", 123);
   jsonObject.put("key3", anotherJsonObject);
   ```

3. **获取数据**:

   ```java
   String value = jsonObject.getString("key");
   int number = jsonObject.getInt("key2");
   JSONObject jobj = jsonObject.getJSONObject("key3");
   ```

4. **遍历 JSONObject**:

   ```java
   Iterator<String> keys = jsonObject.keys();
   while (keys.hasNext()) {
       String key = keys.next();
       Object value = jsonObject.get(key);
       // 处理 key 和 value
   }
   ```

#### JSONArray

JSONArray 是一个列表，用于存储有序的值集合。与 JSONObject 类似，JSONArray 中的值也可以是字符串、数字、布尔值、另一个 JSONObject 或 JSONArray。

**基本用法**:

1. **创建 JSONArray**:

   ```java
   JSONArray jsonArray = new JSONArray();
   ```

2. **添加数据**:

   ```java
   jsonArray.put("value1");
   jsonArray.put(123);
   jsonArray.put(anotherJsonObject);
   jsonArray.put(anotherJsonArray);
   ```

3. **获取数据**:

   ```java
   String value = jsonArray.getString(0);
   int number = jsonArray.getInt(1);
   JSONObject jobj = jsonArray.getJSONObject(2);
   JSONArray jarray = jsonArray.getJSONArray(3);
   ```

4. **访问长度**:

   ```java
   int length = jsonArray.length();
   ```

5. **遍历 JSONArray**:

   ```java
   for (int i = 0; i < jsonArray.length(); i++) {
       Object value = jsonArray.get(i);
       // 处理 value
   }
   ```

#### 示例代码

以下是一个简单的示例，演示了如何创建和使用 `JSONObject` 和 `JSONArray`：

```java
import org.json.JSONArray;
import org.json.JSONObject;

public class JsonExample {
    public static void main(String[] args) {
        // 创建 JSONObject
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("name", "John Doe");
        jsonObject.put("age", 30);
        
        // 创建 JSONArray
        JSONArray jsonArray = new JSONArray();
        jsonArray.put("Apple");
        jsonArray.put("Banana");
        jsonArray.put("Cherry");
        
        // 将 JSONArray 添加到 JSONObject
        jsonObject.put("fruits", jsonArray);
        
        // 输出整个 JSON 对象
        System.out.println(jsonObject.toString());
        
        // 获取并输出 name
        System.out.println(jsonObject.getString("name"));
        
        // 获取并遍历 fruits
        JSONArray fruits = jsonObject.getJSONArray("fruits");
        for (int i = 0; i < fruits.length(); i++) {
            System.out.println(fruits.get(i));
        }
    }
}
```

### Log

在 Android 开发中，Log 类是用于输出日志信息的非常有用的工具。它属于 `android.util` 包，提供了多种方法来打印不同级别的日志信息，帮助开发者调试应用。

日志信息通常包括一个标签（tag）和一个消息（message）。标签是一个简短的字符串，用于标识日志信息的来源，而消息则是要输出的具体内容。

```java
Log.d("preferenceTest", "This is a debug message.");
```

Log 类输出的日志可以在 Android Studio 的 Logcat 窗口中查看。Logcat 是一个实时日志查看工具，允许开发者根据日志级别、标签等条件过滤日志信息。

使用 Log 类是 Android 开发中调试和监控应用状态的重要手段。合理使用日志可以帮助你快速定位问题并优化应用性能。