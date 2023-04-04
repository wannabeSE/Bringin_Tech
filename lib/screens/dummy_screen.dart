import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: CustomPaint(
                painter:CurvePainter()
              ),
            ),
            const Center(
              child: Image(
                height: 300,
                image: AssetImage('assets/snk.jpg')
              )
            ),
            const Padding(
              padding:EdgeInsets.only(bottom:180.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('SNEAKERHEADS',style: TextStyle(fontFamily: 'Snic',fontSize: 50),),
              ),
            )
          ]
        )
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color.fromARGB(248, 241, 42, 28);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 70;
    
    var path = Path();

    path.moveTo(size.width, size.height);
    // path.moveTo(size.height, size.width);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
    // path.lineTo(size.width, size.height);
    // // canvas.drawLine(path, p2, paint);

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}