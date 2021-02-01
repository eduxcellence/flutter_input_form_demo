import 'package:flutter/material.dart';
/*
@Akash- Eduxcellence2021
This is Form Widget Demo for validate input fields as once using Global Key State
* */
void main() {
  runApp(FormInputDemo());
}

class FormInputDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _FormInputDemo();
}

class _FormInputDemo extends State<FormInputDemo>{
var emailId,password;
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(key:_scaffoldKey,appBar: AppBar(title: Text("Form Input Demo"),),
      body:Form(key: _formKey,
        child: Column(children: [
TextFormField(decoration: InputDecoration(labelText: "Email Id"),
  validator: (inputValue)=>(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(inputValue)?' Invalid Email Id':null),
  onSaved: (inputValue)=>emailId=inputValue,
),TextFormField(decoration: InputDecoration(labelText: "Password"),
  validator: (inputValue)=>(inputValue.toString().trim().length<6?'password length must be greater than 5':null),
  onSaved: (inputValue)=>password=inputValue,
),RaisedButton(onPressed: onPressed,child: Text("Submit"),)
        ],),
      )
    ) ,);
  }

  void onPressed() {
  var form= _formKey.currentState;
  if(form.validate())
    {
      form.save();
      var snackbar=SnackBar(content: Text("Your Email Id  :  $emailId and Password $password is Submitted"),duration: Duration(seconds: 2),);
      _scaffoldKey.currentState.showSnackBar(snackbar);

    }
  }
}


