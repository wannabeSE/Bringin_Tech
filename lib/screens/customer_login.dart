import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:bringin_texh/class/user_data.dart';
import 'package:bringin_texh/screens/dummy_screen.dart';
import 'package:bringin_texh/widgets/button.dart';
import 'package:bringin_texh/widgets/dialog_materials.dart';
import 'package:bringin_texh/widgets/inputfield.dart';
import 'package:bringin_texh/widgets/password_field.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});
  
  @override
  State<UserSignIn> createState() => _UserSignInState();
}

  final _formkey = GlobalKey<FormState>();

  String email ='';
  String password = '';
  Map resBody = {};
  bool chk = false;
  http.Response? resKeeper;

class  _UserSignInState extends State<UserSignIn> {
  
  static login() async {
    
    try {

      http.Response res = await http.post(Uri.parse('http://10.0.2.2:8080/api/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String,String> {
          'email': UserData.userInfo['Email'],
          'password': UserData.userInfo['Password'],
        }
      )
    );
   
    resKeeper = res;
    
    } catch (e) {
      debugPrint(e.toString());
    }
    
    resBody = jsonDecode(resKeeper!.body);

    if(resKeeper!.statusCode == 201){

      Get.to(const DummyScreen());
      debugPrint('login success');

    }else if (resKeeper!.statusCode == 401) {
      
      Get.defaultDialog(
              title: 'Login Error',
              middleText: resBody['data']['message'].toString(),
              titlePadding: const EdgeInsets.all(10),
              middleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              confirm: const DialogMaterials()
            );

        
    }
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding:const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Row(
                    children:const [
                    Icon(Icons.arrow_back),
                      SizedBox(width: 110,),
                      Text('My Profile',
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,  
                        ) ,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/new.jpg'),
                  maxRadius: 30,
                  child : Stack(      
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                          child: IconButton(
                          onPressed: (){
                
                          }, 
                          icon:const Icon(Icons.camera_alt_rounded,
                          color: Colors.green,)
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const InputField(promptText: 'Please Enter Your first Name', labelText: 'Email',prefixIcon: Icon(Icons.email),),
                const PasswordField(),
                const SizedBox(height: 10), 
                const MyButton(text: 'Login', fn:login,)
              ],
            ),
          )
          ),
      ),
    );
  }
}

  