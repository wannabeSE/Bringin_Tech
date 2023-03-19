import 'package:flutter/material.dart';


class DropDownDialog extends StatelessWidget {
  const DropDownDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        debugPrint('pressed');
        showDialog(
          context: context, 
          builder: (context) =>
            Dialog(
              child: Container(
              height: 180,
              width: 170,
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
                      const Text(
                        'I am',
                        style: TextStyle(
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
                          onPressed: (){},
                          child: const Padding(
                            padding: EdgeInsets.only(right:7.5),
                            child: Text('Save',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  )
                ]
              ),
            ),
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 8,
          child: Container(
            height: 58,
            width: 400,
            decoration: BoxDecoration( 
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(5),
              ),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/green_down.png'),
                  ),
                )
              ),
          ),
        ),
      ),
    );
  }
}