import 'package:flutter/material.dart';
import 'package:kangsayur_ui/mainPage/mainPage.dart';

class ControlPages extends StatefulWidget {
  const ControlPages({Key? key}) : super(key: key);

  @override
  _ControlPagesState createState() => _ControlPagesState();
}

class _ControlPagesState extends State<ControlPages> {
  int currIndex = 0;
  List<Widget> screenPages = [
    MainPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenPages[0],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        selectedItemColor: Color.fromRGBO(76, 173, 115, 1),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 28),
        unselectedIconTheme: IconThemeData(size: 28),
        onTap: (index) {
          setState(() {
            currIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                (currIndex == 0) ? Icons.home : Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                (currIndex == 1) ? Icons.favorite : Icons.favorite_outline,
              ),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(
                (currIndex == 2)
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon:
                  Icon((currIndex == 3) ? Icons.person : Icons.person_outline),
              label: 'User'),
        ],
      ),
    );
  }
}
