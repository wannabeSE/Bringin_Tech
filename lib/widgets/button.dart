import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bringin_texh/class/response.dart';

import 'package:bringin_texh/screens/dummy_screen.dart';

class MyButton extends StatelessWidget {
    const MyButton({
    required this.text,
    required this.fn,
    super.key,
    });
  final String text;
  final Function fn;
  
  void login(){}
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.amberAccent,
        elevation: 8,
        shadowColor: Colors.pink
      ),
      onPressed: ()async{
        // var res = await utility.login();
        await fn();
        debugPrint('this is from the button widget ${Responses.code}');
        debugPrint('this is from the button widget ${Responses.message}');
        
        if( Responses.code == 401 ){
          Get.defaultDialog(
            title: 'Login Error',
            middleText: '${Responses.message}',
            actions: [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(context);
                }, 
                child: const Text('Ok')
                )
                ]
                );
          
        }else if(Responses.code == 201){
          Get.to(const DummyScreen()); //page routing using GetX 
        }
        
      }, 
      child: Text(text,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      );
  }
}