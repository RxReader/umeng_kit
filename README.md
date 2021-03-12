# umeng_kit

Flutter plugin for Umeng.

## Android

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

