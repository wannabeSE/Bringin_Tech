import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          
          children: [
            const SizedBox(height: 180,),
            Center(
            child:Image.asset('assets/logo.png'),
           ),
            
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child:  Text('Bringin',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ) ,
              ),
            ),
            const Text('Instant Chat, Hire Direct',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ) ,
            ),
            const Spacer(flex: 5,),
            const Text('Bringin Technologies Ltd.',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ) ,
            ),
            const Spacer()
          ],
        )
      ),
    );
  }
}