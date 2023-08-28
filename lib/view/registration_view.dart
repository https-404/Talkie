
import 'dart:io';

import 'package:talkie/services/db_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:talkie/services/cloudStorage_service.dart';
//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talkie/repository/auth_provider.dart';
import 'package:talkie/services/navigation_service.dart';
import 'package:talkie/services/media_service.dart';
import 'package:provider/provider.dart';
import 'package:talkie/services/snackbar_service.dart';

class RegistrationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationViewState();
  }
}

class _RegistrationViewState extends State<RegistrationView> {
  double? _deviceHeight;
  double? _deviceWidth;

  String? _name;
  String? _email;
  String? _password;

  File? _image;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  AuthProvider? _auth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(leading: _backButtonAppbar(),
      title: Center(
        child: Container(
          height: _deviceHeight! * 0.1,
            width: _deviceWidth! * 0.2,
            child: Image.asset("assets/images/logo.png")
        ),
      ),
    ),
      body: 
      SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: signupPageUI(),
          ),
        ),
      ),
    );
  }

  Widget signupPageUI() {
    return Builder(builder: (BuildContext _context) {
      _auth = Provider.of<AuthProvider>(_context);
      return Container(
        height: _deviceHeight! * 0.8,
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headingPage(),
            _inputForm(),
          ],
        ),
      );
    });
  }

  Widget _backButtonAppbar() {
    return Container(
      child: IconButton(
        onPressed: () {
          NavigationService.instance.goBack();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        ),
      ),
    );
  }

  Widget _headingPage() {
    return Container(
      height: _deviceHeight! * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            "Please enter your details",
            style: TextStyle(
              fontSize: 21,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w200,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputForm() {
    return Container(
      height: _deviceHeight! * 0.5,
      child: Form(
        key: _formkey,
        onChanged: () {
          _formkey.currentState?.save();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _imageSelectorWidget(),
            _nameTextField(),
            _emailTextField(),
            _passwordTextField(),
            _registerButton(),
          ],
        ),
      ),
    );
  }

  Widget _imageSelectorWidget() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () async {
          XFile? _imageFile = await MediaService.instance.getImageFromLibrary();

          setState(() {
            _image = File(_imageFile!.path);
          });
        },
        child: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          height: _deviceHeight! * 0.12,
          width: _deviceWidth! * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: _image != null
                  ? FileImage(_image!) as ImageProvider
                  : const NetworkImage(
                      "https://cdn0.iconfinder.com/data/icons/occupation-002/64/programmer-programming-occupation-avatar-512.png",
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      autocorrect: false,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      validator: (_input) {
        return _input!.isNotEmpty ? null : "Please enter valid name";
      },
      onSaved: (_input) {
        setState(() {
          _name = _input;
        });
      },
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        hintText: "Name",
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
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
          _email = _input;
        });
      },
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        hintText: "Email",
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      validator: (_input) {
        return _input!.isNotEmpty ? null : "Please enter valid password";
      },
      onSaved: (_input) {
        setState(() {
          _password = _input;
        });
      },
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        hintText: "Password",
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return _auth?.status != AuthStatus.authenticating
        ? Container(
            height: _deviceHeight! * 0.06,
            width: _deviceWidth,
            child: MaterialButton(
              onPressed: () async {
                if (_formkey.currentState != null && _image != null) {
                  if (_formkey.currentState!.validate()) {
                    _auth?.registerUserwithEmailandPassword(
                      _email!,
                      _password!,
                      (String? uid) async {
                        print("reached here");

                        var _result =
                            await CloudStorageService.instance.uploadUserImage(
                          uid!,
                          _image!,
                        );
                        TaskSnapshot taskSnapshot =
                            await _result!.whenComplete(() {});
                        var _imageURL = await taskSnapshot.ref.getDownloadURL();

                        await DBService.instance.createUserinFirestore(
                          uid,
                          _name!,
                          _email!,
                          _imageURL as String,
                        );

                        SnackbarService.instance
                            .showSnackbarSuccess("Created Account");
                      },
                    );
                  }
                }
              },
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
  }
}
