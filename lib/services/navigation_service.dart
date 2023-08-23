import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState>? navigatorKey;
  static NavigationService instance = NavigationService();

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic>? navigateToReplacemnt (String _routeName) {
    return navigatorKey?.currentState?.pushReplacementNamed(_routeName);
  }
  Future<dynamic>? navigateTo (String _routeName) {
    return navigatorKey?.currentState?.pushNamed(_routeName);
  }
  Future<dynamic>? navigateToRoute (MaterialPageRoute _routeName) {
    return navigatorKey?.currentState?.push(_routeName);
  }
  void goBack() {
    return navigatorKey?.currentState?.pop();
  }
  // bool goBack() {
  //   final currentState = navigatorKey?.currentState;
  //   if (currentState != null && currentState.canPop()) {
  //     currentState.pop();
  //     return true;
  //   }
  //   return false;
  // }

}
