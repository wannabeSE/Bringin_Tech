import 'package:bringin_texh/class/user_data.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.labelText,
    super.key
    });
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:10.0),
      child: SizedBox(
        height: 31,
        child: TextButton(
          onPressed: (){
            if(labelText == 'Male'){
              UserData.userInfo['Gender'] = 'Male';
              
            }else if(labelText == 'Fresher'){
              UserData.userInfo['ExperienceLevel'] = 'Fresher';
            }
            else if(labelText == 'Female'){
              UserData.userInfo['Gender'] = 'Female';
            }
            else{
              UserData.userInfo['ExperienceLevel'] = 'Experienced';
            }
          },
          child:Text(
            labelText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
              ,color: Colors.black
              ),
            ) 
          ),
      ),
    );
  }
}