import 'package:bringin_texh/class/user_data.dart';
import 'package:bringin_texh/widgets/curverd_navigation_bar.dart';
import 'package:bringin_texh/widgets/dropdown_dialog.dart';
import 'package:bringin_texh/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class SetProfile extends StatelessWidget {
  const SetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                  const SizedBox(height: 30,),
                  const InputField(promptText: '', labelText: 'First Name', prefixIcon: Icon(Icons.person_2_outlined)),
                  const InputField(promptText: '', labelText: 'Last Name', prefixIcon: Icon(Icons.person_2_outlined)),
                  DropDownDialog(optionOne: 'Male',optionTwo: 'Female',setMiddleText: 'I am',containerText: 'Gender',initialValue: UserData.userInfo['Gender'],),
                  DropDownDialog(optionOne: 'Fresher', optionTwo: 'Experienced', setMiddleText: 'My Experience', containerText: 'Experience Level',initialValue: UserData.userInfo['ExperienceLevel']),
                  const InputField(promptText: '', labelText: 'Phone', prefixIcon: Icon(Icons.phone)),
                  const InputField(promptText: '', labelText: 'Email', prefixIcon: Icon(Icons.mail_outline)),
                  const SizedBox(height: 60,),
                  const CurvedNavBar()
            ],
          )
          
        ),
      ),
    );
  }
}