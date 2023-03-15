import 'package:flutter/material.dart';


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
    return SizedBox(
      height: 50,
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.amberAccent,
          elevation: 8,
          shadowColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
            )
         
        ),
        onPressed: ()async{
          
          await fn();
          
        }, 
        child: Text(text,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        ),
    );
  }
}
