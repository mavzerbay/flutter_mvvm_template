import 'dart:io';

import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace;
    _instace = VexanaManager._init();
    return _instace;
  }

  static const String _iosBaseUrl = 'https://reqres.in/api';//localhost:5001
  static const String _androidBaseUrl = 'https://reqres.in/api';//10.0.2.2:5001

  VexanaManager._init();

  INetworkManager networkManager =
      NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl));
}