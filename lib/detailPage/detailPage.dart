import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur_ui/widgets/bottomIndicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailPage extends StatefulWidget {
  final String image, tagProduct, categories, nameProduct;
  final List<String> nameProductRelated;
  const DetailPage({
    Key? key,
    required this.tagProduct,
    required this.image,
    required this.categories,
    required this.nameProduct,
    required this.nameProductRelated,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int carouselIndex = 0, tabBarIndex = 0, totalItems = 1;
  final controllerCarousel = CarouselController();
  List<String> DescandNutri = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "Nutritions:\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: widget.tagProduct,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: CarouselSlider.builder(
                            carouselController: controllerCarousel,
                            itemCount: 3,
                            itemBuilder: (context, index, realIndex) {
                              return FractionallySizedBox(
                                widthFactor: 1,
                                child: FittedBox(
                                  child: Image.asset(widget.image),
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            options: CarouselOptions(
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(
                                  () {
                                    carouselIndex = index;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 24,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 3.5,
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              top: 36,
                              bottom:
                                  MediaQuery.of(context).size.height / 10 + 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(76, 173, 115, 0.3),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        widget.categories,
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 112, 74, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        widget.nameProduct,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rp 18,000',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromRGBO(
                                              0,
                                              112,
                                              74,
                                              1,
                                            ),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ' / kg',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          'Rp 21,000',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black26,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 24,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        tabDetailPage('Description', 0),
                                        tabDetailPage('Nutrition facts', 1),
                                      ],
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  DescandNutri[tabBarIndex],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 24),
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Related Product',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      margin: EdgeInsets.only(top: 16),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return cardRelatedDetailPage(index);
                                        },
                                        itemCount:
                                            widget.nameProductRelated.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Material(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Transform.translate(
                                    offset: Offset(5, 0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Material(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {},
                                  child: Transform.translate(
                                    offset: Offset(1, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SizedBox(
                                        child: SvgPicture.asset(
                                          'assets/images/love.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      indicatorImage(),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Container(
                height: MediaQuery.of(context).size.height / 9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(children: [
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonPlusMin(false),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(76, 173, 115, 0.3),
                            ),
                            child: Center(
                              child: Text(
                                totalItems.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(76, 173, 115, 1)),
                              ),
                            ),
                          ),
                          buttonPlusMin(true)
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          primary: Color.fromRGBO(76, 173, 115, 1),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonPlusMin(bool flag) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            if (flag == true && totalItems < 99)
              totalItems += 1;
            else if (flag != true && totalItems > 1) totalItems -= 1;
          });
        },
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(
                  14,
                  177,
                  119,
                  1,
                ),
              ),
              borderRadius: BorderRadius.circular(5)),
          child: SizedBox(
            width: 16,
            height: 16,
            child: SvgPicture.asset(
                'assets/images/${(flag == true) ? 'plus' : 'min'}.svg'),
          ),
        ),
      ),
    );
  }

  Widget cardRelatedDetailPage(int index) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 250,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                  ),
                ),
                child: FittedBox(
                  child: Image.asset(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.nameProductRelated[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rp 12,000',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(
                              0,
                              112,
                              74,
                              1,
                            ),
                          ),
                        ),
                        Text(
                          ' / kg',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabDetailPage(String str, int idx) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            5,
          ),
        ),
        onTap: () {
          setState(() {
            tabBarIndex = idx;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: Text(
                      str,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: (tabBarIndex == idx) ? bottomIdentify() : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget indicatorImage() {
    return Container(
      margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5 - 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSmoothIndicator(
            activeIndex: carouselIndex,
            count: 3,
            onDotClicked: animateSlide,
            effect: WormEffect(
              dotWidth: 12,
              dotHeight: 12,
              dotColor: Colors.grey.withOpacity(0.5),
              activeDotColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void animateSlide(int index) => controllerCarousel.animateToPage(index);
}
