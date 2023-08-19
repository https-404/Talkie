import 'package:flutter/material.dart';

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

   //------------------------------------------------
   _LoginPageState() {
     _formkey= GlobalKey<FormState>();
   }
  @override
  Widget build(BuildContext context) {
    //using media query
    _deviceHeight= MediaQuery.of(context).size.height;
    _deviceWidth= MediaQuery.of(context).size.width;
    
    
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: _loginpageui(),
      ),
    );
  }

  Widget _loginpageui() {
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
          Text("Welcome Back",
        style: TextStyle(fontSize: 30, fontFamily: "Roboto", fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary  ),),
          //please log in to your account
        Text("Please Login to your Account",
            style: TextStyle(fontSize: 21, fontFamily: "Roboto", fontWeight: FontWeight.w200  , color: Theme.of(context).colorScheme.primary  ),)


        ],
      ),
    );
  }
  
  Widget _inputdata() {
    return Container(
      height: _deviceHeight * 0.16,
      child: Form(
        key: _formkey,
        onChanged: () {},
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
  Widget _emailtextfield(){
     return TextFormField(
       autocorrect: false ,
       style: TextStyle(color: Theme.of(context).colorScheme.primary),
       validator: (_input) {},
       onSaved: (_input) {},

       cursorColor: Theme.of(context).colorScheme.primary,
       decoration: InputDecoration(
         hintText: "Email ",
         disabledBorder: UnderlineInputBorder(
           borderSide: BorderSide(color: Colors.black)
         ),
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.lightBlueAccent)
         ),
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
      color: Colors.black12,
      width: 2.0,
    ),
       ),

     )
     );
  }

  // ------------- PASSWORD TEXTFIELD
   Widget _passwordfield(){
     return TextFormField(
         autocorrect: false ,
         obscureText: true,
         style: TextStyle(color: Theme.of(context).colorScheme.primary),
         validator: (_input) {},
         onSaved: (_input) {},

         cursorColor: Theme.of(context).colorScheme.primary,
         decoration: InputDecoration(
           hintText: "Password ",
           disabledBorder: UnderlineInputBorder(
               borderSide: BorderSide(color: Colors.black)
           ),
           focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(color: Colors.lightBlueAccent)
           ),
           enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(0),
             borderSide: BorderSide(
               color: Colors.black12,
               width: 2.0,
             ),
           ),

         )
     );
   }

   //------------ "LOGIN" Button

  Widget _loginbutton()
  {
    return Container(
      height: _deviceHeight * 0.06,
      width: _deviceWidth,

      child: MaterialButton(
        onPressed: () {} ,
        color: Theme.of(context).colorScheme.primary,
        child: Text("Login",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: 16
        ),),
      ),
    );
  }
 //------------ REGISTER TEXTBUTTON
 Widget _registerbutton() {
     return GestureDetector(
       onTap: () {print("Hey");},
       child: Container(
         height: _deviceHeight * 0.06,
         width: _deviceWidth,
         alignment: Alignment.center,
         child: Text(
           "Don't have an account? Register",
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