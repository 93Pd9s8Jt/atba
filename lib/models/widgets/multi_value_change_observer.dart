import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart'
    show ValueChangeObserver;

class MultiValueChangeObserver extends StatelessWidget {
  final Map<String, dynamic> cacheKeysWithDefaultValues;
  final Widget Function(BuildContext, Map<String, dynamic> values) builder;
  const MultiValueChangeObserver({
    super.key,
    required this.cacheKeysWithDefaultValues,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> cacheKeysWithListenedValues = {};
    return _create(cacheKeysWithDefaultValues, cacheKeysWithListenedValues, context, 0);
  }

  Widget _create(
      Map<String, dynamic> cacheKeysWithDefaultValues,
      Map<String, dynamic> cacheKeysWithListenedValues,
      BuildContext context,
      int index) {
    final keys = cacheKeysWithDefaultValues.keys.toList();
    if (index >= keys.length) {
      return builder(context, cacheKeysWithListenedValues);
    }
    final key = keys[index];
    final defaultValue = cacheKeysWithDefaultValues[key];
    return ValueChangeObserver(
      cacheKey: key,
      defaultValue: defaultValue,
      builder: (BuildContext context, dynamic value, _) {
        cacheKeysWithListenedValues[key] = value;
        return _create(cacheKeysWithDefaultValues, cacheKeysWithListenedValues, context, index + 1);
      },
    );
  }
}
