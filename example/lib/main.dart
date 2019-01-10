import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wlan/wlan.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _wifiEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  void checkWifi() async {
    _wifiEnabled = await Wlan.isWifiEnabled;
    print("Wifi Enabled: $_wifiEnabled");
    setState(() {
          
        });
  }

  @override
  Widget build(BuildContext context) {
    checkWifi();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Wifi Enabled: $_wifiEnabled\n'),
        ),
      ),
    );
  }
}
