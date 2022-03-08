import 'package:flutter/material.dart';
import 'package:kangsayur_ui/widgets/searchBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderListPage extends StatefulWidget {
  const HeaderListPage({Key? key}) : super(key: key);

  @override
  _HeaderListPageState createState() => _HeaderListPageState();
}

class _HeaderListPageState extends State<HeaderListPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  setState(
                    () {
                      Navigator.pop(context);
                    },
                  );
                },
                child: Transform.translate(
                  offset: Offset(5, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.only(left: 2, right: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromRGBO(242, 242, 242, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 3 / 5,
                  child: searchBar(controller),
                ),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/images/sort.svg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
