import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talkie/res/route/route.dart';
import 'package:talkie/res/route/route_name.dart';
import 'package:talkie/res/theme/theme.dart';
import 'package:talkie/services/navigation_service.dart';
import 'package:talkie/view/login_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:talkie/view/registration_view.dart';
import 'firebase_options.dart';
import 'package:talkie/services/db_service.dart';
// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Talkie',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
     navigatorKey: NavigationService.instance.navigatorKey,
     // home: LoginPage(),<-- Default Home Page
      initialRoute: RouteName.login,
      //onGenerateRoute: AppRoute.generateRoute,
      routes: routes,

    );
  }
}

