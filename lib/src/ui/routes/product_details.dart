import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/SpalshScreenViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/core/provider_view_models/all/product_view_model.dart';
import 'package:inki/src/core/provider_view_models/base/base_change_notifier_model.dart';
import 'package:inki/src/core/provider_view_models/base/base_widget.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/image_carousel.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:inki/src/ui/res/colors.dart';
import 'package:inki/src/utils/expandable_text.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../res/colors.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, String> groupId;

  ProductDetail({this.groupId});

  @override
  _ProductDetailState createState() => _ProductDetailState(groupId: groupId);
}

class _ProductDetailState extends State<ProductDetail> {
  final Map<String, String> groupId;
  bool showFilter = false;
  int selectedIndex = 0;
  Color animColor = Color(0xff3c3f42);

  _ProductDetailState({this.groupId});

  SplashScreenViewModel splashScreenViewModel;
  int heightValue = 428;
  int topScroll = 400;
  int left = 5;
  int right = 5;

  List<String> images = [
    "assets/images/fea2.png",
    "assets/images/fea3.png",
    "assets/images/fea4.png",
    "assets/images/fea5.png",
    "assets/images/fea1.png"
  ];

  List<String> features = [
    "AQUA ENERGIC",
    "3D WASH SYSTEM",
    "LAUNDRY ADD",
    "CRESENT MOON DRUM",
    "SUPER WARRNATY WITH \n WIDE SERVICE NETWORK"
  ];

  List<String> specificationsValue = [
    "GENERAL",
    "PERFOMANCE",
    "WASH PROGRAMS",
    "SPECIAL",
    "SAFETY",
  ];

  @override
  void initState() {
    super.initState();
    splashScreenViewModel =
        Provider.of<SplashScreenViewModel>(context, listen: false);
    Provider.of<IOTViewModel>(context, listen: false)
        .listenPorts(context); // listen for signals from iot
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProductViewModel>(
      // base widget will used for only product details screen
      onModelReady: (model) async {
        await model.getProductDetailsDependsOnIndex(groupId);
      },
      model: ProductViewModel(context),
      builder: (BuildContext context, ProductViewModel model, Widget child) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              child: customAppBar(
                  context: context,
                  elevation: 1.5,
                  backgroundColor: productDetailBackground,
                  onBackClicked: () {
                    Navigator.pop(context);
                  },
                  menuOnClicked: () {
                    navigateToHome(context: context);
                  }),
            ),
            backgroundColor: productDetailBackground,
            body: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return Stack(
                  children: <Widget>[
                    Column(
                      children: [
                        /*CustomScrollView(
                          slivers: <Widget>[
                            SliverAppBar(
                              expandedHeight: 100.0,
                              flexibleSpace: FlexibleSpaceBar(),
                            ),
                          ],
                        ), */
                        Positioned(
                          top: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            color: productDetailBackground,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 42.0),
                              child: Center(
                                child: CarouselWithIndicatorDemo(
                                  model: model,
                                ),
                              ),
                            ),
                          ),
                        ),
                        model.state == BaseViewState.Busy
                            ? Center(child: CircularProgressIndicator())
                            : Expanded(
                                child: NotificationListener<ScrollNotification>(
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    children: <Widget>[
                                      Container(
                                        color: scaffoldBackgroundColor,
                                        child: ListView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0,
                                                      vertical: 30),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Row(
                                                            children: [
                                                              Text("342",
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    textStyle: TextStyle(
                                                                        color: const Color(
                                                                            0xff3c3f42),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            16.5),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right),
                                                              horizontalSizedBoxFive(),
                                                              Icon(
                                                                Icons.person,
                                                                color:
                                                                    lightBlack,
                                                              )
                                                            ],
                                                          ),
                                                          verticalSizedBox(),
                                                          RatingBar(
                                                            initialRating: 4,
                                                            itemSize: 20.0,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemCount: 5,
                                                            ratingWidget:
                                                                RatingWidget(
                                                              full: Icon(
                                                                Icons.star,
                                                                color:
                                                                    lightBlack,
                                                                size: 5,
                                                              ),
                                                              half: Icon(
                                                                Icons.star,
                                                                color:
                                                                    lightBlack,
                                                                size: 5,
                                                              ),
                                                              empty: Icon(
                                                                Icons
                                                                    .star_border_outlined,
                                                                color:
                                                                    Colors.grey,
                                                                size: 5,
                                                              ),
                                                            ),
                                                            itemPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            1),
                                                            onRatingUpdate:
                                                                (rating) {
                                                              print(rating);
                                                            },
                                                          ),
                                                          verticalSizedBoxTwenty(),
                                                          Container(
                                                            width: 39.5,
                                                            height: 3.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xff3c3f42),
                                                                  width: 3),
                                                            ),
                                                          ),
                                                          verticalSizedBox(),
                                                          Text(
                                                              model.productDetails ==
                                                                      null
                                                                  ? ""
                                                                  : "${model.productDetails.productName ?? ""}",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                textStyle: TextStyle(
                                                                    color: const Color(
                                                                        0xff3c3f42),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        26.0),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                          verticalSizedBoxFive(),
                                                          Text(
                                                              "(8 kg - 1200 RPM )",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                textStyle: TextStyle(
                                                                    color: const Color(
                                                                        0xff3c3f42),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        14.5),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                          verticalSizedBoxFive(),
                                                          Container(
                                                            child:
                                                                ExpandableText(
                                                              //  "The Senator VXS, with its 8kgs load capacity, is ideal for medium to large families with heavy laundry requirements.The Senator VXS, with its 8kgs load capacity, is ideal for medium to large families with heavy laundry requirements.",
                                                              model.productDetails !=
                                                                      null
                                                                  ? "${model.productDetails.bulletPoints[0]}"
                                                                  : "The Senator VXS, with its 8kgs load capacity, is ideal for medium to large families with heavy laundry requirements.The Senator VXS, with its 8kgs load capacity, is ideal for medium to large families with heavy laundry requirements.",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                textStyle: TextStyle(
                                                                    color: const Color(
                                                                        0xff3c3f42),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        12.0),
                                                              ),
                                                              trimLines: 4,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                          Container(
                                                            width: 80,
                                                            height: 15,
                                                            color: lightBlack,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                " Features",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xffffffff),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          "Roboto",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          10.0),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          verticalSizedBox(),
                                                          Wrap(
                                                            children:
                                                                _generateChildren(
                                                                    images
                                                                        .length,
                                                                    model),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Container(
                                                            width: 122.5,
                                                            height: 15,
                                                            color: lightBlack,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                " Specifications",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xffffffff),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          "Roboto",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          verticalSizedBox(),
                                                          ListView.builder(
                                                              shrinkWrap: true,
                                                              itemCount:
                                                                  specificationsValue
                                                                      .length,
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              itemBuilder:
                                                                  (context,
                                                                      indexx) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    width: 300,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border(
                                                                        bottom:
                                                                            BorderSide(
                                                                          width:
                                                                              0.5,
                                                                          color:
                                                                              Color(0xff707070),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              5.0),
                                                                      child:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                              "${specificationsValue[indexx]}",
                                                                              style: GoogleFonts.roboto(
                                                                                textStyle: TextStyle(color: const Color(0xff3c3f42), fontWeight: FontWeight.w400, fontFamily: "Roboto", fontStyle: FontStyle.normal, fontSize: 10.0),
                                                                              ),
                                                                              textAlign: TextAlign.left),
                                                                          Icon(
                                                                            Icons.add,
                                                                            size:
                                                                                15,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                          Container(
                                                            width: 100,
                                                            height: 15,
                                                            color: lightBlack,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                  " OPTIONS",
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    textStyle: TextStyle(
                                                                        color: const Color(
                                                                            0xffffffff),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontFamily:
                                                                            "Roboto",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            10.0),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                            ),
                                                          ),
                                                          verticalSizedBoxTwenty(),
                                                          Wrap(
                                                            children:
                                                                _generateColorsChildren(
                                                                    categoryColors
                                                                        .length,
                                                                    model),
                                                          ),
                                                          verticalSizedBoxTwenty(),
                                                          Wrap(
                                                            children:
                                                                _generateNumberChildren(
                                                                    images
                                                                        .length,
                                                                    model),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        verticalSizedBox(),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onNotification:
                                      (ScrollNotification scrollInfo) {
                                    if (scrollInfo.metrics.pixels ==
                                        scrollInfo.metrics.maxScrollExtent) {
                                      // setState(() {
                                      //   animColor =
                                      //       Color(0xff3c3f42).withOpacity(0.8);
                                      // });
                                    }
                                    return true;
                                  },
                                ),
                              ),
                      ],
                    ),
                    Positioned(
                      top: 250,
                      left: 0.0,
                      right: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 123,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x73000000),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ],
                                borderRadius: BorderRadius.circular(16.0),
                                color: animColor, //const Color(0xff3c3f42),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 25.0),
                                child: FittedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // SCAN TO
                                      Text("SCAN TO",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w300,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 6.5),
                                          ),
                                          textAlign: TextAlign.left),
                                      verticalSizedBox(),
                                      // ADD TO
                                      Text(
                                        "ADD TO",
                                        style: GoogleFonts.bebasNeue(
                                          textStyle: TextStyle(
                                              color: const Color(0xff1ffffff),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "BebasNeue",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 21.0),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text("YOUR",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 17.0),
                                          ),
                                          textAlign: TextAlign.left),
                                      // BAG
                                      Text("BAG",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 24.0),
                                          ),
                                          textAlign: TextAlign.left),
                                      verticalSizedBox(),
                                      Container(
                                        width: 28,
                                        height: 0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffffffff),
                                              width: 2),
                                        ),
                                      ),
                                      verticalSizedBox(),
                                      Text("PRODUCT ID : VAPH123405",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 5.5),
                                          ),
                                          textAlign: TextAlign.left),
                                      verticalSizedBox(),
                                      Container(
                                        height: 85.447265625,
                                        width: 85.447021484375,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: model.productDetails != null
                                            ? QrImage(
                                                data:
                                                    model.productDetails.qRCode,
                                                backgroundColor: Colors.white,
                                              )
                                            : Image.asset(
                                                "assets/images/qr.png"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 110,
                              height: 30,
                              child: FittedBox(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xff3c3f42),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 6.0),
                                          ),
                                          text: "POWERED BY "),
                                      TextSpan(
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xff3c3f42),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 6.0),
                                          ),
                                          text: "INKI ADVANTAGE")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                            ),
                            Visibility(
                              visible: true,
                              // model.productDetails.discountPercent != "0",
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Text(
                                        model.productDetails != null
                                            ? "${model.productDetails.price}"
                                            : "",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: const Color(0xff3c3f42),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 17,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                  horizontalSizedBoxFive(),
                                  Flexible(
                                    child: Container(
                                      color: lightREd,
                                      height: 21.0390625,
                                      width: 42.078369140625,
                                      child: Center(
                                        child: Text(
                                            "${model.productDetails != null ? model.productDetails.discountPercent : ""}%",
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13.5),
                                            ),
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            verticalSizedBox(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                model.productDetails != null
                                    ? "\u20B9 ${model.productDetails.price}"
                                    : "",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff424242),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 40),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: showFilter,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.45,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 2,
                              sigmaY: 2,
                            ),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(40.0),
                                        child: Container(
                                          height: 540.5,
                                          width: 456,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // Share your preferences
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          showFilter = false;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 35,
                                                      ),
                                                    )),
                                              ),
                                              verticalSizedBoxTwenty(),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 395,
                                                  width: 346,
                                                  child: Swiper(
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return new Image.asset(
                                                          "${images[selectedIndex]}",
                                                          fit: BoxFit.fill,
                                                        );
                                                      },
                                                      itemCount: 3,
                                                      pagination:
                                                          new SwiperPagination(),
                                                      control:
                                                          new SwiperControl(),
                                                      onIndexChanged: (value) {
                                                        setState(() {
                                                          selectedIndex = value;
                                                        });
                                                      }),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: showFilter,
                      child: Positioned(
                        bottom: 20,
                        left: 0.0,
                        right: 0.0,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Container(
                                  height: 540.5,
                                  width: 456,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Share your preferences
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  showFilter = false;
                                                });
                                              },
                                              child: Icon(
                                                Icons.close,
                                                size: 35,
                                              ),
                                            )),
                                      ),
                                      verticalSizedBoxTwenty(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 395,
                                          width: 346,
                                          child: Swiper(
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return new Image.asset(
                                                  "${images[selectedIndex]}",
                                                  fit: BoxFit.fill,
                                                );
                                              },
                                              itemCount: 3,
                                              pagination:
                                                  new SwiperPagination(),
                                              control: new SwiperControl(),
                                              onIndexChanged: (value) {
                                                setState(() {
                                                  selectedIndex = value;
                                                });
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  List<Widget> _generateChildren(int count, ProductViewModel model) {
    List<Widget> items = [];

    for (int i = 0; i < count; i++) {
      items.add(_generateItem(60, 60, images[i], i, model));
    }

    return items;
  }

  List<Widget> _generateNumberChildren(int count, ProductViewModel model) {
    List<Widget> items = [];

    for (int i = 0; i < count; i++) {
      items.add(_generateNumberItem(60, 60, images[i], model));
    }

    return items;
  }

  List<Widget> _generateColorsChildren(int count, ProductViewModel model) {
    List<Widget> items = [];

    for (int i = 0; i < count; i++) {
      items.add(_generateColorItem(60, 60, i, model));
    }

    return items;
  }

  Widget _generateNumberItem(
      double width, double height, String image, ProductViewModel model) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("5",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff3c3f42),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 17.5),
                  ),
                  textAlign: TextAlign.left),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.close,
                size: 50,
                color: Colors.grey[400],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _generateItem(double width, double height, String image, int index,
      ProductViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showFilter = true;
                selectedIndex = index;
              });
            },
            child: Container(
              width: width,
              height: height,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              child: Image.asset(
                image,
                width: width,
                height: height,
              ),
            ),
          ),
          verticalSizedBoxFive(),
          Text("${features[index]}",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: const Color(0xff424242),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 5.5),
              ),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }

  Widget _generateColorItem(
      double width, double height, int index, ProductViewModel model) {
    return index == categoryColors.length - 1
        ? InkWell(
            onTap: () {
              Navigator.pushNamed(context, moreOptionsScreen);
            },
            child: Container(
              width: 60,
              child: Image.asset(
                'assets/images/color_options.png',
              ),
            ),
          )
        : // Rectangle 204
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: categoryColors[index].withOpacity(0.5),
            ),
          );
  }
}
