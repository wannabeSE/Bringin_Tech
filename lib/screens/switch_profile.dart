import 'package:flutter/material.dart';

class SwitchProfile extends StatelessWidget {
  const SwitchProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
             
              children:const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                  child: Icon(Icons.arrow_back_sharp),
                ),
                SizedBox(width: 80,),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                  child: Text('Switch Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                )
              ],
            ),
            const SizedBox(height: 50,),
            const Center(child: Image(image: AssetImage('assets/searching.png'))),
            const SizedBox(height: 30,),
            SizedBox(
              width: 260,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 220, 114),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: (){},
                child: const Text('Switch to Recruiters',style: TextStyle(fontSize: 20),)
               ),
            ),
            SizedBox(
              width: 260,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Color.fromARGB(255, 0, 220, 114)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: (){}, 
                child: const Text('Stay as Job Seeker',style: TextStyle(fontSize: 20))),
            )
          ],
        )
        ),
    );
  }
}