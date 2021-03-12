-keep class com.umeng.** {*;}

# 您如果使用了稳定性模块可以加入该混淆
-keep class com.uc.** {*;}

-keepclassmembers class * {
    public <init> (org.json.JSONObject);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# SDK 9.2.4及以上版本自带oaid采集模块，不再需要开发者再手动引用oaid库，所以可以不添加这些混淆
-keep class com.zui.** {*;}
-keep class com.miui.** {*;}
-keep class com.heytap.** {*;}
-keep class a.** {*;}
-keep class com.vivo.** {*;}

# SDK需要引用导入工程的资源文件，通过了反射机制得到资源引用文件R.java
# 但是在开发者通过proguard等混淆/优化工具处理apk时，proguard可能会将R.java删除
# 如果遇到这个问题，请添加如下配置：
#-keep public class [您的应用包名].R$*{
#    public static final int *;
#}
