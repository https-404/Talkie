// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:talkie/view/login_view.dart';
// import 'package:talkie/view/registration_view.dart';
// import 'route_name.dart';
//
// class AppRoute {
//   static Route<dynamic>  generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteName.login:
//         return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
//
//       case RouteName.registration:
//         return MaterialPageRoute(builder: (BuildContext context) => RegistrationView());
//
//       default:
//         return MaterialPageRoute(builder: (BuildContext context) {
//           return Scaffold(
//             backgroundColor: Colors.redAccent,
//             body: Center(
//               child: Text(
//                 "Error Finding Activity",
//                 style: TextStyle(
//                   color: Colors.yellow,
//                 ),
//               ),
//             ),
//           );
//         });
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:talkie/view/homepage_view.dart';
import 'package:talkie/view/login_view.dart';
import 'package:talkie/view/registration_view.dart';
import 'route_name.dart';


 final Map<String, WidgetBuilder> routes = {
    RouteName.login: (BuildContext context) => LoginPage(),
    RouteName.registration: (BuildContext context) => RegistrationView(),
   RouteName.homepage: (BuildContext context) => Homepage(),
  };

