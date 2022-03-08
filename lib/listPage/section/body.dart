import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur_ui/detailPage/detailPage.dart';
import 'package:kangsayur_ui/widgets/cardCategories.dart';

class BodyListPage extends StatefulWidget {
  final int currIndexCategoriesInit;
  const BodyListPage({
    Key? key,
    required this.currIndexCategoriesInit,
  }) : super(key: key);

  @override
  State<BodyListPage> createState() =>
      _BodyListPageState(this.currIndexCategoriesInit);
}

class _BodyListPageState extends State<BodyListPage> {
  Random _random = Random();
  List<String> titleCategories = [
    'Vegetables',
    'Fruits',
    'Meat & eggs',
    'Drinks',
    'Bakery'
  ];

  var listData = [
    [
      CardListData('Jagung', 'assets/images/sambalImage.png'),
      CardListData('Tomat', 'assets/images/tomatoImage.png'),
      CardListData('Kol', 'assets/images/othersImage.png'),
      CardListData('Kangkung', 'assets/images/chiliImage.png'),
      CardListData('Timun', 'assets/images/carrotImage.png'),
      CardListData('Wortel', 'assets/images/sambalImage.png'),
      CardListData('Sawi Putih', 'assets/images/tomatoImage.png'),
      CardListData('Cabai Merah', 'assets/images/othersImage.png'),
      CardListData('Bawang Merah', 'assets/images/chiliImage.png'),
      CardListData('Bawang Putih', 'assets/images/carrotImage.png'),
    ],
    [
      CardListData('Apel', 'assets/images/sambalImage.png'),
      CardListData('Pear', 'assets/images/tomatoImage.png'),
      CardListData('Jeruk', 'assets/images/othersImage.png'),
      CardListData('Semangka', 'assets/images/chiliImage.png'),
      CardListData('Melon', 'assets/images/carrotImage.png'),
      CardListData('Pepaya', 'assets/images/sambalImage.png'),
      CardListData('Strawberry', 'assets/images/tomatoImage.png'),
      CardListData('Alpukat', 'assets/images/othersImage.png'),
      CardListData('Durian', 'assets/images/chiliImage.png'),
      CardListData('Kelapa', 'assets/images/carrotImage.png'),
    ],
    [
      CardListData('Daging Ayam', 'assets/images/sambalImage.png'),
      CardListData('Daging Sapi', 'assets/images/tomatoImage.png'),
      CardListData('Daging Babi', 'assets/images/othersImage.png'),
      CardListData('Daging Kambing', 'assets/images/chiliImage.png'),
      CardListData('Ikan Cue', 'assets/images/carrotImage.png'),
      CardListData("Telur Ayam", 'assets/images/sambalImage.png'),
      CardListData('Telur Puyuh', 'assets/images/tomatoImage.png'),
      CardListData('Telur Bebek', 'assets/images/othersImage.png'),
      CardListData('Ikan Tongkol', 'assets/images/chiliImage.png'),
      CardListData('Ikan Tuna', 'assets/images/carrotImage.png'),
    ],
    [
      CardListData('ALe - ale', 'assets/images/sambalImage.png'),
      CardListData('Teh Pucuk', 'assets/images/tomatoImage.png'),
      CardListData('Pocari Sweat', 'assets/images/othersImage.png'),
      CardListData('Aqua', 'assets/images/chiliImage.png'),
      CardListData('Ichi Ocha', 'assets/images/carrotImage.png'),
      CardListData('Granita', 'assets/images/sambalImage.png'),
      CardListData('Ultra Milk Vanila', 'assets/images/tomatoImage.png'),
      CardListData('Ultra Milk Strawberry', 'assets/images/othersImage.png'),
      CardListData('Ultra Milk Coklat', 'assets/images/chiliImage.png'),
      CardListData('My Tea Teh Oolong', 'assets/images/carrotImage.png'),
    ],
    [
      CardListData('Cupcake', 'assets/images/sambalImage.png'),
      CardListData('Cheese Cake', 'assets/images/tomatoImage.png'),
      CardListData('Strawberry Cake', 'assets/images/othersImage.png'),
      CardListData('Chocolate Cake', 'assets/images/chiliImage.png'),
      CardListData('Croissant', 'assets/images/carrotImage.png'),
      CardListData('Waffle', 'assets/images/sambalImage.png'),
      CardListData('Croffle', 'assets/images/tomatoImage.png'),
      CardListData('Creampuff', 'assets/images/othersImage.png'),
      CardListData('Bolu Susu Lembang', 'assets/images/chiliImage.png'),
      CardListData('Roti Tawar', 'assets/images/carrotImage.png'),
    ],
  ];
  List<String> relatedProduct = [];
  int currIdxCategories = 0;
  _BodyListPageState(this.currIdxCategories);
  @override
  @override
  Widget build(BuildContext context) {
    relatedProduct.clear();
    for (int i = 0; i < 3; i++) {
      relatedProduct.add(
        listData[currIdxCategories][_random.nextInt(11)].title,
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Hero(
                  tag: 'data${index}',
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            currIdxCategories = index;
                          },
                        );
                      },
                      child: CardCategories(
                        currIdxCategories: currIdxCategories,
                        index: index,
                        titleCategories: titleCategories,
                        checkNeedBottomIdentify: true,
                      ),
                    ),
                  ),
                );
              },
              itemCount: titleCategories.length,
            ),
          ),
          Container(
            color: Colors.black38,
            margin: EdgeInsets.only(bottom: 16),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return cardListPage(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector cardListPage(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                tagProduct:
                    titleCategories[currIdxCategories] + (index).toString(),
                image: listData[currIdxCategories][index].images,
                categories: titleCategories[currIdxCategories],
                nameProduct: listData[currIdxCategories][index].title,
                nameProductRelated: relatedProduct,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: titleCategories[currIdxCategories] + (index).toString(),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      listData[currIdxCategories][index].images,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listData[currIdxCategories][index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Rp ${(20 + index + 1)},000',
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 112, 74, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  ' / kg',
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              'Rp ${(20 + index + 1)},000',
                              style: TextStyle(
                                color: Colors.black26,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                decorationThickness: 2,
                                decorationColor: Colors.black26,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.9, 0.8),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/images/add.svg',
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardListData {
  late String title, images;
  CardListData(this.title, this.images);
}
