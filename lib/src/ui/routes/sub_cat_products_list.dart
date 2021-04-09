import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/constants/api_urls.dart';
import 'package:inki/src/core/constants/common_strings.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/SpalshScreenViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/networ_catch_image.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:inki/src/ui/res/colors.dart';
import 'package:provider/provider.dart';

import '../res/colors.dart';

class SubCategoriesProductListScreen extends StatefulWidget {
  final Map<String, dynamic> mapValue;

  SubCategoriesProductListScreen({
    this.mapValue,
  });

  @override
  _SubCategoriesProductListScreenState createState() =>
      _SubCategoriesProductListScreenState(
        mapValue: mapValue,
      );
}

class _SubCategoriesProductListScreenState
    extends State<SubCategoriesProductListScreen> {
  final Map<String, dynamic> mapValue;
  int parentIndex;
  int childIndex;

  _SubCategoriesProductListScreenState({this.mapValue});

  @override
  void initState() {
    parentIndex = mapValue[CommonStrings.parentIndex];
    childIndex = mapValue[CommonStrings.childIndex];

    Provider.of<IOTViewModel>(context, listen: false).listenPorts(context);// listen for signals from iot
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Consumer<SplashScreenViewModel>(
          builder: (BuildContext context, SplashScreenViewModel model,
              Widget child) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: scaffoldBackgroundColor,
                body: LayoutBuilder(
                  builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
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
                              Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      color: Colors.white70,
                                      height: 238,
                                      width: MediaQuery.of(context).size.width,
                                      child: model
                                                  .mainCategories[parentIndex]
                                                  .groupMasters[childIndex]
                                                  .imageBanner ==
                                              null
                                          ? loaderBeforeImage(
                                              height: 238,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              image: "assets/images/home.png",
                                              boxFit: BoxFit.fitHeight,
                                            )
                                          : networkImage(
                                              image: model
                                                  .mainCategories[parentIndex]
                                                  .groupMasters[childIndex]
                                                  .imageBanner,
                                              loaderImage: loaderBeforeImage(),
                                              boxFit: BoxFit.fitHeight,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 170,
                                    right: 0.0,
                                    left: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 42.0, vertical: 0.0),
                                      child: Container(
                                        height: 35,
                                        // width:
                                        //     MediaQuery.of(context).size.width / 1.3,
                                        decoration: BoxDecoration(color: red),
                                        child: Center(
                                          child: Text(
                                              model
                                                  .mainCategories[parentIndex]
                                                  .groupMasters[childIndex]
                                                  .group,
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 22.5,
                                                ),
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Home",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                  color: redAccent,
                                                  fontSize: 6.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            size: 10,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "${model.mainCategories[parentIndex].subCategory} ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                  color: redAccent,
                                                  fontSize: 6.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            size: 10,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "${model.mainCategories[parentIndex].groupMasters[childIndex].group}}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                  color: redAccent,
                                                  fontSize: 6.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        verticalSizedBox(),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 25.0, vertical: 8.0),
                                        //   child: Text(
                                        //     "${model.listOfSubCatData[childIndex].description}",
                                        //     style: Theme.of(context)
                                        //         .textTheme
                                        //         .bodyText1,
                                        //   ),
                                        // ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: model
                                              .mainCategories[parentIndex]
                                              .groupMasters[childIndex]
                                              .productMasters
                                              .length,
                                          // physics:
                                          //     NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 42.0,
                                                      vertical: 5.0),
                                              child: InkWell(
                                                onTap: () {
                                                  showLog(
                                                      "groupIdgroupId--${model.mainCategories[parentIndex].subCategoryId}");
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          productsDetails,
                                                          arguments: {
                                                        "groupId":
                                                            "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productId}"
                                                      });
                                                },
                                                child: Card(
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
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
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.5,
                                                                horizontal:
                                                                    10.0),
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
                                                                              parentIndex]
                                                                          .groupMasters[
                                                                              childIndex]
                                                                          .productMasters[
                                                                              index]
                                                                          .productMainImage ==
                                                                      null
                                                                  ? loaderBeforeImage(
                                                                      image:
                                                                          "assets/images/home.png",
                                                                      width:
                                                                          162.5,
                                                                      height:
                                                                          135,
                                                                    )
                                                                  : networkImage(
                                                                      image: model
                                                                          .mainCategories[
                                                                              parentIndex]
                                                                          .groupMasters[
                                                                              childIndex]
                                                                          .productMasters[
                                                                              index]
                                                                          .productMainImage[0],
                                                                      loaderImage:
                                                                          loaderBeforeImage(),
                                                                      width:
                                                                          162.5,
                                                                      height:
                                                                          135,
                                                                    ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  verticalSizedBoxFive(),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productName,
                                                                              style: GoogleFonts.lato(
                                                                                textStyle: TextStyle(color: const Color(0xff3c3f42), fontWeight: FontWeight.w700, fontFamily: "Lato", fontStyle: FontStyle.normal, fontSize: 22.5),
                                                                              ),
                                                                            ),
                                                                            verticalSizedBoxFive(),
                                                                            Visibility(
                                                                              visible: false,
                                                                              child: Text(
                                                                                "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].modelName}",
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: GoogleFonts.lato(
                                                                                  textStyle: TextStyle(color: const Color(0xff3c3f42), fontWeight: FontWeight.w700, fontFamily: "Lato", fontStyle: FontStyle.normal, fontSize: 22.5),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/Compare_button.png",
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                      ),
                                                                      // Icon(
                                                                      //   Icons
                                                                      //       .terrain_outlined,
                                                                      //   color: Colors
                                                                      //       .grey,
                                                                      // )
                                                                    ],
                                                                  ),
                                                                  verticalSizedBoxFive(),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "1200 RPM",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts
                                                                            .lato(
                                                                          textStyle: TextStyle(
                                                                              color: const Color(0xff3c3f42),
                                                                              fontWeight: FontWeight.w300,
                                                                              fontFamily: "Lato",
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 15.0),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "7kg",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts
                                                                            .lato(
                                                                          textStyle: TextStyle(
                                                                              color: const Color(0xff3c3f42),
                                                                              fontWeight: FontWeight.w300,
                                                                              fontFamily: "Lato",
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 15.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  verticalSizedBox(),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].price}",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: GoogleFonts.roboto(
                                                                                textStyle: TextStyle(
                                                                                  color: const Color(0xff3c3f42),
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontFamily: "Roboto",
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontSize: 12.0,
                                                                                  decoration: TextDecoration.lineThrough,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          horizontalSizedBoxFive(),
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              color: red,
                                                                              height: 15,
                                                                              width: 28,
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].discountPercent}%",
                                                                                  style: GoogleFonts.roboto(
                                                                                    textStyle: TextStyle(
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w400,
                                                                                      fontFamily: "Roboto",
                                                                                      fontStyle: FontStyle.normal,
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      verticalSizedBoxFive(),
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              height: 20,
                                                                              child: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages != null && model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages.length > 0
                                                                                  ? Row(
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Container(
                                                                                          child: networkImage(
                                                                                            image: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages[0],
                                                                                            loaderImage: loaderBeforeImage(),
                                                                                            boxFit: BoxFit.fitWidth,
                                                                                            height: 15,
                                                                                            width: 15,
                                                                                          ),
                                                                                        ),
                                                                                        horizontalSizedBox(),
                                                                                        Container(
                                                                                          child: networkImage(
                                                                                            image: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages[0],
                                                                                            loaderImage: loaderBeforeImage(),
                                                                                            boxFit: BoxFit.fitWidth,
                                                                                            height: 15,
                                                                                            width: 15,
                                                                                          ),
                                                                                        ),
                                                                                        horizontalSizedBox(),
                                                                                        Container(
                                                                                          child: networkImage(
                                                                                            image: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages[0],
                                                                                            loaderImage: loaderBeforeImage(),
                                                                                            boxFit: BoxFit.fitWidth,
                                                                                            height: 15,
                                                                                            width: 15,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    )
                                                                                  : Row(
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Container(
                                                                                            child: Image.asset("assets/images/fea4.png"),
                                                                                            height: 15,
                                                                                            width: 15,
                                                                                          ),
                                                                                        ),
                                                                                        horizontalSizedBox(),
                                                                                        Flexible(
                                                                                          child: Container(
                                                                                            child: Image.asset("assets/images/fea5.png"),
                                                                                            height: 15,
                                                                                            width: 15,
                                                                                          ),
                                                                                        ),
                                                                                        horizontalSizedBox(),
                                                                                        Flexible(
                                                                                          child: Container(
                                                                                            child: Image.asset("assets/images/fea1.png"),
                                                                                            height: 15,
                                                                                            width: 15,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                              color: lightGrey.withOpacity(0.8),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              "\u20B9 ${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].price}",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: GoogleFonts.roboto(
                                                                                textStyle: TextStyle(color: const Color(0xff424242), fontWeight: FontWeight.w700, fontFamily: "Roboto", fontStyle: FontStyle.normal, fontSize: 21.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
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
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 55,
                            decoration:
                                BoxDecoration(color: scaffoldBackgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Filter",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(
                                          fontSize: 15,
                                          color: filterColor,
                                        ),
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 25,
                                    width: 0.5,
                                  ),
                                  Text(
                                    "Sort",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(
                                          fontSize: 15,
                                          color: filterColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
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
                //         floating: true,
                //         automaticallyImplyLeading: false,
                //         pinned: false,
                //         flexibleSpace: FlexibleSpaceBar(
                //           background: Stack(
                //             children: [
                //               Center(
                //                 child: Hero(
                //                   tag: "${CommonStrings.imageTag}$childIndex",
                //                   child: Container(
                //                     color: Colors.white70,
                //                     width: MediaQuery.of(context).size.width,
                //                     child: loaderBeforeImage(
                //                       height:
                //                           MediaQuery.of(context).size.height / 2,
                //                       width: MediaQuery.of(context).size.width,
                //                       image: "assets/images/home.png",
                //                       boxFit: BoxFit.contain,
                //                     ),
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
                //                   height: 35,
                //                   width: MediaQuery.of(context).size.width / 1.2,
                //                   decoration: BoxDecoration(color: red),
                //                   child: Center(
                //                     child: Text(
                //                         model.mainCategories[parentIndex]
                //                             .groupMasters[childIndex].group,
                //                         style: GoogleFonts.roboto(
                //                           textStyle: TextStyle(
                //                             color: const Color(0xffffffff),
                //                             fontWeight: FontWeight.w500,
                //                             fontFamily: "Roboto",
                //                             fontStyle: FontStyle.normal,
                //                             fontSize: 22.5,
                //                           ),
                //                         ),
                //                         textAlign: TextAlign.center),
                //                   ),
                //                 ),
                //               ),
                //               Align(
                //                 alignment: Alignment.topLeft,
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(10.0),
                //                   child: Row(
                //                     children: [
                //                       Text(
                //                         "Home",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .headline4
                //                             .copyWith(
                //                               color: redAccent,
                //                               fontSize: 6.0,
                //                               fontWeight: FontWeight.w500,
                //                             ),
                //                       ),
                //                       Icon(
                //                         Icons.arrow_right,
                //                         size: 10,
                //                         color: Colors.grey,
                //                       ),
                //                       Text(
                //                         "${model.mainCategories[parentIndex].subCategory} ",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .headline4
                //                             .copyWith(
                //                               color: redAccent,
                //                               fontSize: 6.0,
                //                               fontWeight: FontWeight.w500,
                //                             ),
                //                       ),
                //                       Icon(
                //                         Icons.arrow_right,
                //                         size: 10,
                //                         color: Colors.grey,
                //                       ),
                //                       Text(
                //                         "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters}}",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .headline4
                //                             .copyWith(
                //                               color: redAccent,
                //                               fontSize: 6.0,
                //                               fontWeight: FontWeight.w500,
                //                             ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ];
                //   },
                //   body: LayoutBuilder(
                //     builder: (BuildContext context,
                //         BoxConstraints viewportConstraints) {
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
                //                         tag: "${CommonStrings.imageTag}$childIndex",
                //                         child: Container(
                //                           color: Colors.white70,
                //                           width: MediaQuery.of(context).size.width,
                //                           child: loaderBeforeImage(
                //                             height:
                //                             MediaQuery.of(context).size.height / 2,
                //                             width: MediaQuery.of(context).size.width,
                //                             image: "assets/images/home.png",
                //                             boxFit: BoxFit.contain,
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
                //                         height: 35,
                //                         width: MediaQuery.of(context).size.width / 1.2,
                //                         decoration: BoxDecoration(color: red),
                //                         child: Center(
                //                           child: Text(
                //                               model.mainCategories[parentIndex]
                //                                   .groupMasters[childIndex].group,
                //                               style: GoogleFonts.roboto(
                //                                 textStyle: TextStyle(
                //                                   color: const Color(0xffffffff),
                //                                   fontWeight: FontWeight.w500,
                //                                   fontFamily: "Roboto",
                //                                   fontStyle: FontStyle.normal,
                //                                   fontSize: 22.5,
                //                                 ),
                //                               ),
                //                               textAlign: TextAlign.center),
                //                         ),
                //                       ),
                //                     ),
                //                     Align(
                //                       alignment: Alignment.topLeft,
                //                       child: Padding(
                //                         padding: const EdgeInsets.all(10.0),
                //                         child: Row(
                //                           children: [
                //                             Text(
                //                               "Home",
                //                               style: Theme.of(context)
                //                                   .textTheme
                //                                   .headline4
                //                                   .copyWith(
                //                                 color: redAccent,
                //                                 fontSize: 6.0,
                //                                 fontWeight: FontWeight.w500,
                //                               ),
                //                             ),
                //                             Icon(
                //                               Icons.arrow_right,
                //                               size: 10,
                //                               color: Colors.grey,
                //                             ),
                //                             Text(
                //                               "${model.mainCategories[parentIndex].subCategory} ",
                //                               style: Theme.of(context)
                //                                   .textTheme
                //                                   .headline4
                //                                   .copyWith(
                //                                 color: redAccent,
                //                                 fontSize: 6.0,
                //                                 fontWeight: FontWeight.w500,
                //                               ),
                //                             ),
                //                             Icon(
                //                               Icons.arrow_right,
                //                               size: 10,
                //                               color: Colors.grey,
                //                             ),
                //                             Text(
                //                               "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters}}",
                //                               style: Theme.of(context)
                //                                   .textTheme
                //                                   .headline4
                //                                   .copyWith(
                //                                 color: redAccent,
                //                                 fontSize: 6.0,
                //                                 fontWeight: FontWeight.w500,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //                 Expanded(
                //                   child: SingleChildScrollView(
                //                     child: Container(
                //                       child: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         mainAxisSize: MainAxisSize.min,
                //                         children: <Widget>[
                //                           verticalSizedBox(),
                //                           // Padding(
                //                           //   padding: const EdgeInsets.symmetric(
                //                           //       horizontal: 25.0, vertical: 8.0),
                //                           //   child: Text(
                //                           //     "${model.listOfSubCatData[childIndex].description}",
                //                           //     style: Theme.of(context)
                //                           //         .textTheme
                //                           //         .bodyText1,
                //                           //   ),
                //                           // ),
                //                           ListView.builder(
                //                             shrinkWrap: true,
                //                             itemCount: model
                //                                 .mainCategories[parentIndex]
                //                                 .groupMasters[childIndex]
                //                                 .productMasters
                //                                 .length,
                //                             physics:
                //                                 NeverScrollableScrollPhysics(),
                //                             itemBuilder: (BuildContext context,
                //                                 int index) {
                //                               return Padding(
                //                                 padding:
                //                                     const EdgeInsets.symmetric(
                //                                         horizontal: 20.0,
                //                                         vertical: 5.0),
                //                                 child: InkWell(
                //                                   onTap: () {
                //                                     Navigator.of(context)
                //                                         .pushNamed(
                //                                       productsDetails,arguments:  model
                //                                         .mainCategories[parentIndex]
                //                                         .groupMasters[childIndex]
                //                                         .productMasters[index].groupId
                //                                     );
                //                                   },
                //                                   child: Card(
                //                                     elevation: 3,
                //                                     shape: RoundedRectangleBorder(
                //                                       borderRadius:
                //                                           BorderRadius.circular(
                //                                               10),
                //                                     ),
                //                                     child: Padding(
                //                                       padding:
                //                                           const EdgeInsets.all(
                //                                               10.0),
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
                //                                               MainAxisAlignment
                //                                                   .start,
                //                                           crossAxisAlignment:
                //                                               CrossAxisAlignment
                //                                                   .start,
                //                                           children: <Widget>[
                //                                             ClipRRect(
                //                                               borderRadius:
                //                                                   BorderRadius
                //                                                       .circular(
                //                                                           10.0),
                //                                               child: Hero(
                //                                                 tag: "${index}",
                //                                                 child: model
                //                                                             .mainCategories[
                //                                                                 parentIndex]
                //                                                             .groupMasters[
                //                                                                 childIndex]
                //                                                             .productMasters[
                //                                                                 index]
                //                                                             .productMainImage[0] ==
                //                                                         null
                //                                                     ? loaderBeforeImage(
                //                                                         image:
                //                                                             "assets/images/home.png",
                //                                                         width:
                //                                                             165,
                //                                                         height:
                //                                                             135,
                //                                                       )
                //                                                     : networkImage(
                //                                                         image: model
                //                                                             .mainCategories[
                //                                                                 parentIndex]
                //                                                             .groupMasters[
                //                                                                 childIndex]
                //                                                             .productMasters[
                //                                                                 index]
                //                                                             .productMainImage[0],
                //                                                         loaderImage:
                //                                                             loaderBeforeImage(),
                //                                                         height:
                //                                                             165,
                //                                                         width:
                //                                                             135,
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
                //                                                 children: <
                //                                                     Widget>[
                //                                                   verticalSizedBoxFive(),
                //                                                   Row(
                //                                                     crossAxisAlignment:
                //                                                         CrossAxisAlignment
                //                                                             .start,
                //                                                     mainAxisAlignment:
                //                                                         MainAxisAlignment
                //                                                             .spaceBetween,
                //                                                     children: [
                //                                                       Column(
                //                                                         crossAxisAlignment:
                //                                                             CrossAxisAlignment
                //                                                                 .start,
                //                                                         children: [
                //                                                           Text(
                //                                                             model
                //                                                                 .mainCategories[parentIndex]
                //                                                                 .groupMasters[childIndex]
                //                                                                 .productMasters[index]
                //                                                                 .productName,
                //                                                             overflow:
                //                                                                 TextOverflow.ellipsis,
                //                                                             style:
                //                                                                 GoogleFonts.roboto(
                //                                                               textStyle:
                //                                                                   TextStyle(
                //                                                                 color: lightGreyTwo,
                //                                                                 fontWeight: FontWeight.bold,
                //                                                                 fontSize: 23,
                //                                                               ),
                //                                                             ),
                //                                                           ),
                //                                                           verticalSizedBoxFive(),
                //                                                           Visibility(
                //                                                             visible:
                //                                                                 false,
                //                                                             child:
                //                                                                 Text(
                //                                                               "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].modelName}",
                //                                                               overflow:
                //                                                                   TextOverflow.ellipsis,
                //                                                               style:
                //                                                                   GoogleFonts.roboto(
                //                                                                 textStyle: TextStyle(
                //                                                                   color: lightBlack,
                //                                                                   fontWeight: FontWeight.w600,
                //                                                                   fontSize: 15,
                //                                                                 ),
                //                                                               ),
                //                                                             ),
                //                                                           ),
                //                                                         ],
                //                                                       ),
                //                                                       Icon(
                //                                                         Icons
                //                                                             .terrain_outlined,
                //                                                         color: Colors
                //                                                             .grey,
                //                                                       )
                //                                                     ],
                //                                                   ),
                //                                                   verticalSizedBoxFive(),
                //                                                   Column(
                //                                                     crossAxisAlignment:
                //                                                         CrossAxisAlignment
                //                                                             .start,
                //                                                     children: [
                //                                                       Text(
                //                                                         "1200",
                //                                                         overflow:
                //                                                             TextOverflow
                //                                                                 .ellipsis,
                //                                                         style: GoogleFonts
                //                                                             .lato(
                //                                                           textStyle:
                //                                                               TextStyle(
                //                                                             color:
                //                                                                 lightBlack,
                //                                                             fontStyle:
                //                                                                 FontStyle.normal,
                //                                                             fontSize:
                //                                                                 15,
                //                                                           ),
                //                                                         ),
                //                                                       ),
                //                                                       Text(
                //                                                         "7kg",
                //                                                         overflow:
                //                                                             TextOverflow
                //                                                                 .ellipsis,
                //                                                         style: GoogleFonts
                //                                                             .lato(
                //                                                           textStyle:
                //                                                               TextStyle(
                //                                                             color:
                //                                                                 lightBlack,
                //                                                             fontStyle:
                //                                                                 FontStyle.normal,
                //                                                             fontSize:
                //                                                                 15,
                //                                                           ),
                //                                                         ),
                //                                                       ),
                //                                                     ],
                //                                                   ),
                //                                                   verticalSizedBox(),
                //                                                   Column(
                //                                                     children: [
                //                                                       Row(
                //                                                         crossAxisAlignment:
                //                                                             CrossAxisAlignment
                //                                                                 .end,
                //                                                         mainAxisAlignment:
                //                                                             MainAxisAlignment
                //                                                                 .end,
                //                                                         children: [
                //                                                           Flexible(
                //                                                             child:
                //                                                                 Text(
                //                                                               "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].price}",
                //                                                               overflow:
                //                                                                   TextOverflow.ellipsis,
                //                                                               style: Theme.of(context).textTheme.bodyText2.copyWith(
                //                                                                     fontSize: 12.0,
                //                                                                     color: lightBlack,
                //                                                                     decoration: TextDecoration.lineThrough,
                //                                                                     fontWeight: FontWeight.w300,
                //                                                                   ),
                //                                                             ),
                //                                                           ),
                //                                                           horizontalSizedBoxFive(),
                //                                                           Flexible(
                //                                                             child:
                //                                                                 Container(
                //                                                               color:
                //                                                                   red,
                //                                                               height:
                //                                                                   15,
                //                                                               width:
                //                                                                   27,
                //                                                               child:
                //                                                                   Center(
                //                                                                 child: Text(
                //                                                                   "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].discountPercent}%",
                //                                                                   style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.w700),
                //                                                                 ),
                //                                                               ),
                //                                                             ),
                //                                                           )
                //                                                         ],
                //                                                       ),
                //                                                       verticalSizedBoxFive(),
                //                                                       Row(
                //                                                         crossAxisAlignment:
                //                                                             CrossAxisAlignment
                //                                                                 .center,
                //                                                         mainAxisAlignment:
                //                                                             MainAxisAlignment
                //                                                                 .spaceBetween,
                //                                                         children: [
                //                                                           Container(
                //                                                             child: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages != null && model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages.length > 0
                //                                                                 ? Row(
                //                                                                     crossAxisAlignment: CrossAxisAlignment.start,
                //                                                                     mainAxisAlignment: MainAxisAlignment.start,
                //                                                                     children: [
                //                                                                       Container(
                //                                                                         child: networkImage(
                //                                                                           image: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages[0],
                //                                                                           loaderImage: loaderBeforeImage(),
                //                                                                           boxFit: BoxFit.fitWidth,
                //                                                                           height: 20,
                //                                                                           width: 20,
                //                                                                         ),
                //                                                                       ),
                //                                                                       horizontalSizedBoxFive(),
                //                                                                       Container(
                //                                                                         child: networkImage(
                //                                                                           image: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages[0],
                //                                                                           loaderImage: loaderBeforeImage(),
                //                                                                           boxFit: BoxFit.fitWidth,
                //                                                                           height: 20,
                //                                                                           width: 20,
                //                                                                         ),
                //                                                                       ),
                //                                                                       horizontalSizedBoxFive(),
                //                                                                       Container(
                //                                                                         child: networkImage(
                //                                                                           image: model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].productImages[0],
                //                                                                           loaderImage: loaderBeforeImage(),
                //                                                                           boxFit: BoxFit.fitWidth,
                //                                                                           height: 20,
                //                                                                           width: 20,
                //                                                                         ),
                //                                                                       ),
                //                                                                     ],
                //                                                                   )
                //                                                                 : Row(
                //                                                                     crossAxisAlignment: CrossAxisAlignment.start,
                //                                                                     mainAxisAlignment: MainAxisAlignment.start,
                //                                                                     children: [
                //                                                                       Container(
                //                                                                         child: Image.asset("assets/images/sub_pro1.png"),
                //                                                                         height: 20,
                //                                                                         width: 20,
                //                                                                       ),
                //                                                                       horizontalSizedBoxFive(),
                //                                                                       Container(
                //                                                                         child: Image.asset("assets/images/sub_pro1.png"),
                //                                                                         height: 20,
                //                                                                         width: 20,
                //                                                                       ),
                //                                                                       horizontalSizedBoxFive(),
                //                                                                       Container(
                //                                                                         child: Image.asset("assets/images/sub_pro1.png"),
                //                                                                         height: 20,
                //                                                                         width: 20,
                //                                                                       ),
                //                                                                     ],
                //                                                                   ),
                //                                                             color:
                //                                                                 lightGrey.withOpacity(0.8),
                //                                                           ),
                //                                                           Text(
                //                                                             "${model.mainCategories[parentIndex].groupMasters[childIndex].productMasters[index].price}",
                //                                                             overflow:
                //                                                                 TextOverflow.ellipsis,
                //                                                             style: Theme.of(context)
                //                                                                 .textTheme
                //                                                                 .headline2
                //                                                                 .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                //                                                           ),
                //                                                         ],
                //                                                       ),
                //                                                     ],
                //                                                   )
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
                //           Align(
                //             alignment: Alignment.bottomCenter,
                //             child: Container(
                //               height: 55,
                //               decoration: BoxDecoration(color: Colors.white),
                //               child: Padding(
                //                 padding: const EdgeInsets.symmetric(vertical: 10),
                //                 child: Row(
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceEvenly,
                //                   children: [
                //                     Text(
                //                       "Filter",
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .headline3
                //                           .copyWith(
                //                             fontSize: 15,
                //                             color: filterColor,
                //                           ),
                //                     ),
                //                     Container(
                //                       color: Colors.grey,
                //                       height: 25,
                //                       width: 0.5,
                //                     ),
                //                     Text(
                //                       "Sort",
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .headline3
                //                           .copyWith(
                //                             fontSize: 15,
                //                             color: filterColor,
                //                           ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           )
                //         ],
                //       );
                //     },
                //   ),
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}
