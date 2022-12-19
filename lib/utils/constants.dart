import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Constants {
  static const _webClientId =
      '417768617478-k6bgll19l7ov28dg3889vafqhnrdfd28.apps.googleusercontent.com';

  static const signConfigure = [
    EmailProviderConfiguration(),
    GoogleProviderConfiguration(clientId: _webClientId),
  ];

  static const gap16 = SizedBox(height: 16, width: 16);
}
