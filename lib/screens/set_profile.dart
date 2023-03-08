
import 'package:bringin_texh/data/user_data.dart';
import 'package:bringin_texh/widgets/button.dart';
import 'package:bringin_texh/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});
  
  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

final _formkey = GlobalKey<FormState>();
String? email, password;
int? count;
class _CreateProfileState extends State<CreateProfile> {


  
  static setter({String? mail, String? pass})=>{
    // Func.email = mail,
    password = pass
  };
  static hello (){
    print(UserData.email);
  }
  // static setter(){
  //   email = Func.email;
  //   Func.keyCounter = 1;
  //   print(email);
  // }
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
                
                const InputField(promptText: 'Please Enter Your first Name',labelText: 'Email',func: setter,),
                const InputField(promptText: 'Please Enter Your last Name',labelText: 'Password',func: setter,),
                const SizedBox(height: 10,),
                const MyButton(text: 'Submit', fn:hello, msg: 'Button has been clicked',)
              ],
            ),
          )
          ),
      ),
    );
  }
}
