import 'package:flutter/material.dart';

Widget searchBar(TextEditingController controller) {
  return TextFormField(
    cursorColor: Color.fromRGBO(0, 112, 74, 1),
    controller: controller,
    style: TextStyle(fontSize: 14),
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.search,
        color: Colors.black45,
        size: 20,
      ),
      border: InputBorder.none,
      hintText: 'Search for fruits, vegetables, groceries',
      hintStyle: TextStyle(
        color: Colors.black26,
        fontSize: 14,
      ),
    ),
  );
}
