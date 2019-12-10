import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() =>  HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    try{
      Widget home = DefaultTabController(
        length: 2,
          child: Scaffold(
          // appBar: AppBar(
          //   bottom: TabBar(tabs: <Widget>[
          //     Tab(icon: Icon(Icons.),)
          //   ]),
          // ),
        ),
      );
    }catch(e){
      print(e.toString());
      return Center();
    }
  }
}