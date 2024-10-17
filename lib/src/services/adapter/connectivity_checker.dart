import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ConnectivityCheckerServices with WidgetsBindingObserver {
  final _connectionStreamController = StreamController<bool>.broadcast();
  final Dio dio;

  static final _instance = ConnectivityCheckerServices._();
  static ConnectivityCheckerServices get instance => _instance;

  ConnectivityCheckerServices._() : dio = Dio() {
    Timer? timer;

    onConnectivityChanged.listen((connected) {
      if (!connected && timer == null) {
        timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
          if (WidgetsBinding.instance.lifecycleState ==
              AppLifecycleState.paused) {
            return;
          }
        });
      } else {
        timer?.cancel();
        timer = null;
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await isConnected;
    }
    super.didChangeAppLifecycleState(state);
  }

  final vpnNames = [
    'tun',
    'tap',
    'ppp',
    'pptp',
    'l2tp',
    'ipsec',
    'vpn',
    'wireguard',
    'openvpn',
    'softether',
    'proton',
    'strongswan',
    'cisco',
    'forticlient',
    'fortinet',
    'hideme',
    'hidemy',
    'hideman',
    'hidester',
    'lightway',
    'cloudflare'
  ];

  Future<bool> isVPNActive() async {
    final interface = await NetworkInterface.list(
        includeLoopback: false, type: InternetAddressType.any);
    if (interface.isEmpty) {
      return false;
    }
    return interface.any((inter) =>
        vpnNames.any((name) => inter.name.toLowerCase().contains(name)));
  }

  Future<bool> doesConnectTo(String address) async {
    try {
      final result = await InternetAddress.lookup(address);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      try {
        final response = await dio.head('https://$address');
        return (response.statusCode ?? 500) <= 400;
      } on DioException catch (_) {
        return false;
      }
    }
  }

  Future<bool> _isConnected() async {
    return await doesConnectTo('google.com') ||
        await doesConnectTo('www.baidu.com') ||
        await isVPNActive();
  }

  bool isConnectedSync = false;

  Future<bool> get isConnected async {
    final connected = await _isConnected();
    isConnectedSync = connected;

    if (connected != isConnectedSync) {
      _connectionStreamController.add(connected);
    }
    return connected;
  }

  Stream<bool> get onConnectivityChanged => _connectionStreamController.stream;
}
