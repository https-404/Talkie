import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkie/repository/auth_provider.dart';
import 'package:talkie/res/route/route.dart';
import 'package:talkie/services/snackbar_service.dart';
import 'package:talkie/services/navigation_service.dart';
import 'package:talkie/res/route/route_name.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //-----------------VARIABLES-------------------
  //find out devices height and width
  late double _deviceHeight;
  late double _deviceWidth;

  // varibale for _formdata class
  late GlobalKey<FormState> _formkey;

  //variable for authentications
  String? _email;
  String? _password;

  //AUTH PROVIDER
  AuthProvider? _auth;

  //------------------------------------------------
  _LoginPageState() {
    _formkey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    //using media query
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Align(
          alignment: Alignment.center,
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: _loginpageui(),
          )),
    );
  }

  Widget _loginpageui() {
    //print(_email);
    //print(_password);
    return Builder(builder: (BuildContext _context) {
      _auth = Provider.of<AuthProvider>(_context);
      // assigning default context to build contetx of snackbar_service.dart
      SnackbarService.instance.buildContext = _context;
      //  print(_auth?.user);
      return Container(
        //alignment settings
        //
        // color: Colors.red,
        height: _deviceHeight * 0.60,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headingPage(),
            _inputdata(),
            _loginbutton(),
            _registerbutton(),
          ],
        ),
      );
    });
  }

  // For Welcome Page and Login here Texts
  Widget _headingPage() {
    return Container(
      height: _deviceHeight * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Welcome back
          Text(
            "Welcome Back",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          //please log in to your account
          Text(
            "Please Login to your Account",
            style: TextStyle(
                fontSize: 21,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w200,
                color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }

  Widget _inputdata() {
    return Container(
      height: _deviceHeight * 0.20,
      child: Form(
        key: _formkey,
        onChanged: () {
          _formkey.currentState?.save();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailtextfield(),
            _passwordfield(),
          ],
        ),
      ),
    );
  }

  // -----------------  EMAIL TEXT FIELD
  Widget _emailtextfield() {
    return TextFormField(
        autocorrect: false,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        validator: (_input) {
          return _input!.isNotEmpty && _input!.contains("@")
              ? null
              : "Please enter valid email";
        },
        onSaved: (_input) {
          setState(() {
            _email = _input!;
          });
        },
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: "Email ",
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
        ));
  }

  // ------------- PASSWORD TEXTFIELD
  Widget _passwordfield() {
    return TextFormField(
        autocorrect: false,
        obscureText: true,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        validator: (_input) {
          return _input!.isNotEmpty ? null : "Please enter password";
        },
        onSaved: (_input) {
          setState(() {
            _password = _input!;
          });
        },
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: "Password ",
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 1.0,
            ),
          ),
        ));
  }

  //------------ "LOGIN" Button

  Widget _loginbutton() {
    return _auth?.status == AuthStatus.authenticating &&
            _auth?.status != AuthStatus.error
        ? Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : //else
        Container(
            height: _deviceHeight * 0.06,
            width: _deviceWidth,
            child: MaterialButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _auth?.loginUserwithEmailandPassword(_email!, _password!);
                }
              },
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
          );
  }

  //------------ REGISTER TEXTBUTTON
  Widget _registerbutton() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateTo(RouteName.registration) ;
      },
      child: Container(
        height: _deviceHeight * 0.06,
        width: _deviceWidth,
        alignment: Alignment.center,
        child: Text(
          "Register here!",
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            decorationColor: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}
