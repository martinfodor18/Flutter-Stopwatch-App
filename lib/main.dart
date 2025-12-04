import 'package:flutter/material.dart';

import 'config/app_initializer.dart';

Future<void> main() async {
  final app = await AppInitializer.initialize();
  runApp(app);
}
