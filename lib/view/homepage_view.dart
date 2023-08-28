import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomepageView();
  }
}

class _HomepageView extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(

          elevation: 10,

          backgroundColor: Theme.of(context).colorScheme.primary,
          title:
          Center(
              child: Text(
            "Talkie",
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          )),
        ),
      ),
    );
  }
}
