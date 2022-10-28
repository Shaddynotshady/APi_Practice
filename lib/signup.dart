// ignore_for_file: prefer_const_constructors
import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:http/http.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();


    void login( String email , password) async {

      try{

        Response response = await post(
            Uri.parse('https://reqres.in/api/register'),
            body: {
              'email' : email,
              'password' : password
            }
        );

        if(response.statusCode == 200){
          var data = jsonDecode(response.body.toString());
          print(data['token']);
          print('Login successfully');

        }else {
          print('failed');
        }
      }catch(e){
        print(e.toString());
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up with api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',

              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password',

              ),
            ),

            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text('SignUp'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
