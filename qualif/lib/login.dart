import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController userCon = TextEditingController();

  void handleLogin(){
    String email = emailCon.text;
    String pass = passCon.text;
    String username = userCon.text;
    String error = '';
    String patternAlNUm = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    String patternNotNum = '^(?=.*?[0-9])';
    RegExp regExp = new RegExp(patternAlNUm);
    RegExp regExp2 = new RegExp(patternNotNum);

    if(email == '' || pass == '' || username == ''){
      error = "Please fill all the required fields!";
    }else if(!email.contains('@')){
      error = "Email must contains @ !";
    }else if(!email.endsWith('.com')){
      error = "Email must ends with .com !";
    }else if(regExp2.hasMatch(username)){
      error = "Username can only be alphabet";
    }else if(!regExp.hasMatch(pass)){
      error = "Password have to be alphanumeric and contains an uppercase !";
    }

    if(error != ''){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: const Text("Error"),
            content: Text(error),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("Ok")
              )
            ],
          );
        },
      );
      return;
    }
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context){
        return Homepage(username: userCon.text);
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      // appBar: AppBar(title: const Text("DailyKeeb")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                './assets/dk.jpg', 
                height: 300, 
                width: 300
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextField(
                controller: userCon,
                decoration: const InputDecoration(
                  labelText: "username"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextField(
                controller: emailCon,
                decoration: const InputDecoration(
                  labelText: "email"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextField(
                obscureText: true,
                controller: passCon,
                decoration: const InputDecoration(
                  labelText: "password"
                ),
              ),
            ),
            ElevatedButton(onPressed: handleLogin, child: const Text("log in"))
          ],),
        )
      ),
    );
  }
}