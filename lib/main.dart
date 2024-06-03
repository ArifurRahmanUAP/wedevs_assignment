import 'package:flutter/material.dart';
import 'package:wedevs_assignment/src/core/di/app_component.dart';
import 'package:wedevs_assignment/src/core/features/splashscreen/splash_screen.dart';
import 'package:wedevs_assignment/src/core/routes/router.dart';
import 'package:wedevs_assignment/src/core/session/session_manager.dart';

final session = locator<SessionManager>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'wedevs_assignment',
      onGenerateRoute: RouteGenerator.onRouteGenerate,
      home: const Splashscreen(),
    );
  }
}

