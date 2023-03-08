import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  const MyButton({
    required this.text,
    required this.fn,
    required this.msg,
    super.key,
    });
  final String text,msg;  
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
      onPressed: (){
        fn();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text(msg) ));
      }, 
      child: Text(text,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      );
  }
}