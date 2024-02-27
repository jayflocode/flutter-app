// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mobiledev/query.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MySql(),
    ),
  );
}

// the main will be located above

class MySql extends StatefulWidget {
  const MySql({super.key});

// class implements changes or returns changes
  @override
  State<StatefulWidget> createState() {
    return _MySqlState();
  }
}

class User {
  String firstName;
  String lastName;
  int iD;

  User(this.iD, this.firstName, this.lastName);

  factory User.fromJson(dynamic json) {
    return User(json['iD'] as int, json['firstName'] as String, json['lastName'] as String);
  }
  @override
  String toString() {
    return '{ $iD, $firstName,$lastName }}';
  }
}

class _MySqlState extends State<MySql> {
  //properties of class will be stored here

  void _change(int check) {
    setState(() {
      if (check == 1) {
        message = "Incorrect Password";
      } else {
        message = "";
      }
    });
  }

  String user = "jayson";
  String password = "pass";
  var background = Colors.black; // changes background color to black
  String bar = "Employee Database"; // changes name of sql client
  double submitFont = 15; // changes size of submit font
  static String message = "";

  //text field controllers to store values
  final myController = TextEditingController(text: "jayson");
  final myController2 = TextEditingController(text: "pass");

  // properties of class will be stored here

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // area for app bar
          appBar: AppBar(
            title: Text(bar),
            backgroundColor: background,
          ),
          //
          body: Column(
            children: [
              // width and height constraints
              const SizedBox(
                height: 150, // changed code 2/27/24
                width: double.infinity, //adjusts size of full widget
                //value doesn't need change
              ),

              // sized box used to indicate user name insertion
              SizedBox(
                  child: TextField(
                controller: myController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    constraints: BoxConstraints.tightFor(width: 200),
                    border: UnderlineInputBorder(),
                    labelText: "Enter account",
                    alignLabelWithHint: true),
              )),
              // sized box used to indicated password insertion
              SizedBox(
                  child: TextField(
                controller: myController2,
                obscureText: true,
                decoration: const InputDecoration(
                    constraints: BoxConstraints.tightFor(width: 200),
                    border: UnderlineInputBorder(),
                    labelText: 'Password'),
                textAlign: TextAlign.center,
              )),
              const SizedBox(
                height: 10,
              ),
              //text buttom wrapped up inside a sized box used for "submit"
              SizedBox(
                  child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: background),
                      onPressed: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: submitFont,
                        ),
                      ))
                ],
              )),
              SizedBox(
                child: Column(
                  children: [TextButton(onPressed: null, child: Text(message))],
                ),
              )
            ],
          )),
    );
  }

  Route _createRoute() {
    String userCheck = myController.text; // controller user value stored as string
    String passCheck = myController2.text; // password value stored as string

    // Proceeds to the next stage

    if (userCheck == user && passCheck == password) {
      myController.clear();
      myController2.clear();
      _change(2);
      // compares user and password against controllers

      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Page2());
    } else {
      _change(1);
      // returns to s me screen if password doesn't matches

      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const MySql());
    }
  }
}
