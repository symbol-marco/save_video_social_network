import 'dart:io';

final kIsAndroid = Platform.isAndroid;
final kIsIOS = Platform.isIOS;
final kIsMacOS = Platform.isMacOS;
final kIsLinux = Platform.isLinux;
final kIsWindows = Platform.isWindows;

final kIsMobile = kIsAndroid || kIsIOS;
final kIsDesktop = kIsLinux || kIsMacOS || kIsWindows;
