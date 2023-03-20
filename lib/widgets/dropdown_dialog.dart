import 'package:flutter/material.dart';

import 'package:bringin_texh/class/user_data.dart';
import 'package:bringin_texh/widgets/dialog_buttons.dart';

class DropDownDialog extends StatefulWidget {
  const DropDownDialog({

    required this.initialValue,
    required this.optionOne,
    required this.optionTwo,
    required this.setMiddleText,
    required this.containerText,
    super.key
    });

  
  final String initialValue;
  final String optionOne;
  final String optionTwo;
  final String setMiddleText;
  final String containerText;

  @override
  State<DropDownDialog> createState() => _DropDownDialogState();
}

class _DropDownDialogState extends State<DropDownDialog> {

  String temp = 'Select';

  genderUpdate(){
    setState(() {
      temp = UserData.userInfo['Gender'];
    });
  }
  expUpdate(){
    setState(() {
      temp = UserData.userInfo['ExperienceLevel'];
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context, 
          builder: (context) =>
            Dialog(
              child: Container(
                height: 185,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          )
                        ),
                        Text(
                          widget.setMiddleText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(right:10),
                          child: MaterialButton(
                            minWidth: 70,
                            height: 21.5,
                            elevation: 0,
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            color: const Color.fromARGB(255, 33, 215, 127),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: (){
                              if(widget.initialValue == 'Select Level'){
                                expUpdate();
                              }else{
                                genderUpdate();
                              }
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right:7.5),
                              child: Text(
                                'Save',
                              style: TextStyle(
                                color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    DialogButton(labelText: widget.optionOne),
                    DialogButton(labelText: widget.optionTwo),
                  ],
                ),
              ),
            )
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 8,
          child: Stack(
            children:[
              Container(
              height: 65,
              width: 400,
              decoration: BoxDecoration( 
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:const EdgeInsets.fromLTRB(10,25,0,0),
                      child: Text(
                        temp,
                        style:const TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('assets/green_down.png'),
                        ),
                      )
                    ),
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.fromLTRB(10,10,0,0),
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: Text(
                    widget.containerText,  
                    style: const TextStyle(
                      fontSize: 15
                      ),
                    ),
                  ),
              )
            ]
          ),
        ),
      ),
    );
  }
}