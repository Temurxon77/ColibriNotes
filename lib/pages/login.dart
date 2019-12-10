import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
class SignUp extends StatefulWidget {
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  String stackOption = "Choose";
  @override
  Widget build(BuildContext context){
    try{
      Widget signUp;
      signUp = SafeArea(child: Scaffold(
        body: Center(child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Card(
            margin: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                children: <Widget>[
                  Align(
                    child: Padding(
                      child:Text("SignUp",
                      style: TextStyle(
                        fontSize: 22.0
                      )
                    ),
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    ),
                    alignment: Alignment.center
                  ),
                  Padding(child: TextFormField(
                    decoration: InputDecoration(labelText: "Name:"),
                    validator: (String value){
                      if(value.isEmpty){
                        return "Required Field";
                      }
                    },
                    ),
                    padding: EdgeInsets.only(left: 15.0,right: 15.0)
                  ),
                  Padding(child: TextFormField(
                    decoration: InputDecoration(labelText: "ID:"),
                    validator: (String value){
                      if(value.isEmpty){
                        return "Required Field";
                      }
                    },
                    ),
                    padding: EdgeInsets.only(left: 15.0,right: 15.0)
                  ),
                  Padding(child: 
                    DropdownButton<String>(
                      value: stackOption,
                      items: ,
                    ),
                    padding: EdgeInsets.only(left: 15.0,right: 15.0)
                  )
                ],
              )
            ),
            )
          ),
        )
        )
      );
      return signUp;
    }catch(e){
      print(e.toString());
    }
  }
}