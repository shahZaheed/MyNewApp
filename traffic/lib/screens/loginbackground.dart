import 'package:flutter/material.dart';
class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({Key? key, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      //color: Colors.white,
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/svgimages/s11.png',
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/svgimages/n3.png',
              width: size.width * 0.1,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/svgimages/n4.png',
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

