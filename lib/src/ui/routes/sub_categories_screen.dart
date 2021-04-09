import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/constants/common_strings.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/SpalshScreenViewModel.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/networ_catch_image.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:inki/src/ui/res/colors.dart';
import 'package:provider/provider.dart';

class SubCategoriesListScreen extends StatefulWidget {
  final int indexValue;

  SubCategoriesListScreen({
    this.indexValue,
  });

  @override
  _SubCategoriesListScreenState createState() => _SubCategoriesListScreenState(
        indexValue: indexValue,
      );
}

class _SubCategoriesListScreenState extends State<SubCategoriesListScreen> {
  final int indexValue;
  bool showFilterPage = false;

  SplashScreenViewModel splashScreenViewModel;
  List<String> specificationsValue = [
    "Capacity",
    "Color",
    "Spin Speed",
    "Offers",
  ];

  List<String> dryer = [
    "TOP LOAD",
    "FRONT LOAD",
    "DRYER",
  ];

  _SubCategoriesListScreenState({this.indexValue});

  bool showBottomSheet = false;

  @override
  void initState() {
    splashScreenViewModel =
        Provider.of<SplashScreenViewModel>(context, listen: false);
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        showFilterPage = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenViewModel>(
      builder:
          (BuildContext context, SplashScreenViewModel model, Widget child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: scaffoldBackgroundColor,
            body: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          customAppBar(
                              context: context,
                              onBackClicked: () {
                                Navigator.pop(context);
                              },
                              menuOnClicked: () {
                                navigateToHome(context: context);
                              }),
                          OrientationBuilder(builder: (context, orientation) {
                            return Stack(
                              children: [
                                Center(
                                  child: Container(
                                    color: Colors.white70,
                                    height: 238, //238,
                                    width: MediaQuery.of(context).size.width,
                                    child: model.mainCategories == null
                                        ? loaderBeforeImage(
                                            image: "assets/images/home.png",
                                            width: 162.5,
                                            height: 135)
                                        : networkImage(
                                            image: model
                                                .mainCategories[indexValue]
                                                .imageBanner,
                                            loaderImage: loaderBeforeImage(),
                                            boxFit: BoxFit.fitHeight,
                                          ),
                                  ),
                                ),
                                Positioned(
                                  top: orientation == Orientation.portrait
                                      ? 170
                                      : 170,
                                  right: 0.0,
                                  left: 0.0,
                                  //MediaQuery.of(context).size.height / 5.3,
                                  // right:50, //MediaQuery.of(context).size.width / 11,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 42.0, vertical: 0.0),
                                    child: Container(
                                      height: 40,
                                      // width: MediaQuery.of(context).size.width / 1.2,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                      color: const Color(
                                                          0xffca3037),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "Roboto",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                  text:
                                                      "${model.mainCategories[indexValue].subCategory.split(" ")[0]}"),
                                              TextSpan(text: "  "),
                                              TextSpan(
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: const Color(
                                                            0xff3c3f42),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 25.0),
                                                  ),
                                                  text:
                                                      "${model.mainCategories[indexValue].subCategory.split(" ")[1]}")
                                              //"${model.mainCategories[indexValue].categoryName}")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 42.0, vertical: 10),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      verticalSizedBox(),
                                      Text(
                                        "${model.mainCategories[indexValue].description}",
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: const Color(0xff232323),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.5),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      verticalSizedBox(),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: model
                                            .mainCategories[indexValue]
                                            .groupMasters
                                            .length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                subCategoriesProducts,
                                                arguments: {
                                                  CommonStrings.parentIndex:
                                                      indexValue,
                                                  CommonStrings.childIndex:
                                                      index
                                                },
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Card(
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 1.0),
                                                  child: FittedBox(
                                                    child: Container(
                                                      width: 456,
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                            color: Colors.white
                                                                .withOpacity(
                                                              0.2,
                                                            ),
                                                            offset: Offset(
                                                              3,
                                                              3,
                                                            ),
                                                            blurRadius: 2,
                                                            spreadRadius: 2,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child: model
                                                                        .mainCategories[
                                                                            indexValue]
                                                                        .groupMasters[
                                                                            index]
                                                                        .imageMain ==
                                                                    null
                                                                ? loaderBeforeImage(
                                                                    image:
                                                                        "assets/images/home.png",
                                                                    width:
                                                                        162.5,
                                                                    height: 135,
                                                                  )
                                                                : networkImage(
                                                                    image: model
                                                                        .mainCategories[
                                                                            indexValue]
                                                                        .groupMasters[
                                                                            index]
                                                                        .imageMain,
                                                                    loaderImage:
                                                                        loaderBeforeImage(),
                                                                    width:
                                                                        162.5,
                                                                    height: 135,
                                                                  ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                            height: 10,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                verticalSizedBoxFive(),
                                                                Text(
                                                                  model
                                                                      .mainCategories[
                                                                          indexValue]
                                                                      .groupMasters[
                                                                          index]
                                                                      .group,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    textStyle: TextStyle(
                                                                        color: const Color(
                                                                            0xff4d4e4e),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                        fontFamily:
                                                                            "Lato",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            22.5),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  // style: Theme.of(
                                                                  //         context)
                                                                  //     .textTheme
                                                                  //     .headline3
                                                                  //     .copyWith(
                                                                  //       color:
                                                                  //           lightGreyTwo,
                                                                  //       fontWeight:
                                                                  //           FontWeight
                                                                  //               .bold,
                                                                  //     ),
                                                                ),
                                                                verticalSizedBoxFive(),
                                                                Wrap(
                                                                  children: [
                                                                    Text(
                                                                      model
                                                                          .mainCategories[
                                                                              indexValue]
                                                                          .groupMasters[
                                                                              index]
                                                                          .description,
                                                                      style: GoogleFonts
                                                                          .lato(
                                                                        textStyle: TextStyle(
                                                                            color: const Color(
                                                                                0xff3c3f42),
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                "Lato",
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            fontSize: 13.0),
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                    ),
                                                                  ],
                                                                ),
                                                                verticalSizedBox(),
                                                                Text(
                                                                    "Know more",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      textStyle: TextStyle(
                                                                          color: const Color(
                                                                              0xffca3037),
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontFamily:
                                                                              "Lato",
                                                                          fontStyle: FontStyle
                                                                              .normal,
                                                                          fontSize:
                                                                              6.0),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left)
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: showFilterPage,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.5,
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
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(40.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Share your preferences
                                                verticalSizedBox(),
                                                verticalSizedBox(),
                                                Text("Share your preferences",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: const Color(
                                                              0xff3c3f42),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: "Roboto",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 21.0),
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                                // We will help you with the best options !
                                                Text(
                                                    "We will help you with the best options !",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: const Color(
                                                              0xff3c3f42),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15.0),
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                                verticalSizedBoxTwenty(),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15.0,
                                                      vertical: 0.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      // Category
                                                      Text("Category",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xff3c3f42),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 12.5),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center),
                                                      Flexible(
                                                        child: Container(
                                                          height: 55,
                                                          child:
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount: dryer
                                                                      .length,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30.5,
                                                                        width:
                                                                            75,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border: Border.all(
                                                                              color: Colors.grey,
                                                                              width: 1),
                                                                        ),
                                                                        child: // TOP LOAD
                                                                            Center(
                                                                          child: Text(
                                                                              "${dryer[index]}",
                                                                              style: GoogleFonts.roboto(
                                                                                textStyle: TextStyle(color: const Color(0xff3c3f42), fontWeight: FontWeight.w500, fontFamily: "Roboto", fontStyle: FontStyle.normal, fontSize: 10.0),
                                                                              ),
                                                                              textAlign: TextAlign.center),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                        ),
                                                      )
                                                    ],
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
                                                        (context, indexValue) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    15.0,
                                                                vertical: 16.0),
                                                        child: Container(
                                                          width:
                                                              286.417724609375,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                                width: 1.5,
                                                                color: Color(
                                                                    0xff707070),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "${specificationsValue[indexValue]}",
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    textStyle: TextStyle(
                                                                        color: const Color(
                                                                            0xff3c3f42),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            "Roboto",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            12.5),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_down_sharp,
                                                                size: 20,
                                                                color: Colors
                                                                    .black,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                verticalSizedBox(),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 13.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          width: 1.5,
                                                          color:
                                                              Color(0xff707070),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Price range",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              textStyle: TextStyle(
                                                                  color: const Color(
                                                                      0xff3c3f42),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      12.5),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                verticalSizedBox(),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // SKIP
                                                      // InkWell(
                                                      //   onTap: () {
                                                      //     setState(() {
                                                      //       showFilter = false;
                                                      //     });
                                                      //   },
                                                      //   child: Container(
                                                      //     height: 100,
                                                      //     width: 150,
                                                      //     child: Align(
                                                      //       alignment: Alignment
                                                      //           .centerLeft,
                                                      //       child: Text("SKIP",
                                                      //           style:
                                                      //               GoogleFonts
                                                      //                   .roboto(
                                                      //             textStyle: TextStyle(
                                                      //                 color: const Color(
                                                      //                     0xff232323),
                                                      //                 fontWeight:
                                                      //                     FontWeight
                                                      //                         .w700,
                                                      //                 fontFamily:
                                                      //                     "Roboto",
                                                      //                 fontStyle:
                                                      //                     FontStyle
                                                      //                         .normal,
                                                      //                 fontSize:
                                                      //                     12.5),
                                                      //           ),
                                                      //           textAlign:
                                                      //               TextAlign
                                                      //                   .center),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      Flexible(
                                                        child: RaisedButton(
                                                          color: Colors.white,
                                                          elevation: 0.1,
                                                          onPressed: () {
                                                            setState(() {
                                                              showFilterPage =
                                                                  false;
                                                            });
                                                          },
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text("SKIP",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xff232323),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontFamily:
                                                                          "Roboto",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          12.5),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ),
                                                          // child: Container(
                                                          //   height: 150,
                                                          //   width: MediaQuery.of(
                                                          //               context)
                                                          //           .size
                                                          //           .width /
                                                          //       2,
                                                          //   // color:
                                                          //   //     Colors.green,
                                                          //   child: Align(
                                                          //     alignment: Alignment
                                                          //         .centerLeft,
                                                          //     child: Text(
                                                          //         "SKIP",
                                                          //         style:
                                                          //             GoogleFonts
                                                          //                 .roboto(
                                                          //           textStyle: TextStyle(
                                                          //               color: const Color(
                                                          //                   0xff232323),
                                                          //               fontWeight:
                                                          //                   FontWeight
                                                          //                       .w700,
                                                          //               fontFamily:
                                                          //                   "Roboto",
                                                          //               fontStyle:
                                                          //                   FontStyle
                                                          //                       .normal,
                                                          //               fontSize:
                                                          //                   12.5),
                                                          //         ),
                                                          //         textAlign:
                                                          //             TextAlign
                                                          //                 .center),
                                                          //   ),
                                                          // ),
                                                        ),
                                                      ),
                                                      horizontalSizedBox(),
                                                      Flexible(
                                                        child: RaisedButton(
                                                          color: Colors.white,
                                                          elevation: 0.2,
                                                          onPressed: () {
                                                            setState(() {
                                                              showFilterPage =
                                                                  false;
                                                            });
                                                          },

                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text("APPLY",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xff232323),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontFamily:
                                                                          "Roboto",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          12.5),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ),
                                                          // child: Container(
                                                          //   height: 150,
                                                          //   width: MediaQuery.of(
                                                          //               context)
                                                          //           .size
                                                          //           .width /
                                                          //       2,
                                                          //   // color:
                                                          //   //     Colors.green,
                                                          //   child: Align(
                                                          //     alignment: Alignment
                                                          //         .centerRight,
                                                          //     child: Text(
                                                          //         "APPLY",
                                                          //         style: GoogleFonts
                                                          //             .roboto(
                                                          //           textStyle: TextStyle(
                                                          //               color: const Color(
                                                          //                   0xff232323),
                                                          //               fontWeight: FontWeight
                                                          //                   .w700,
                                                          //               fontFamily:
                                                          //                   "Roboto",
                                                          //               fontStyle: FontStyle
                                                          //                   .normal,
                                                          //               fontSize:
                                                          //                   12.5),
                                                          //         ),
                                                          //         textAlign:
                                                          //             TextAlign
                                                          //                 .center),
                                                          //   ),
                                                          // ),
                                                        ),
                                                      )
                                                      // APPLY
                                                      // InkWell(
                                                      //   onTap: () {
                                                      //     setState(() {
                                                      //       showFilter = false;
                                                      //     });
                                                      //   },
                                                      //   child: Container(
                                                      //     height: 100,
                                                      //     width: 150,
                                                      //     child: Align(
                                                      //       alignment: Alignment
                                                      //           .centerRight,
                                                      //       child: Text("APPLY",
                                                      //           style:
                                                      //               GoogleFonts
                                                      //                   .roboto(
                                                      //             textStyle: TextStyle(
                                                      //                 color: const Color(
                                                      //                     0xff232323),
                                                      //                 fontWeight:
                                                      //                     FontWeight
                                                      //                         .w700,
                                                      //                 fontFamily:
                                                      //                     "Roboto",
                                                      //                 fontStyle:
                                                      //                     FontStyle
                                                      //                         .normal,
                                                      //                 fontSize:
                                                      //                     12.5),
                                                      //           ),
                                                      //           textAlign:
                                                      //               TextAlign
                                                      //                   .center),
                                                      //     ),
                                                      //   ),
                                                      // )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
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
                    // Visibility(
                    //   visible: showFilter,
                    //   child: Positioned(
                    //     bottom: 20,
                    //     left: 0.0,
                    //     right: 0.0,
                    //     child: SingleChildScrollView(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         mainAxisSize: MainAxisSize.max,
                    //         children: <Widget>[
                    //           Padding(
                    //             padding: const EdgeInsets.all(40.0),
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10.0),
                    //                 color: Colors.white,
                    //               ),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     // Share your preferences
                    //                     verticalSizedBox(),
                    //                     verticalSizedBox(),
                    //                     Text("Share your preferences",
                    //                         style: GoogleFonts.roboto(
                    //                           textStyle: TextStyle(
                    //                               color:
                    //                                   const Color(0xff3c3f42),
                    //                               fontWeight: FontWeight.w700,
                    //                               fontFamily: "Roboto",
                    //                               fontStyle: FontStyle.normal,
                    //                               fontSize: 21.0),
                    //                         ),
                    //                         textAlign: TextAlign.center),
                    //                     // We will help you with the best options !
                    //                     Text(
                    //                         "We will help you with the best options !",
                    //                         style: GoogleFonts.roboto(
                    //                           textStyle: TextStyle(
                    //                               color:
                    //                                   const Color(0xff3c3f42),
                    //                               fontWeight: FontWeight.w400,
                    //                               fontFamily: "Roboto",
                    //                               fontStyle: FontStyle.normal,
                    //                               fontSize: 15.0),
                    //                         ),
                    //                         textAlign: TextAlign.center),
                    //                     verticalSizedBoxTwenty(),
                    //                     Padding(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           horizontal: 15.0, vertical: 0.0),
                    //                       child: Row(
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.start,
                    //                         children: [
                    //                           // Category
                    //                           Text("Category",
                    //                               style: GoogleFonts.roboto(
                    //                                 textStyle: TextStyle(
                    //                                     color: const Color(
                    //                                         0xff3c3f42),
                    //                                     fontWeight:
                    //                                         FontWeight.w400,
                    //                                     fontFamily: "Roboto",
                    //                                     fontStyle:
                    //                                         FontStyle.normal,
                    //                                     fontSize: 12.5),
                    //                               ),
                    //                               textAlign: TextAlign.center),
                    //                           Flexible(
                    //                             child: Container(
                    //                               height: 55,
                    //                               child: ListView.builder(
                    //                                   shrinkWrap: true,
                    //                                   itemCount: dryer.length,
                    //                                   scrollDirection:
                    //                                       Axis.horizontal,
                    //                                   itemBuilder:
                    //                                       (context, index) {
                    //                                     return Padding(
                    //                                       padding:
                    //                                           const EdgeInsets
                    //                                               .all(5.0),
                    //                                       child: Container(
                    //                                         height: 30.5,
                    //                                         width: 75,
                    //                                         decoration:
                    //                                             BoxDecoration(
                    //                                           borderRadius:
                    //                                               BorderRadius
                    //                                                   .circular(
                    //                                                       8.0),
                    //                                           border: Border.all(
                    //                                               color: Colors
                    //                                                   .grey,
                    //                                               width: 1),
                    //                                         ),
                    //                                         child: // TOP LOAD
                    //                                             Center(
                    //                                           child: Text(
                    //                                               "${dryer[index]}",
                    //                                               style:
                    //                                                   GoogleFonts
                    //                                                       .roboto(
                    //                                                 textStyle: TextStyle(
                    //                                                     color: const Color(
                    //                                                         0xff3c3f42),
                    //                                                     fontWeight:
                    //                                                         FontWeight
                    //                                                             .w500,
                    //                                                     fontFamily:
                    //                                                         "Roboto",
                    //                                                     fontStyle:
                    //                                                         FontStyle
                    //                                                             .normal,
                    //                                                     fontSize:
                    //                                                         10.0),
                    //                                               ),
                    //                                               textAlign:
                    //                                                   TextAlign
                    //                                                       .center),
                    //                                         ),
                    //                                       ),
                    //                                     );
                    //                                   }),
                    //                             ),
                    //                           )
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     verticalSizedBox(),
                    //                     ListView.builder(
                    //                         shrinkWrap: true,
                    //                         itemCount:
                    //                             specificationsValue.length,
                    //                         physics:
                    //                             NeverScrollableScrollPhysics(),
                    //                         itemBuilder: (context, indexValue) {
                    //                           return Padding(
                    //                             padding:
                    //                                 const EdgeInsets.symmetric(
                    //                                     horizontal: 15.0,
                    //                                     vertical: 16.0),
                    //                             child: Container(
                    //                               width: 286.417724609375,
                    //                               height: 25,
                    //                               decoration: BoxDecoration(
                    //                                 border: Border(
                    //                                   bottom: BorderSide(
                    //                                     width: 1.5,
                    //                                     color:
                    //                                         Color(0xff707070),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               child: Row(
                    //                                 crossAxisAlignment:
                    //                                     CrossAxisAlignment
                    //                                         .center,
                    //                                 mainAxisAlignment:
                    //                                     MainAxisAlignment
                    //                                         .spaceBetween,
                    //                                 children: [
                    //                                   Text(
                    //                                       "${specificationsValue[indexValue]}",
                    //                                       style: GoogleFonts
                    //                                           .roboto(
                    //                                         textStyle: TextStyle(
                    //                                             color: const Color(
                    //                                                 0xff3c3f42),
                    //                                             fontWeight:
                    //                                                 FontWeight
                    //                                                     .w400,
                    //                                             fontFamily:
                    //                                                 "Roboto",
                    //                                             fontStyle:
                    //                                                 FontStyle
                    //                                                     .normal,
                    //                                             fontSize: 12.5),
                    //                                       ),
                    //                                       textAlign:
                    //                                           TextAlign.left),
                    //                                   Icon(
                    //                                     Icons
                    //                                         .arrow_drop_down_sharp,
                    //                                     size: 20,
                    //                                     color: Colors.black,
                    //                                   )
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                           );
                    //                         }),
                    //                     verticalSizedBox(),
                    //                     Padding(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 5.0, horizontal: 13.0),
                    //                       child: Container(
                    //                         width: MediaQuery.of(context)
                    //                             .size
                    //                             .width,
                    //                         height: 25,
                    //                         decoration: BoxDecoration(
                    //                           border: Border(
                    //                             bottom: BorderSide(
                    //                               width: 1.5,
                    //                               color: Color(0xff707070),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         child: Row(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.center,
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.start,
                    //                           children: [
                    //                             Text("Price range",
                    //                                 style: GoogleFonts.roboto(
                    //                                   textStyle: TextStyle(
                    //                                       color: const Color(
                    //                                           0xff3c3f42),
                    //                                       fontWeight:
                    //                                           FontWeight.w400,
                    //                                       fontFamily: "Roboto",
                    //                                       fontStyle:
                    //                                           FontStyle.normal,
                    //                                       fontSize: 12.5),
                    //                                 ),
                    //                                 textAlign: TextAlign.left),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     verticalSizedBox(),
                    //                     Padding(
                    //                       padding: const EdgeInsets.all(15.0),
                    //                       child: Row(
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.spaceBetween,
                    //                         children: [
                    //                           // SKIP
                    //                           InkWell(
                    //                             onTap: () {
                    //                               setState(() {
                    //                                 showFilter = false;
                    //                               });
                    //                             },
                    //                             child: Container(
                    //                               height: 30,
                    //                               width: 40,
                    //                               child: Center(
                    //                                 child: Text("SKIP",
                    //                                     style:
                    //                                         GoogleFonts.roboto(
                    //                                       textStyle: TextStyle(
                    //                                           color: const Color(
                    //                                               0xff232323),
                    //                                           fontWeight:
                    //                                               FontWeight
                    //                                                   .w700,
                    //                                           fontFamily:
                    //                                               "Roboto",
                    //                                           fontStyle:
                    //                                               FontStyle
                    //                                                   .normal,
                    //                                           fontSize: 12.5),
                    //                                     ),
                    //                                     textAlign:
                    //                                         TextAlign.center),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           // APPLY
                    //                           InkWell(
                    //                             onTap: () {
                    //                               setState(() {
                    //                                 showFilter = false;
                    //                               });
                    //                             },
                    //                             child: Container(
                    //                               height: 30,
                    //                               width: 55,
                    //                               child: Center(
                    //                                 child: Text("APPLY",
                    //                                     style:
                    //                                         GoogleFonts.roboto(
                    //                                       textStyle: TextStyle(
                    //                                           color: const Color(
                    //                                               0xff232323),
                    //                                           fontWeight:
                    //                                               FontWeight
                    //                                                   .w700,
                    //                                           fontFamily:
                    //                                               "Roboto",
                    //                                           fontStyle:
                    //                                               FontStyle
                    //                                                   .normal,
                    //                                           fontSize: 12.5),
                    //                                     ),
                    //                                     textAlign:
                    //                                         TextAlign.center),
                    //                               ),
                    //                             ),
                    //                           )
                    //                         ],
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              },
            ),
            // body: NestedScrollView(
            //   controller: model.productsCategoriesScrollListener,
            //   headerSliverBuilder:
            //       (BuildContext context, bool innerBoxIsScrolled) {
            //     return <Widget>[
            //       SliverAppBar(
            //         elevation: 0.0,
            //         backgroundColor: scaffoldBackgroundColor,
            //         expandedHeight: 270.0,
            //         floating: false,
            //         automaticallyImplyLeading: false,
            //         pinned: false,
            //         flexibleSpace: FlexibleSpaceBar(
            //           background: Stack(
            //             children: [
            //               Center(
            //                 child: Hero(
            //                   tag: "$indexValue",
            //                   child: Container(
            //                     color: Colors.white70,
            //                     width: MediaQuery.of(context).size.width,
            //                     child: model.mainCategories[indexValue]
            //                                 .imageBanner ==
            //                             null
            //                         ? loaderBeforeImage(
            //                             image: "assets/images/home.png",
            //                             width: 162.5,
            //                             height: 135)
            //                         : networkImage(
            //                             image: model.mainCategories[indexValue]
            //                                 .imageBanner,
            //                             loaderImage: loaderBeforeImage(),
            //                             boxFit: BoxFit.fitWidth,
            //                           ),
            //                   ),
            //                   // child: networkImage(
            //                   //   image: model.listOfMainCategories[indexValue]
            //                   //       .imageSrc,
            //                   //   loaderImage: loaderBeforeImage(),
            //                   //   boxFit: BoxFit.fitWidth,
            //                   // ),
            //                 ),
            //               ),
            //               Positioned(
            //                 top: MediaQuery.of(context).size.height / 4.5,
            //                 right: MediaQuery.of(context).size.width / 12,
            //                 child: Container(
            //                   height: 40,
            //                   width: MediaQuery.of(context).size.width / 1.2,
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                   ),
            //                   child: Center(
            //                     child: RichText(
            //                       text: TextSpan(
            //                         children: [
            //                           TextSpan(
            //                               style: GoogleFonts.roboto(
            //                                 textStyle: TextStyle(
            //                                   color: const Color(0xffca3037),
            //                                   fontWeight: FontWeight.w700,
            //                                   fontFamily: "Roboto",
            //                                   fontStyle: FontStyle.normal,
            //                                   fontSize: 25.0,
            //                                 ),
            //                               ),
            //                               text:
            //                                   "${model.mainCategories[indexValue].subCategory}"),
            //                           TextSpan(text: "  "),
            //                           TextSpan(
            //                               style: GoogleFonts.roboto(
            //                                 textStyle: TextStyle(
            //                                     color: const Color(0xff3c3f42),
            //                                     fontWeight: FontWeight.w700,
            //                                     fontStyle: FontStyle.normal,
            //                                     fontSize: 25.0),
            //                               ),
            //                               text: "")
            //                           //"${model.mainCategories[indexValue].categoryName}")
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ];
            //   },
            //   body: LayoutBuilder(
            //     builder:
            //         (BuildContext context, BoxConstraints viewportConstraints) {
            //       return Stack(
            //         children: <Widget>[
            //           Container(
            //             // color: Colors.white,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Stack(
            //                   children: [
            //                     Center(
            //                       child: Hero(
            //                         tag: "$indexValue",
            //                         child: Container(
            //                           color: Colors.white70,
            //                           width: MediaQuery.of(context).size.width,
            //                           child: model.mainCategories[indexValue]
            //                               .imageBanner ==
            //                               null
            //                               ? loaderBeforeImage(
            //                               image: "assets/images/home.png",
            //                               width: 162.5,
            //                               height: 135)
            //                               : networkImage(
            //                             image: model.mainCategories[indexValue]
            //                                 .imageBanner,
            //                             loaderImage: loaderBeforeImage(),
            //                             boxFit: BoxFit.fitWidth,
            //                           ),
            //                         ),
            //                         // child: networkImage(
            //                         //   image: model.listOfMainCategories[indexValue]
            //                         //       .imageSrc,
            //                         //   loaderImage: loaderBeforeImage(),
            //                         //   boxFit: BoxFit.fitWidth,
            //                         // ),
            //                       ),
            //                     ),
            //                     Positioned(
            //                       top: MediaQuery.of(context).size.height / 4.5,
            //                       right: MediaQuery.of(context).size.width / 12,
            //                       child: Container(
            //                         height: 40,
            //                         width: MediaQuery.of(context).size.width / 1.2,
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                         ),
            //                         child: Center(
            //                           child: RichText(
            //                             text: TextSpan(
            //                               children: [
            //                                 TextSpan(
            //                                     style: GoogleFonts.roboto(
            //                                       textStyle: TextStyle(
            //                                         color: const Color(0xffca3037),
            //                                         fontWeight: FontWeight.w700,
            //                                         fontFamily: "Roboto",
            //                                         fontStyle: FontStyle.normal,
            //                                         fontSize: 25.0,
            //                                       ),
            //                                     ),
            //                                     text:
            //                                     "${model.mainCategories[indexValue].subCategory}"),
            //                                 TextSpan(text: "  "),
            //                                 TextSpan(
            //                                     style: GoogleFonts.roboto(
            //                                       textStyle: TextStyle(
            //                                           color: const Color(0xff3c3f42),
            //                                           fontWeight: FontWeight.w700,
            //                                           fontStyle: FontStyle.normal,
            //                                           fontSize: 25.0),
            //                                     ),
            //                                     text: "")
            //                                 //"${model.mainCategories[indexValue].categoryName}")
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 Expanded(
            //                   child: SingleChildScrollView(
            //                     child: Container(
            //                       child: Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         mainAxisSize: MainAxisSize.min,
            //                         children: <Widget>[
            //                           verticalSizedBox(),
            //                           Padding(
            //                             padding: const EdgeInsets.symmetric(
            //                               horizontal: 25.0,
            //                               vertical: 8.0,
            //                             ),
            //                             child: Text(
            //                               "${model.mainCategories[indexValue].description}",
            //                               style: GoogleFonts.lato(
            //                                 textStyle: TextStyle(
            //                                     color: const Color(0xff232323),
            //                                     fontWeight: FontWeight.w400,
            //                                     fontStyle: FontStyle.normal,
            //                                     fontSize: 12.5),
            //                               ),
            //                               textAlign: TextAlign.left,
            //                             ),
            //                           ),
            //                           ListView.builder(
            //                             shrinkWrap: true,
            //                             itemCount: model
            //                                 .mainCategories[indexValue]
            //                                 .groupMasters
            //                                 .length,
            //                             physics: NeverScrollableScrollPhysics(),
            //                             itemBuilder:
            //                                 (BuildContext context, int index) {
            //                               return Padding(
            //                                 padding: const EdgeInsets.symmetric(
            //                                     horizontal: 20.0, vertical: 5.0),
            //                                 child: InkWell(
            //                                   onTap: () {
            //                                     Navigator.of(context).pushNamed(
            //                                       subCategoriesProducts,
            //                                       arguments: {
            //                                         CommonStrings.parentIndex:
            //                                             indexValue,
            //                                         CommonStrings.childIndex:
            //                                             index
            //                                       },
            //                                     );
            //                                   },
            //                                   child: Card(
            //                                     elevation: 3,
            //                                     shape: RoundedRectangleBorder(
            //                                       borderRadius:
            //                                           BorderRadius.circular(10),
            //                                     ),
            //                                     child: Padding(
            //                                       padding:
            //                                           const EdgeInsets.all(10.0),
            //                                       child: Container(
            //                                         decoration: BoxDecoration(
            //                                           boxShadow: <BoxShadow>[
            //                                             BoxShadow(
            //                                               color: Colors.white
            //                                                   .withOpacity(
            //                                                 0.2,
            //                                               ),
            //                                               offset: Offset(
            //                                                 3,
            //                                                 3,
            //                                               ),
            //                                               blurRadius: 2,
            //                                               spreadRadius: 2,
            //                                             ),
            //                                           ],
            //                                         ),
            //                                         child: Row(
            //                                           mainAxisAlignment:
            //                                               MainAxisAlignment.start,
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .center,
            //                                           children: <Widget>[
            //                                             ClipRRect(
            //                                               borderRadius:
            //                                                   BorderRadius
            //                                                       .circular(10.0),
            //                                               child: Hero(
            //                                                 tag:
            //                                                     "${CommonStrings.imageTag}$index",
            //                                                 child: model
            //                                                             .mainCategories[
            //                                                                 indexValue]
            //                                                             .groupMasters[
            //                                                                 index]
            //                                                             .imageMain ==
            //                                                         null
            //                                                     ? loaderBeforeImage(
            //                                                         image:
            //                                                             "assets/images/home.png",
            //                                                         width: 162.5,
            //                                                         height: 135)
            //                                                     : networkImage(
            //                                                         image: model
            //                                                             .mainCategories[
            //                                                                 indexValue]
            //                                                             .groupMasters[
            //                                                                 index]
            //                                                             .imageMain,
            //                                                         loaderImage:
            //                                                             loaderBeforeImage(),
            //                                                         height: 162.5,
            //                                                         width: 135,
            //                                                       ),
            //                                               ),
            //                                             ),
            //                                             SizedBox(
            //                                               width: 20,
            //                                               height: 10,
            //                                             ),
            //                                             Expanded(
            //                                               flex: 2,
            //                                               child: Column(
            //                                                 crossAxisAlignment:
            //                                                     CrossAxisAlignment
            //                                                         .start,
            //                                                 children: <Widget>[
            //                                                   verticalSizedBoxFive(),
            //                                                   Text(
            //                                                     model
            //                                                         .mainCategories[
            //                                                             indexValue]
            //                                                         .groupMasters[
            //                                                             index]
            //                                                         .group,
            //                                                     overflow:
            //                                                         TextOverflow
            //                                                             .ellipsis,
            //                                                     style: GoogleFonts
            //                                                         .lato(
            //                                                       textStyle: TextStyle(
            //                                                           color: const Color(
            //                                                               0xff4d4e4e),
            //                                                           fontWeight:
            //                                                               FontWeight
            //                                                                   .w900,
            //                                                           fontFamily:
            //                                                               "Lato",
            //                                                           fontStyle:
            //                                                               FontStyle
            //                                                                   .normal,
            //                                                           fontSize:
            //                                                               22.5),
            //                                                     ),
            //                                                     textAlign:
            //                                                         TextAlign
            //                                                             .center,
            //                                                     // style: Theme.of(
            //                                                     //         context)
            //                                                     //     .textTheme
            //                                                     //     .headline3
            //                                                     //     .copyWith(
            //                                                     //       color:
            //                                                     //           lightGreyTwo,
            //                                                     //       fontWeight:
            //                                                     //           FontWeight
            //                                                     //               .bold,
            //                                                     //     ),
            //                                                   ),
            //                                                   verticalSizedBoxFive(),
            //                                                   Wrap(
            //                                                     children: [
            //                                                       Text(
            //                                                         model
            //                                                             .mainCategories[
            //                                                                 indexValue]
            //                                                             .groupMasters[
            //                                                                 index]
            //                                                             .description,
            //                                                         style:
            //                                                             GoogleFonts
            //                                                                 .lato(
            //                                                           textStyle: TextStyle(
            //                                                               color: const Color(
            //                                                                   0xff3c3f42),
            //                                                               fontWeight:
            //                                                                   FontWeight
            //                                                                       .w500,
            //                                                               fontFamily:
            //                                                                   "Lato",
            //                                                               fontStyle:
            //                                                                   FontStyle
            //                                                                       .normal,
            //                                                               fontSize:
            //                                                                   13.0),
            //                                                         ),
            //                                                         textAlign:
            //                                                             TextAlign
            //                                                                 .left,
            //                                                       ),
            //                                                     ],
            //                                                   ),
            //                                                   verticalSizedBox(),
            //                                                   Text("Know more",
            //                                                       overflow:
            //                                                           TextOverflow
            //                                                               .ellipsis,
            //                                                       style:
            //                                                           GoogleFonts
            //                                                               .lato(
            //                                                         textStyle: TextStyle(
            //                                                             color: const Color(
            //                                                                 0xffca3037),
            //                                                             fontWeight:
            //                                                                 FontWeight
            //                                                                     .w500,
            //                                                             fontFamily:
            //                                                                 "Lato",
            //                                                             fontStyle:
            //                                                                 FontStyle
            //                                                                     .normal,
            //                                                             fontSize:
            //                                                                 6.0),
            //                                                       ),
            //                                                       textAlign:
            //                                                           TextAlign
            //                                                               .left)
            //                                                 ],
            //                                               ),
            //                                             ),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ),
            //                               );
            //                             },
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
          ),
        );
      },
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Consumer<HomeRestaurantListViewModel>(
//      builder: (BuildContext context, HomeRestaurantListViewModel model,
//          Widget child) {
//        return InkWell(
//          onTap: () {
//            Navigator.of(context).pushNamed(restaurantDetails,
//                arguments: RestaurantsArgModel(
//                  imageTag: "${restaurantInfo.imageTag}${restaurantInfo.index}",
//                  restaurantID: restaurantInfo.restaurantData.id,
//                  image: restaurantInfo.restaurantData.src,
//                  city: restaurantInfo.city,
//                ));
//          },
//          child: Padding(
//            padding: const EdgeInsets.all(7.0),
//            child: Container(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  ClipRRect(
//                    borderRadius: BorderRadius.circular(10.0),
//                    child: Hero(
//                      tag: "${restaurantInfo.imageTag}${restaurantInfo.index}",
//                      child: restaurantInfo.restaurantData.src == " "
//                          ? Image.asset(
//                              'assets/images/no_image.png',
//                              height: 80.0,
//                              width: 80.0,
//                            )
//                          : CachedNetworkImage(
//                              imageUrl: restaurantInfo.restaurantData.src,
//                              placeholder: (context, url) => imageShimmer(),
//                              errorWidget: (context, url, error) =>
//                                  Icon(Icons.error),
//                              fit: BoxFit.fill,
//                              height: 80.0,
//                              width: 80.0,
//                            ),
//                    ),
//                  ),
//                  SizedBox(
//                    width: 15,
//                    height: 10,
//                  ),
//                  Expanded(
//                    flex: 2,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Row(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Text(
//                              restaurantInfo.restaurantData.name,
//                              overflow: TextOverflow.ellipsis,
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display1
//                                  .copyWith(
//                                      fontSize: 14,
//                                      fontWeight: FontWeight.w600),
//                            ),
//                            GestureDetector(
//                              onTap: () {
//                                if (model.accessToken.isNotEmpty) {
//                                  //call api
//                                  model.updateFavoritesIndex(index);
//                                  model.wishListRequest(
//                                    restaurantId:
//                                        restaurantInfo.restaurantData.id,
//                                  );
////                                  setState(
////                                    () {
////                                      favoriteIndex = widget.index;
////                                    },
////                                  );
//
//                                } else {
//                                  // move to login
//                                  Navigator.pushNamed(context, login);
//                                }
//                              },
//                              child: Padding(
//                                padding: const EdgeInsets.only(right: 10.0),
//                                child: Icon(
//                                  Icons.favorite,
//                                  color: restaurantInfo
//                                          .restaurantData.favouriteStatus
//                                      ? Colors.red
//                                      : Colors.grey[300],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                        verticalSizedBox(),
//                        Row(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Flexible(
//                              child: Text(
//                                restaurantInfo.restaurantData.resDesc,
//                                overflow: TextOverflow.ellipsis,
//                                style: Theme.of(context)
//                                    .textTheme
//                                    .display2
//                                    .copyWith(
//                                      fontSize: 13,
//                                    ),
//                              ),
//                            ),
//                            Text(
//                              ' - ',
//                              style:
//                                  Theme.of(context).textTheme.display3.copyWith(
//                                        fontWeight: FontWeight.w600,
//                                      ),
//                            ),
//                            Container(
//                              height: 15,
//                              child: ListView.builder(
//                                  itemCount: 4,
//                                  shrinkWrap: true,
//                                  scrollDirection: Axis.horizontal,
//                                  itemBuilder: (context, index) {
//                                    return Text(
//                                      r"$",
//                                      style: Theme.of(context)
//                                          .textTheme
//                                          .display3
//                                          .copyWith(
//                                            fontSize: 11,
//                                            color: index <=
//                                                    restaurantInfo
//                                                        .restaurantData.budget
//                                                ? Colors.black
//                                                : Colors.grey,
//                                          ),
//                                    );
//                                  }),
//                            )
//                          ],
//                        ),
//                        verticalSizedBoxFive(),
//                        Row(
//                          children: <Widget>[
//                            Icon(
//                              Icons.star,
//                              color: (restaurantInfo.restaurantData.rating == 0)
//                                  ? Colors.grey[600]
//                                  : Colors.amber,
//                              size: 20.0,
//                            ),
//                            SizedBox(
//                              width: 8,
//                            ),
//                            Text(
//                              restaurantInfo.restaurantData.rating.toString(),
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display3
//                                  .copyWith(fontSize: 12),
//                            ),
//                            Text(
//                              " - ",
//                              style:
//                                  Theme.of(context).textTheme.display3.copyWith(
//                                        fontWeight: FontWeight.w500,
//                                      ),
//                            ),
//                            Text(
//                              restaurantInfo.restaurantData.distance.toString(),
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display3
//                                  .copyWith(fontSize: 12),
//                            ),
//                            SizedBox(
//                              width: 5,
//                            ),
//                            Text(
//                              "(${restaurantInfo.restaurantData.deliveryTime.toString()} mins) " ??
//                                  " ",
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display2
//                                  .copyWith(fontSize: 12),
//                            ),
//                          ],
//                        ),
//                        verticalSizedBox(),
//                        divider(),
//                        restaurantInfo.restaurantData.promoStatus == 1
//                            ? shopOpenedWidget()
//                            : Visibility(
//                                visible:
//                                    restaurantInfo.restaurantData.mode == "open"
//                                        ? false
//                                        : true,
//                                child: Column(
//                                  children: <Widget>[
//                                    Divider(
//                                      color: Colors.black45,
//                                    ),
//                                    SizedBox(
//                                      height: 3,
//                                    ),
//                                    ShopClosedWidget()
//                                  ],
//                                ),
//                              ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        );
//      },
//    );
//  }

}
