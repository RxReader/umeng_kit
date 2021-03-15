package io.github.v7lin.umeng_kit;

import android.content.Context;

import androidx.annotation.NonNull;

import com.umeng.analytics.MobclickAgent;
import com.umeng.commonsdk.UMConfigure;
import com.umeng.commonsdk.statistics.common.DeviceConfig;

import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * UmengKitPlugin
 */
public final class UmengKitPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context applicationContext;

    // --- FlutterPlugin

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "v7lin.github.io/umeng_kit");
        channel.setMethodCallHandler(this);
        applicationContext = binding.getApplicationContext();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        applicationContext = null;
    }

    // --- MethodCallHandler

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if ("init".equals(call.method)) {
            String appKey = call.argument("app_key");
            String channelId = call.argument("channel_id");
            UMConfigure.init(applicationContext, appKey, channelId, UMConfigure.DEVICE_TYPE_PHONE, null);
            MobclickAgent.setPageCollectionMode(MobclickAgent.PageMode.MANUAL);
            result.success(null);
        } else if ("setLogEnabled".equals(call.method)) {
            boolean enabled = call.argument("enabled");
            UMConfigure.setLogEnabled(enabled);
            result.success(null);
        } else if ("startPageTracking".equals(call.method)) {
            String pageName = call.argument("page_name");
            MobclickAgent.onPageStart(pageName);
            result.success(null);
        } else if ("stopPageTracking".equals(call.method)) {
            String pageName = call.argument("page_name");
            MobclickAgent.onPageEnd(pageName);
            result.success(null);
        } else if ("trackEvent".equals(call.method)) {
            String eventId = call.argument("event_id");
            Map<String, Object> eventParams = call.argument("event_params");
            MobclickAgent.onEventObject(applicationContext, eventId, eventParams);
            result.success(null);
        } else if ("getDeviceId".equals(call.method)) {
            String deviceId = DeviceConfig.getDeviceId(applicationContext);
            result.success(deviceId);
        } else if ("getMac".equals(call.method)) {
            String mac = DeviceConfig.getMac(applicationContext);
            result.success(mac);
        } else {
            result.notImplemented();
        }
    }
}
