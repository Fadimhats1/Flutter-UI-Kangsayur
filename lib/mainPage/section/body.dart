import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur_ui/detailPage/detailPage.dart';
import 'package:kangsayur_ui/listPage/listPage.dart';
import 'package:kangsayur_ui/widgets/cardCategories.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyMainPage extends StatefulWidget {
  const BodyMainPage({Key? key}) : super(key: key);

  @override
  _BodyMainPageState createState() => _BodyMainPageState();
}

class _BodyMainPageState extends State<BodyMainPage> {
  List<String> titleSpecialDeal = ['Sambal', 'Tomato', 'Tomatoes'],
      titleCategories = [
        'Vegetables',
        'Fruits',
        'Meat & eggs',
        'Drinks',
        'Bakery'
      ],
      images = [
        'assets/images/diskon.png',
        'assets/images/diskon.png',
        'assets/images/diskon.png',
        'assets/images/diskon.png',
        'assets/images/diskon.png'
      ],
      imageSpecialDeal = [
        'assets/images/sambalImage.png',
        'assets/images/tomatoImage.png',
        'assets/images/tomatoImage.png',
      ];
  final controllerCarousel = CarouselController();
  int currIdx = 0, currIdxCategories = -1;
  set idxCategories(int index) => setState(
        () {
          currIdxCategories = index;
        },
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          carouselController: controllerCarousel,
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            final imageShow = images[index];
            return buildItemCarousel(imageShow);
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(
                () {
                  currIdx = index;
                },
              );
            },
          ),
        ),
        buildIndicator(),
        Container(
          margin: EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ListPage(
                              currIndexCategories: index,
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'data${index}',
                      child: CardCategories(
                        index: index,
                        titleCategories: titleCategories,
                        checkNeedBottomIdentify: false,
                        currIdxCategories: currIdxCategories,
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ),
        Container(
          color: Colors.black38,
          margin: EdgeInsets.only(bottom: 16),
          height: 1,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Deal',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'See more',
                      style: TextStyle(
                        color: Color.fromRGBO(76, 173, 115, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Color.fromRGBO(76, 173, 115, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 310,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 8),
            itemExtent: 200,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return cardSpecialDeal(context, index);
            },
            itemCount: imageSpecialDeal.length,
          ),
        )
      ],
    );
  }

  GestureDetector cardSpecialDeal(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                tagProduct: 'SpecialDeal$index',
                image: imageSpecialDeal[index],
                categories: 'Special',
                nameProduct: titleSpecialDeal[index],
                nameProductRelated: [
                  'Sambal Jengkol',
                  'Tomato Cheries',
                ],
              );
            },
          ),
        );
      },
      child: Hero(
        tag: 'SpecialDeal$index',
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 4,
          ),
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
                        imageSpecialDeal[index],
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
                              titleSpecialDeal[index],
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
      ),
    );
  }

  Widget buildItemCarousel(String imageShow) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Image.asset(
        imageShow,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedSmoothIndicator(
        activeIndex: currIdx,
        count: images.length,
        onDotClicked: animateSlide,
        effect: ExpandingDotsEffect(
          dotHeight: 12,
          dotWidth: 12,
          dotColor: Colors.black12,
          activeDotColor: Color.fromRGBO(76, 173, 115, 1),
          expansionFactor: 4,
        ),
      ),
    );
  }

  void animateSlide(int index) => controllerCarousel.animateToPage(index);
}
