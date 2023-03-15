import 'package:flutter/material.dart';


class DialogMaterials extends StatelessWidget {
  const DialogMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        elevation: 5,
        shadowColor: Colors.black54,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      onPressed: (){
        Navigator.of(context).pop(context);
      }, 
      child:const Text('OK',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      );
  }
}