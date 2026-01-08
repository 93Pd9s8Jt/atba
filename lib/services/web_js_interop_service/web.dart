import 'dart:js_interop';
import 'package:web/web.dart';

void sendPostMessage() {
  // 1. Create the inner 'body' object
  final bodyMap = <String, Object?>{
    'ruleId': 'torbox-api-rule',
    'targetDomains': ['api.torbox.app'],
  };

  // 2. Create the main message structure (Dart Map)
  final messageMap = <String, Object?>{
    'name': 'prepareStream',
    'instanceId': 'test',
    'body': bodyMap,
  };

  final jsMessage = messageMap.jsify();

  window.postMessage(jsMessage, '*'.toJS);
  console.log("JS_interop is working!".toJS);
}
