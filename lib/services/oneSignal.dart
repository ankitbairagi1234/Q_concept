import 'dart:developer';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../common/apidata.dart';

String _debugLabelString = "";
bool _requireConsent = true;

// For One Signal notification
Future<void> initPlatformState() async {
  _handleConsent();

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    _debugLabelString =
        "Opened Notification : \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    log(_debugLabelString);
  });

  OneSignal.shared
      .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    _debugLabelString =
        "Subscription : \n${changes.jsonRepresentation().replaceAll("\\n", "\n")}";
    log(_debugLabelString);
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    _debugLabelString =
        "Permission : \n${changes.jsonRepresentation().replaceAll("\\n", "\n")}";
    log(_debugLabelString);
  });

  OneSignal.shared.setAppId(APIData.oneSignalAppID);
}

// For One Signal permission
void _handleConsent() {
  OneSignal.shared.consentGranted(true);
}
