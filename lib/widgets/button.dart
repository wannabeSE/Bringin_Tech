import 'package:flutter/material.dart';

import 'package:bringin_texh/class/response.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.text,
    required this.fn,
    super.key,
    });
  final String text;
  final Function fn;
  
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
        await fn();
        debugPrint('this is from the button widget ${Responses.code}');
        debugPrint('this is from the button widget ${Responses.message}');
        
        if( Responses.code == 401){
          Future.delayed(const Duration(milliseconds: 1500),(){
            showDialog(context: context, 
            builder: (ctx)=>AlertDialog(
              title: Text('${Responses.message}'),
              actions: [ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(ctx);
            }, child: const Text('Ok'))
            ],
            ));
          });
        }
        
      }, 
      child: Text(text,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      );
  }
}