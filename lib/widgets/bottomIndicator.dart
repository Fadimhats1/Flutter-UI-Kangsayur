import 'package:flutter/cupertino.dart';

Widget bottomIdentify() {
  return Container(
    height: 6,
    width: 60,
    decoration: BoxDecoration(
      color: Color.fromRGBO(81, 188, 125, 1),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(
          4,
        ),
      ),
    ),
  );
}
