import 'dart:convert';

import 'package:bringin_texh/class/response.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:bringin_texh/class/user_data.dart';
import 'package:bringin_texh/widgets/button.dart';
import 'package:bringin_texh/widgets/inputfield.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});
  
  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

  final _formkey = GlobalKey<FormState>();

  String email ='';
  String password = '';
  Map resBody = {};
  bool chk = false;
class _CreateProfileState extends State<CreateProfile> {
  
  // static login (String email, String password)async{

  //   http.Response res = await http.post(Uri.parse('http://10.0.2.2:8080/api/signin'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body:jsonEncode(<String,String> {
  //         'email':email,
  //         'password':password,
  //       }
  //     )
  //   );
  //   resBody = jsonDecode(res.body);

  //   Responses.message = resBody['message'].toString();

  //   Responses.code = res.statusCode;

  //   if(res.statusCode == 201){

  //     debugPrint('login success');

  //   }else if (res.statusCode == 401){
     
  //     debugPrint(resBody['message']);
  //   }
  
  // }

  static setter ()async{

    // email = UserData.userInfo!['Email'];
    // password = UserData.userInfo!['Password'];
    
    // if(email.isNotEmpty && password.isNotEmpty){
    //   login(email,password);
    // }
    http.Response res = await http.post(Uri.parse('http://10.0.2.2:8080/api/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String,String> {
          'email':UserData.userInfo!['Email'],
          'password':UserData.userInfo!['Password'],
        }
      )
    );
    resBody = jsonDecode(res.body);

    Responses.message = resBody['message'].toString();

    Responses.code = res.statusCode;

    if(Responses.code == 201){
      
      debugPrint('login success');

    }else if (res.statusCode == 401){
     
      debugPrint(resBody['message']);
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
                  backgroundImage:const AssetImage('assets/pic.jpg'),
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
                const InputField(promptText: 'Please Enter Your first Name', labelText: 'Email'),
                const InputField(promptText: 'Please Enter Your last Name', labelText: 'Password'),
                const SizedBox(height: 10), 
                const MyButton(text: 'Submit', fn:setter,)
              ],
            ),
          )
          ),
      ),
    );
  }
}