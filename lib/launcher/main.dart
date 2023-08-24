import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app/app.dart';
import '../app/app_config.dart';
import '../core/network/api/api_constants.dart';

void main() async {
  AppConfig devAppConfig =
  AppConfig(
      appName: "Lovoj",
      baseUrl: ApiConstant.baseUrlDebug
  );
  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}


