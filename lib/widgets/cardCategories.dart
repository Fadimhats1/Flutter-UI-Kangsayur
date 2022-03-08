import 'package:flutter/material.dart';
import 'package:kangsayur_ui/widgets/bottomIndicator.dart';

class CardCategories extends StatefulWidget {
  final int index;
  final List<String> titleCategories;
  final bool checkNeedBottomIdentify;
  final int currIdxCategories;
  const CardCategories({
    Key? key,
    required this.index,
    required this.titleCategories,
    required this.checkNeedBottomIdentify,
    required this.currIdxCategories,
  }) : super(key: key);

  @override
  State<CardCategories> createState() => _CardCategoriesState();
}

class _CardCategoriesState extends State<CardCategories> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
                child: Image.asset(
                  'assets/images/sayur' +
                      (widget.index + 1).toString() +
                      '.png',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: SizedBox(
                  width: 80,
                  child: Text(
                    widget.titleCategories[widget.index],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'inter',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: (widget.currIdxCategories == widget.index)
                ? bottomIdentify()
                : null,
          ),
        ],
      ),
    );
  }
}
