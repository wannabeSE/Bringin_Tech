import 'package:bringin_texh/class/user_data.dart';
import 'package:flutter/material.dart';


class PasswordField extends StatefulWidget {

  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 5,
        child: TextFormField(
          onChanged: (value) => UserData.userInfo['Password'] = value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:const BorderSide(color: Colors.black87)
            ),
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.black87,fontSize: 18),
            prefixIcon: const Icon(Icons.password),
            suffixIcon: IconButton(
              icon: visible ? const Icon(Icons.visibility_off) :const Icon(Icons.visibility), 
              onPressed: () { 
                setState(() {
                  visible = !visible;
                });
               },
              )
          ),
          obscureText: visible,
        ),
      ),
    );
  }
}