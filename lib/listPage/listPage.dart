import 'package:flutter/material.dart';
import 'package:kangsayur_ui/listPage/section/body.dart';
import 'package:kangsayur_ui/listPage/section/header.dart';

class ListPage extends StatefulWidget {
  final int currIndexCategories;
  const ListPage({Key? key, required this.currIndexCategories})
      : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderListPage(),
              BodyListPage(
                currIndexCategoriesInit: widget.currIndexCategories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
