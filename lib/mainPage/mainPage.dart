import 'package:flutter/material.dart';
import 'package:kangsayur_ui/detailPage/detailPage.dart';
import 'package:kangsayur_ui/listPage/listPage.dart';
import 'package:kangsayur_ui/mainPage/section/header.dart';
import 'package:kangsayur_ui/mainPage/section/body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: ClipperBackground(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.4,
                    color: Color.fromRGBO(76, 173, 115, 1),
                  ),
                ),
                Column(
                  children: [
                    HeaderMainPage(),
                    BodyMainPage(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClipperBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 6 / 7);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 6 / 7,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
