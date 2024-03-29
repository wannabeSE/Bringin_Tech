import 'package:flutter/material.dart';
import 'package:bringin_texh/class/user_data.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.promptText,
    required this.labelText,
    required this.prefixIcon,
    super.key
    });
    
  final String labelText;
  final String promptText;
  final Icon prefixIcon;
  @override
  State<InputField> createState() => _InputFieldState();
}
  
class _InputFieldState extends State<InputField> {
  
  
  bool ok = false;
  Icon ic = const Icon(Icons.check_box_outline_blank);
  
  @override
  Widget build(BuildContext context) {
   return Padding (
      padding:const EdgeInsets.all(10),
      child: Material(
        elevation: 8,
        child: TextFormField( 
          onChanged: (value) {
            if( value.isNotEmpty && UserData.userInfo.containsKey(widget.labelText) ){
              ok = true;
                setState(() {
                  ic = const Icon(Icons.check,color: Colors.greenAccent,);
              });
        
              UserData.userInfo[widget.labelText] = value;
        
            }
        
            else{
              ok = false;
                setState(() {
                  ic = const Icon(Icons.check_box_outline_blank);
                });
            }
          },
          validator: (value) {
            if(value!.isEmpty){
              return widget.promptText;
            }else {
              return null;
              }
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(23),
            border: OutlineInputBorder(
              gapPadding: 10,
              borderRadius: BorderRadius.circular(5),
              borderSide:const BorderSide(color: Colors.black87)
            ),
            
            prefixIcon: widget.prefixIcon,
            suffixIcon: ok ? ic : ic,
            labelText: widget.labelText ,
            floatingLabelStyle: const TextStyle(color: Colors.black)
          ),
        ),
      ),
     );
  }
}




