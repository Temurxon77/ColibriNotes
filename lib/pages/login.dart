import 'package:flutter/material.dart';
import 'package:todoapp/api/signUpApi.dart';
import 'package:todoapp/pages/constants.dart';

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
class SignUp extends StatefulWidget {
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  String stackOption;
  static int rarr = 0x2192;
  TextEditingController nameController = new TextEditingController();
  TextEditingController idController = new TextEditingController();
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
                    controller: nameController,
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
                    controller: idController,
                    decoration: InputDecoration(labelText: "ID:"),
                    validator: (String value){
                      if(value.isEmpty){
                        return "Required Field";
                      }
                    },
                    ),
                    padding: EdgeInsets.only(left: 15.0,right: 15.0)
                  ),
                  Align(child: 
                    Padding(child:DropdownButton<String>(
                      hint: Text("Stack"),
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      value: stackOption,
                      style: TextStyle(color: Colors.indigo[700]),
                      onChanged: (String newVal){
                        setState(() {
                          stackOption = newVal;
                        });
                      },
                      items: stackOptions.map((String value){
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                      }).toList(),
                    ),
                    padding: EdgeInsets.only(left: 15.0,top: 5.0),
                    ),
                    alignment: Alignment.topLeft
                  ),
                  FlatButton(
                    textColor: Colors.indigoAccent,
                    splashColor: Colors.indigo[600],
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                         signUpApi({
                          "name": nameController.text.toString(),
                          "id": nameController.text.toString(),
                          "stack": stackOption
                        }).then((val)=>{
                          print(val)
                        });
                      }
                     },
                    child: Text("Continue  ${String.fromCharCode(0x2192)}"),
                  ),
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
      return Center(child: Text("Error!"));
     
    }
  }
}