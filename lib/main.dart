import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_injections/app_injections.dart' as di;
import 'core/widgets/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}
