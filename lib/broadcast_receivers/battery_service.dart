import 'dart:async';
import 'package:battery/battery.dart';
import 'package:flutter/material.dart';

class BatteryService {
  final Battery _battery = Battery();
  StreamSubscription<BatteryState>? _batterySubscription;

  void initialize(BuildContext context) {
    _batterySubscription = _battery.onBatteryStateChanged.listen((BatteryState state) async {
      if (state == BatteryState.charging) {
        int batteryLevel = await _battery.batteryLevel;
        if (batteryLevel >= 90) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Battery is 90% or more")));
        }
      }
    });
  }

  void dispose() {
    _batterySubscription?.cancel();
  }
}
