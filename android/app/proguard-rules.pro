# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html
# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
# Uncomment this to preserve the line number information for
# debugging stack traces.
-keepattributes SourceFile,LineNumberTable
# If you keep the line number information, uncomment this to
# hide the original source file name.
-renamesourcefileattribute SourceFile
## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.embedding.**
-keepattributes *Annotation*
#Exoplayer
-keep class com.google.android.exoplayer.** {*;}
-keep class com.google.android.exoplayer2.** {*;}
-dontwarn io.flutter.embedding.**
-dontwarn android.support.v4.app.FragmentActivity
-dontwarn android.support.annotation.CallSuper
-dontwarn android.support.annotation.Nullable
#-dontwarn sun.misc.Unsafe
#-dontnote sun.misc.JavaLangAccess
#-keep class sun.misc.JavaLangAccess {
#  *** getStackTraceElement(...);
#  *** getStackTraceDepth(...);
#}
###### Test utils
#-dontwarn org.junit.**
#-dontwarn org.mockito.**
#-dontwarn sun.reflect.**
#-dontwarn android.test.**
###OKIO
##-keep class sun.misc.Unsafe { *; }
##-dontwarn java.nio.file.*
##-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
##-dontwarn okio.**
###### Okhttp3
## JSR 305 annotations are for embedding nullability information.
##-dontwarn javax.annotation.**
## A resource is loaded with a relative path so the package of this class must be preserved.
##-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
## OkHttp platform used only on JVM and when Conscrypt dependency is available.
#-dontwarn okhttp3.internal.platform.ConscryptPlatform
#-keep class okhttp3.** { *; }
#-keep interface okhttp3.** { *; }
#-dontwarn okhttp3.**
##Kotlin
#-keepclassmembers class **$WhenMappings {
#    <fields>;
#}
#-keep class kotlin.Metadata { *; }
#-keepclassmembers class kotlin.Metadata {
#    public <methods>;
#}
### Webview
#-keep public class android.net.http.SslError
#-keep public class android.webkit.WebViewClient
#-dontwarn android.webkit.WebView
#-dontwarn android.net.http.SslError
#-dontwarn android.webkit.WebViewClient.**
###Firebase https://github.com/firebase/quickstart-android/blob/master/analytics/app/proguard-rules.pro
#-keepattributes EnclosingMethod
#-keepattributes InnerClasses



#-keep public class com.transistorsoft.flutter.backgroundfetch { *; }
-keep class com.shockwave.**
-keepclassmembers class com.shockwave.** { *; }
-keep class com.dexterous.** { *; }
-keep class com.transistorsoft.flutter.** { *; }
-keep class com.mr.flutter.plugin.** { *; }
-keep class com.flutter_webview_plugin.** { *; }
-keep class io.github.ponnamkarthik.** { *; }
-keep class vn.hunghd.flutter.plugins.** { *; }
-keep class com.github.adee42.** { *; }
-keep class com.vitanov.** { *; }
-keep class top.kikt.** { *; }
-keep class flutter.plugins.screen.** { *; }
-keep class com.tekartik.** { *; }
-keep class xyz.justsoft.** { *; }
#
#
#-dontwarn io.flutter.plugin.platform.PlatformPlugin
#-dontwarn io.flutter.view.ResourceExtractor

