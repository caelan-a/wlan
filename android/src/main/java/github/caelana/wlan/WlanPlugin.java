package github.caelana.wlan;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import 	android.net.wifi.WifiManager;
import android.content.Context;

/** WlanPlugin */
public class WlanPlugin implements MethodCallHandler {
  final static String CHANNEL_NAME = "github.caelana/wlan";
  final Context mContext;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL_NAME);
    channel.setMethodCallHandler(new WlanPlugin(registrar.context()));
  }

  WlanPlugin(Context context) {
    mContext = context;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("isWifiEnabled")) {
      WifiManager wifi = (WifiManager) mContext.getSystemService(Context.WIFI_SERVICE);
      if (wifi.isWifiEnabled()) {
        result.success("true");
      } else {
        result.success("false");
      }
    } else {
      result.notImplemented();
    }
  }
}
