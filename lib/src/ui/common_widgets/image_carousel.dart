import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inki/src/core/constants/api_urls.dart';
import 'package:inki/src/core/provider_view_models/all/product_view_model.dart';
import 'package:inki/src/ui/common_widgets/networ_catch_image.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';

import '../res/colors.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  final ProductViewModel model;

  CarouselWithIndicatorDemo({this.model});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState(model: model);
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  var index = 0;
  ProductViewModel model;

  _CarouselWithIndicatorState({this.model});

  List<String> imagesList = [];

  final List<String> imgList = [
    "assets/images/wash2.jpg",
    "assets/images/wash1.jpg",
    "assets/images/sub_pro3.png",
    "assets/images/machines_group.png",
  ];
  List<Widget> imageSliders = [];

  @override
  void initState() {
    // splashScreenViewModel =
    //     Provider.of<SplashScreenViewModel>(context, listen: false);
    // if (model.productDetails != null) {
    //   imagesList = model.productDetails != null &&
    //           model.productDetails.productMainImage.length > 0
    //       ? model.productDetails.productMainImage
    //       : imgList;
    // } else {
    //   imagesList = imgList;
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: productDetailBackground,
      body: Stack(
        children: [
          Center(
            child: Container(
              color: productDetailBackground,
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        items: model.productDetails.productMainImage
                            .map(
                              (item) => Container(
                                margin: EdgeInsets.all(0.0),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    child: networkImage(
                                      image: item,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              10,
                                      loaderImage: loaderBeforeImage(),
                                      boxFit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            height: 1000.0,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              showLog("Indexxx--${index}");
                              setState(() {
                                _current = index;
                                showLog("_current--${index}");
                              });
                            }),
                      ),
                    ),
                    verticalSizedBox(),
                    model.productDetails.productMainImage != null &&
                            model.productDetails.productMainImage.length > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: model.productDetails.productMainImage
                                .map((url) {
                              int index = model.productDetails.productMainImage
                                  .indexOf(url);
                              return Container(
                                width: 20.0,
                                height: 4.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 1.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _current == index
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              );
                            }).toList(),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imgList.map((url) {
                              int index = imgList.indexOf(url);
                              return Container(
                                width: 20.0,
                                height: 4.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 1.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _current == index
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              );
                            }).toList(),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        "%",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  verticalSizedBoxFive(),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                    ),
                  ),
                  verticalSizedBoxTwenty(),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
