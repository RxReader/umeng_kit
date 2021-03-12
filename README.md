# umeng_kit

Flutter plugin for Umeng.

## Android

* 配置
```
...
android {
    ...
    defaultConfig {
        ...
        manifestPlaceholders = [
                UMENG_APPKEY : "your umeng appkey",
        ]
        ...
    }
    ...
}
...
```

* 混淆

> 引自友盟官方原文：
>
> SDK需要引用导入工程的资源文件，通过了反射机制得到资源引用文件R.java
> 但是在开发者通过proguard等混淆/优化工具处理apk时，proguard可能会将R.java删除
> 如果遇到这个问题，请添加如下配置：

```
-keep public class [您的应用包名].R$*{
    public static final int *;
}
```

## iOS

```
//  app.xcconfig
UMENG_APPKEY=your umeng appkey
```

```
//  Debug.xcconfig
#include "app.xcconfig"
```

```
//  Release.xcconfig
#include "app.xcconfig"
```

```xml
	<!-- Info.plist -->
	<key>UMENG_APPKEY</key>
	<string>$(UMENG_APPKEY)</string>
```

## Flutter

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

