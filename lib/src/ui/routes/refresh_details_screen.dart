import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/api_data_models/main_categories_data_model.dart';
import 'package:inki/src/core/constants/api_urls.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/RefreshAnimationViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:inki/src/ui/res/colors.dart';
import 'package:provider/provider.dart';

class RefreshDetailsScreen extends StatefulWidget {
  final UsbPortModel isFromHome;

  RefreshDetailsScreen({this.isFromHome});

  @override
  _RefreshDetailsScreenState createState() => _RefreshDetailsScreenState();
}

class _RefreshDetailsScreenState extends State<RefreshDetailsScreen>
    with TickerProviderStateMixin {
  ConfettiController whiteControllerBottomCenter;
  ConfettiController yellowControllerBottomCenter;
  ConfettiController blueColorControllerBottomCenter;
  ConfettiController orangeColorControllerBottomCenter;

  //Color screenBackground = Color(0xffe7dfd4);

  List<Color> screenBackground = normalGradient;

  // double gravityValue = 1.0;
  // double particleDrag = 0.01;
  // double emissionFrequency = 0.01;
  // int numberOfParticles = 200;
  // double maxBlastForce = 200;
  // double minBlastForce = 80;
  // int secondsValue = 10;
  double gravityValue = 1.0; //1.0;
  double particleDrag = 0.001; //0.001; //0.01;
  double emissionFrequency = 0.01;
  int numberOfParticles = 1000; //200
  double maxBlastForce = 300; //200
  double minBlastForce = 30; //80
  int secondsValue = 3; //10
  AnimationController _scaleAnim;
  Animation<double> _animation;
  bool yellowAnim = false;
  bool whiteAnim = false;
  bool orangeAnim = false;
  bool blueAnim = false;

  void initState() {
    _scaleAnim = AnimationController(
      duration: const Duration(
        milliseconds: 2000,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: false);
    _animation = CurvedAnimation(
      parent: _scaleAnim,
      curve: Curves.bounceOut,
    );
    whiteControllerBottomCenter =
        ConfettiController(duration: Duration(milliseconds: 3));
    yellowControllerBottomCenter =
        ConfettiController(duration: Duration(milliseconds: 5));
    blueColorControllerBottomCenter =
        ConfettiController(duration: Duration(milliseconds: 7));
    orangeColorControllerBottomCenter =
        ConfettiController(duration: Duration(milliseconds: 9));

    _scaleAnim.forward();
    super.initState();
  }

  @override
  void dispose() {
    _scaleAnim.dispose();
    whiteControllerBottomCenter.dispose();
    yellowControllerBottomCenter.dispose();
    blueColorControllerBottomCenter.dispose();
    orangeColorControllerBottomCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<RefreshAnimationViewModel, IOTViewModel>(builder:
        (BuildContext context, RefreshAnimationViewModel model,
            IOTViewModel iotViewModel, Widget child) {
      return SafeArea(
        child: Scaffold(
          body: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Stack(
                children: <Widget>[
                  Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: screenBackground),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            customAppBar(
                                context: context,
                                backgroundColor: Color(0xffffffff),
                                onBackClicked: () {
                                  Navigator.pop(context);
                                },
                                menuOnClicked: () {
                                  navigateToHome(context: context);
                                }),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        verticalSizedBoxTwenty(),
                                        Wrap(
                                          children: [
                                            InkWell(
                                              onTap: orangeAnim == true ||
                                                      blueAnim == true ||
                                                      whiteAnim == true
                                                  ? null
                                                  : () async {
                                                      setState(() {
                                                        yellowAnim = true;
                                                        screenBackground =
                                                            yellowGradient;
                                                      });

                                                      Future.delayed(
                                                          Duration(seconds: 5),
                                                          () {
                                                        setState(() {
                                                          yellowAnim = false;
                                                          screenBackground =
                                                              normalGradient;
                                                        });
                                                      });
                                                      if (iotViewModel.port !=
                                                          null) {
                                                        await iotViewModel.port
                                                            .write(
                                                          Uint8List.fromList(
                                                              "a".codeUnits),
                                                        );
                                                      }
                                                    },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                        color: const Color(
                                                            0x29000000),
                                                        offset: Offset(0, 18),
                                                        blurRadius: 27,
                                                        spreadRadius: 0)
                                                  ]),
                                                  child: Image.asset(
                                                    "assets/images/lemon.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: orangeAnim == true ||
                                                      whiteAnim == true ||
                                                      yellowAnim == true
                                                  ? null
                                                  : () async {
                                                      setState(() {
                                                        blueAnim = true;
                                                        screenBackground =
                                                            blueGradient;
                                                      });

                                                      Future.delayed(
                                                          Duration(seconds: 5),
                                                          () {
                                                        setState(() {
                                                          blueAnim = false;
                                                          screenBackground =
                                                              normalGradient;
                                                        });
                                                      });

                                                      if (iotViewModel.port !=
                                                          null) {
                                                        await iotViewModel.port
                                                            .write(
                                                          Uint8List.fromList(
                                                              "c".codeUnits),
                                                        );
                                                      }
                                                    },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                        color: const Color(
                                                            0x29000000),
                                                        offset: Offset(0, 18),
                                                        blurRadius: 27,
                                                        spreadRadius: 0)
                                                  ]),
                                                  child: Image.asset(
                                                    "assets/images/water.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: blueAnim == true ||
                                                      whiteAnim == true ||
                                                      yellowAnim == true
                                                  ? null
                                                  : () async {
                                                      setState(() {
                                                        orangeAnim = true;
                                                        screenBackground =
                                                            orangeGradient;
                                                      });

                                                      Future.delayed(
                                                          Duration(seconds: 5),
                                                          () {
                                                        setState(() {
                                                          orangeAnim = false;
                                                          screenBackground =
                                                              normalGradient;
                                                        });
                                                      });
                                                      if (iotViewModel.port !=
                                                          null) {
                                                        await iotViewModel.port
                                                            .write(
                                                          Uint8List.fromList(
                                                              "b".codeUnits),
                                                        );
                                                      }
                                                    },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                        color: const Color(
                                                            0x29000000),
                                                        offset: Offset(0, 18),
                                                        blurRadius: 27,
                                                        spreadRadius: 0)
                                                  ]),
                                                  child: Image.asset(
                                                    "assets/images/orange.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: orangeAnim == true ||
                                                      blueAnim == true ||
                                                      yellowAnim == true
                                                  ? null
                                                  : () async {
                                                      setState(() {
                                                        whiteAnim = true;
                                                        screenBackground =
                                                            roseGradient;
                                                      });

                                                      Future.delayed(
                                                          Duration(seconds: 5),
                                                          () {
                                                        showLog("milliseconds");
                                                        setState(() {
                                                          whiteAnim = false;
                                                          screenBackground =
                                                              normalGradient;
                                                        });
                                                      });
                                                      if (iotViewModel.port !=
                                                          null) {
                                                        await iotViewModel.port
                                                            .write(
                                                          Uint8List.fromList(
                                                              "d".codeUnits),
                                                        );
                                                      }
                                                    },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                        color: const Color(
                                                            0x29000000),
                                                        offset: Offset(0, 18),
                                                        blurRadius: 27,
                                                        spreadRadius: 0)
                                                  ]),
                                                  child: Image.asset(
                                                    "assets/images/flower.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                            "REFRESH YOUR \n LAUNDRY LIKE IT'S \n NEW",
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color:
                                                      const Color(0xff303030),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 20.5),
                                            ),
                                            textAlign: TextAlign.center),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              width: 500,
                                              height: 500,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width: 301,
                                                      height: 301,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            // color:
                                                            //     Colors.green,
                                                            color: const Color(
                                                                    0xff707070)
                                                                .withOpacity(
                                                                    0.0),
                                                            width: 12),
                                                      ),
                                                      child: ScaleTransition(
                                                        scale: _animation,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: FittedBox(
                                                            child: Container(
                                                              width: 103,
                                                              height: 103,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                /* or
                                                                    BorderRadius.circular(50000<High Value>)
                                                                     */
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              child:
                                                                  ScaleTransition(
                                                                scale:
                                                                    _animation,
                                                                // child: SvgPicture.asset(
                                                                //   "assets/images/push.svg",
                                                                // ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          20,
                                                                      width:
                                                                          20, // ScreenUtil

                                                                      child: Image
                                                                          .asset(
                                                                        "assets/images/steam.png",
                                                                      ),
                                                                    ),
                                                                    verticalSizedBoxFive(),
                                                                    Text(
                                                                        "Pure Steam\nRefresh",
                                                                        style: GoogleFonts
                                                                            .roboto(
                                                                          textStyle: TextStyle(
                                                                              color: const Color(0xff58595b),
                                                                              fontWeight: FontWeight.w900,
                                                                              fontFamily: "PFAgoraSansPro",
                                                                              fontStyle: FontStyle.italic,
                                                                              fontSize: 10.5),
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center),
                                                                  ],
                                                                ),
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
                                            Positioned(
                                              right: 60,
                                              top: 120,
                                              child: ScaleTransition(
                                                scale: _animation,
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: ScaleTransition(
                                                    scale: _animation,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 20,
                                                          child: Image.asset(
                                                            "assets/images/odorfree.png",
                                                          ),
                                                        ),
                                                        verticalSizedBoxFive(),
                                                        // Ready-to-wear clothes in just 40 mins
                                                        // Pure Steam Refresh
                                                        Text(
                                                            "Odour-free\nclothes",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              textStyle: TextStyle(
                                                                  color: const Color(
                                                                      0xff58595b),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontFamily:
                                                                      "PFAgoraSansPro",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize:
                                                                      10.5),
                                                            ),
                                                            textAlign: TextAlign
                                                                .center),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 185,
                                              top: 50,
                                              child: ScaleTransition(
                                                scale: _animation,
                                                child: FittedBox(
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: ScaleTransition(
                                                      scale: _animation,
                                                      // child: SvgPicture.asset(
                                                      //   "assets/images/remove.svg",
                                                      // ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 25,
                                                              width: 25,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/Creasing.png",
                                                              ),
                                                            ),
                                                            // Ready-to-wear clothes in just 40 mins
                                                            // Pure Steam Refresh
                                                            verticalSizedBoxFive(),
                                                            Text(
                                                                "Remove\ncreasing",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xff58595b),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      fontFamily:
                                                                          "PFAgoraSansPro",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      fontSize:
                                                                          10.5),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 185,
                                              bottom: 50,
                                              child: ScaleTransition(
                                                scale: _animation,
                                                child: FittedBox(
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: ScaleTransition(
                                                      scale: _animation,
                                                      // child: SvgPicture.asset(
                                                      //   "assets/images/heart.svg",
                                                      // ),

                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 25,
                                                              width: 25,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/Allergies.png",
                                                              ),
                                                            ),
                                                            // Ready-to-wear clothes in just 40 mins
                                                            // Pure Steam Refresh
                                                            verticalSizedBoxFive(),
                                                            Text(
                                                                "Avoid any\ndust / germ allergies",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xff58595b),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      fontFamily:
                                                                          "PFAgoraSansPro",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      fontSize:
                                                                          10.5),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 60,
                                              top: 120,
                                              child: ScaleTransition(
                                                scale: _animation,
                                                child: FittedBox(
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: ScaleTransition(
                                                      scale: _animation,
                                                      // child: SvgPicture.asset(
                                                      //   "assets/images/germfree.svg",
                                                      // ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 20,
                                                              width: 20,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/germfree.png",
                                                              ),
                                                            ),
                                                            // Ready-to-wear clothes in just 40 mins
                                                            // Pure Steam Refresh
                                                            verticalSizedBoxFive(),
                                                            Text(
                                                                "99.99%\nGerm-free clothes",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xff58595b),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      fontFamily:
                                                                          "PFAgoraSansPro",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      fontSize:
                                                                          10.5),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 60,
                                              bottom: 120,
                                              child: ScaleTransition(
                                                scale: _animation,
                                                child: FittedBox(
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: ScaleTransition(
                                                      scale: _animation,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 20,
                                                              width: 20,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/Fragnance.png",
                                                              ),
                                                            ),
                                                            verticalSizedBoxFive(),
                                                            Text(
                                                                "Fragrant\nand hygienic\nclothes",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xff58595b),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      fontFamily:
                                                                          "PFAgoraSansPro",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      fontSize:
                                                                          10.5),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 60,
                                              bottom: 120,
                                              child: ScaleTransition(
                                                scale: _animation,
                                                child: FittedBox(
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: ScaleTransition(
                                                      scale: _animation,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 20,
                                                              width: 20,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/Ready2wear.png",
                                                              ),
                                                            ),
                                                            verticalSizedBoxFive(),
                                                            Text(
                                                                "Ready-to-wear clothes in just\n40 mins",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  textStyle: TextStyle(
                                                                      color: const Color(
                                                                          0xff58595b),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      fontFamily:
                                                                          "PFAgoraSansPro",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      fontSize:
                                                                          10.5),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, laundryMagicScreen);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(42.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xffc64c55),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Center(
                                                child: Text("KNOW MORE",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: const Color(
                                                              0xffffffff),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 20.5),
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: yellowAnim || blueAnim || orangeAnim || whiteAnim,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.2,
                        sigmaY: 0.2,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                        //   color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
