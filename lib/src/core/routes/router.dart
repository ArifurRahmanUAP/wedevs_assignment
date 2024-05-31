import 'package:flutter/material.dart';
import 'package:wedevs_assignment/src/core/routes/route_name.dart';
import '../../features/login_screens/ui/screens/login_screen.dart';
import '../../features/signup_screens/ui/screens/signup_screen.dart';
import '../splashscreen/splash_screen.dart';

class RouteGenerator {
  static pushNamed(BuildContext context, String pageName, {dynamic arguments}) {
    return Navigator.pushNamed(context, pageName, arguments: arguments);
  }

  static pushNamedAndRemoveAll(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushNamedAndRemoveUntil(
        context, pageName, (route) => false,
        arguments: arguments);
  }

  static pushReplacementNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushReplacementNamed(context, pageName,
        arguments: arguments);
  }

  static pop(BuildContext context) {
    return Navigator.of(context).pop();
  }

  static popAndPushNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.popAndPushNamed(context, pageName, arguments: arguments);
  }

  static popAll(BuildContext context) {
    return Navigator.of(context).popUntil((route) => false);
  }

  static popUntil(BuildContext context, String pageName) {
    return Navigator.of(context).popUntil(ModalRoute.withName(pageName));
  }

  // ================================== Routing =============================================

  static Route<dynamic>? onRouteGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const Splashscreen(),
        );

      // case Routes.mainScreenRouteName:
      //   return MaterialPageRoute(
      //     builder: (context) =>
      //         const MyHomePage(title: 'Flutter Demo Home Page'),
      //   );

      case Routes.loginScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case Routes.signUpScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
    }
    return null;
  }
}
