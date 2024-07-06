import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  void initialize(BuildContext context) {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      String message;
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        message = "Internet Connected";
      } else {
        message = "Internet Disconnected";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    });
  }
}
