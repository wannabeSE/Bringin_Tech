import 'package:flutter/material.dart';
import 'package:bringin_texh/data/user_data.dart';
class InputField extends StatefulWidget {
  const InputField({
    required this.promptText,
    required this.labelText,
    // required this.keyCnt,
    required this.func,
    super.key
    });
    
  final String labelText;
  final String promptText;
  // final int keyCnt;
  final Function func;
  @override
  State<InputField> createState() => _InputFieldState();
}
  
class _InputFieldState extends State<InputField> {

  TextEditingController val = TextEditingController();
  bool ok = false;
  // var a;
  @override
  Widget build(BuildContext context) {
   return Padding (
      padding:const EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        child: TextFormField( 
          onChanged: (value) {
            if(value.isNotEmpty){
              ok = true;
                setState(() {
                  const Icon(Icons.check,color: Colors.greenAccent,);
              });
              UserData.email = val.text;
             
            }
            else{
              ok = false;
                setState(() {
                  const Icon(Icons.check_box_outline_blank);
                });
            }
          },
          controller: val,
          validator:(value){
            if(value!.isEmpty){
              return widget.promptText;
            }else {
              return null;
              }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:const BorderSide(color: Colors.black87)
            ),
            // suffixIcon:ok ? const Padding(
            //   padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
            //   child: Icon(Icons.check,color: Colors.greenAccent,),
            // ):const Icon(Icons.check_box_outline_blank),
            suffixIcon: ok?const Icon(Icons.check,color: Colors.greenAccent)
            :const Icon(Icons.check_box_outline_blank,),
            labelText:widget.labelText ,
            floatingLabelStyle:const TextStyle(color: Colors.black)
          ),
        ),
      ),
     );
  }
}




