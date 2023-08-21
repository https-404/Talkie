import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talkie/res/theme/theme.dart';

class SnackbarService {
  BuildContext? _buildContext;


  static SnackbarService instance =  SnackbarService();
  SnackbarService() {

  }

  set buildContext(BuildContext _context) {
    _buildContext = _context;
  }

  void showSnackbarError (String _message) {
     ScaffoldMessenger.of(_buildContext!).showSnackBar(
         SnackBar(
           duration: Duration(seconds: 2),
             content: Text(_message,
             style:  TextStyle(
               fontSize: 15,
           color: Colors.white,
             ),
             ),
                 backgroundColor: AppTheme.theme.colorScheme.error
         )
     );
  }

  void showSnackbarSuccess (String _message) {
    ScaffoldMessenger.of(_buildContext!).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 2),
            content: Text(_message,
              style:  TextStyle(
                  fontSize: 15,
                  color: Colors.white,
              ),
            ),
            backgroundColor: AppTheme.theme.colorScheme.primary
        )
    );
  }
}