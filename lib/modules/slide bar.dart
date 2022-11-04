import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.2,0.01),
      children: [
        CustomPaint(
          painter: RPSCustomPainter(),
          size: const Size(120.0,120.0),
        ),
        CircleAvatar(
          radius:32,
          backgroundColor:const Color (0xffddcdfe),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/images/design.png'),
          ),
        ),
      ],
    );
  }
}
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Color (0xffddcdfe)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width,0);
    path0.lineTo(size.width,size.height);
    path0.quadraticBezierTo(size.width*0.9020000,size.height*0.8379000,size.width*0.7592000,size.height*0.8306000);
    path0.cubicTo(size.width*0.6434000,size.height*0.8407000,size.width*0.5204000,size.height*0.8627000,size.width*0.3506000,size.height*0.8214000);
    path0.cubicTo(size.width*0.2659000,size.height*0.8240000,size.width*0.0472000,size.height*0.5977000,size.width*0.1420000,size.height*0.2598000);
    path0.quadraticBezierTo(size.width*0.1540000,size.height*0.1077000,0,0);
    path0.lineTo(size.width,0);

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
