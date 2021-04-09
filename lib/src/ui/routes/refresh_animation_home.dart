import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/api_data_models/main_categories_data_model.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/RefreshAnimationViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:inki/src/ui/res/colors.dart';
import 'package:inki/src/ui/routes/fragrance_rippling.dart';
import 'package:provider/provider.dart';

import '../res/colors.dart';
import '../res/colors.dart';
import '../res/colors.dart';

class RefreshAnimationHome extends StatefulWidget {
  final UsbPortModel isFromHome;

  RefreshAnimationHome({this.isFromHome});

  @override
  _RefreshAnimationHomeState createState() => _RefreshAnimationHomeState();
}

class _RefreshAnimationHomeState extends State<RefreshAnimationHome>
    with SingleTickerProviderStateMixin {
  List<Color> screenBackground = normalGradient;
  int refreshSeconds = 10;

  bool isClicked = false;

  double gravityValue = 1.0; //1.0;
  double particleDrag = 0.001; //0.001; //0.01;
  double emissionFrequency = 0.01;
  int numberOfParticles = 1000; //200
  double maxBlastForce = 300; //200
  double minBlastForce = 30; //80
  bool yellowAnim = false;
  bool whiteAnim = false;
  bool orangeAnim = false;
  bool blueAnim = false;
  AnimationController _controller;

  List<Color> animParticleColor = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: screenBackground),
                      ),
                      duration: Duration(seconds: 1),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            customAppBar(
                                context: context,
                                backgroundColor: Color(0xffffffff),
                                onBackClicked: () {
                                  // Navigator.pop(context);
                                  navigateToHome(context: context);
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
                                        SizedBox(
                                          height: 60,
                                        ),
                                        Container(
                                          child: Center(
                                            child: // Liked it !
                                                Text("LIKED IT !",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: const Color(
                                                              0xff303030),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 30.0),
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                          ),
                                        ),
                                        verticalSizedBox(),
                                        Container(
                                          child: Center(
                                            child: // Let's try some more  fragrance options
                                                Text(
                                                    "Let's try some more \n fragrance options ",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: const Color(
                                                              0xff303030),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 20.0),
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                          ),
                                        ),
                                        verticalSizedBox(),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 150,
                                              child: Stack(
                                                //fit: StackFit.passthrough,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 0),
                                                      width: 130,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: (isClicked ==
                                                                      true)
                                                                  ? Color(
                                                                      0xfffce400)
                                                                  : Color(
                                                                      0x29000000),
                                                              offset:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? Offset(
                                                                          0, 0)
                                                                      : Offset(
                                                                          0,
                                                                          18),
                                                              /* (condition<t/f>) ? {true statements} : {false statements} */
                                                              blurRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 100
                                                                      : 27,
                                                              spreadRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 350
                                                                      : 0)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          500,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/lemon.png",
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    onTap: orangeAnim == true ||
                                                            blueAnim == true ||
                                                            whiteAnim == true
                                                        ? null
                                                        : () {
                                                            setState(() {
                                                              yellowAnim = true;
                                                              //screenBackground = yellow;
                                                              screenBackground =
                                                                  yellowGradient;
                                                              isClicked = false;
                                                              Timer(
                                                                  Duration(
                                                                      seconds:
                                                                          3),
                                                                  () {
                                                                setState(() {
                                                                  screenBackground =
                                                                      normalGradient;
                                                                  isClicked =
                                                                      false;
                                                                });
                                                              });

                                                              // set timer of 3secs...set is clicked back to false//
                                                            });

                                                            /* navigateToDetailAnimation(
                                                                "a",
                                                                iotViewModel); */
                                                          },
                                                    child: FragnanceRipple(
                                                      color: yellowColor[0],
                                                      fun: () =>
                                                          navigateToDetailAnimation(
                                                              "a",
                                                              iotViewModel),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //horizontalSizedBoxTwenty(),
                                            Container(
                                              width: 150,
                                              height: 150,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 0),
                                                      width: 130,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: (isClicked ==
                                                                      true)
                                                                  ? Color(
                                                                      0xfff59006)
                                                                  : Color(
                                                                      0x29000000),
                                                              offset:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? Offset(
                                                                          0, 0)
                                                                      : Offset(
                                                                          0,
                                                                          18),
                                                              /* (condition<t/f>) ? {true statements} : {false statements} */
                                                              blurRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 100
                                                                      : 27,
                                                              spreadRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 350
                                                                      : 0)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          500,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/orange.png",
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: yellowAnim == true ||
                                                            blueAnim == true ||
                                                            whiteAnim == true
                                                        ? null
                                                        : () {
                                                            setState(() {
                                                              orangeAnim = true;
                                                              //screenBackground = white;
                                                              screenBackground =
                                                                  orangeGradient;
                                                              isClicked = false;
                                                              Timer(
                                                                  Duration(
                                                                      seconds:
                                                                          3),
                                                                  () {
                                                                setState(() {
                                                                  screenBackground =
                                                                      normalGradient;
                                                                  isClicked =
                                                                      false;
                                                                });
                                                              });
                                                              // Set a timer of 3 secs..... set isClicked back to false
                                                            });
                                                          },
                                                    child: FragnanceRipple(
                                                      color: orangeColor[0],
                                                      fun: () =>
                                                          navigateToDetailAnimation(
                                                              "b",
                                                              iotViewModel),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 150,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 0),
                                                      width: 130,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: (isClicked ==
                                                                      true)
                                                                  ? Color(
                                                                      0xff65CBE3)
                                                                  : Color(
                                                                      0x29000000),
                                                              offset:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? Offset(
                                                                          0, 0)
                                                                      : Offset(
                                                                          0,
                                                                          18),
                                                              /* (condition<t/f>) ? {true statements} : {false statements} */
                                                              blurRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 100
                                                                      : 27,
                                                              spreadRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 350
                                                                      : 0)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          500,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/water.png",
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: yellowAnim == true ||
                                                            whiteAnim == true ||
                                                            orangeAnim == true
                                                        ? null
                                                        : () {
                                                            setState(() {
                                                              blueAnim = true;
                                                              // screenBackground = blue;
                                                              screenBackground =
                                                                  blueGradient;
                                                              isClicked = false;
                                                              Timer(
                                                                  Duration(
                                                                      seconds:
                                                                          3),
                                                                  () {
                                                                setState(() {
                                                                  screenBackground =
                                                                      normalGradient;
                                                                  isClicked =
                                                                      false;
                                                                });
                                                              });
                                                              // Set a timer of 3 secs..... set isClicked back to false
                                                            });
                                                          },
                                                    child: FragnanceRipple(
                                                      color: blueColor[0],
                                                      fun: () =>
                                                          navigateToDetailAnimation(
                                                              "c",
                                                              iotViewModel),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              height: 150,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 0),
                                                      width: 130,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: (isClicked ==
                                                                      true)
                                                                  ? Color(
                                                                      0xffFFBBBB)
                                                                  : Color(
                                                                      0x29000000),
                                                              offset:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? Offset(
                                                                          0, 0)
                                                                      : Offset(
                                                                          0,
                                                                          18),

                                                              /* (condition<t/f>) ? {true statements} : {false statements} */
                                                              blurRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 100
                                                                      : 27,
                                                              spreadRadius:
                                                                  (isClicked ==
                                                                          true)
                                                                      ? 350
                                                                      : 0)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          500,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/flower.png",
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: yellowAnim == true ||
                                                            blueAnim == true ||
                                                            orangeAnim == true
                                                        ? null
                                                        : () {
                                                            setState(() {
                                                              whiteAnim = true;
                                                              //screenBackground = orange;
                                                              screenBackground =
                                                                  roseGradient;
                                                              isClicked = false;
                                                              Timer(
                                                                  Duration(
                                                                      seconds:
                                                                          3),
                                                                  () {
                                                                setState(() {
                                                                  screenBackground =
                                                                      normalGradient;
                                                                  isClicked =
                                                                      false;
                                                                });
                                                              });
                                                              //set timer of 3 secs
                                                              // 5 Mins
                                                            });
                                                          },
                                                    child: FragnanceRipple(
                                                      color: roseGradient[2],
                                                      fun: () =>
                                                          navigateToDetailAnimation(
                                                              "d",
                                                              iotViewModel),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        verticalSizedBoxTwenty(),
                                        Wrap(
                                          children: [
                                            verticalSizedBoxTwenty(),
                                            // Not just FRAGNANCE FRESH
                                            Center(
                                              child: Text(
                                                  "Not just FRAGNANCE FRESH",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: const Color(
                                                            0xff303030),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: "Roboto",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 18.0),
                                                  ),
                                                  textAlign: TextAlign.center),
                                            ),
                                            verticalSizedBoxTwenty(),
                                            Center(
                                              child: // but now get  your laundry
                                                  Text(
                                                      "but now get your \n laundry",
                                                      style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                            color: const Color(
                                                                0xff959595),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 30.0),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
                                            ),
                                            verticalSizedBox(),
                                            Center(
                                              child: // refreshed
                                                  Text("refreshed",
                                                      style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                            color: const Color(
                                                                0xff171717),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 53.5),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
                                            ),
                                            verticalSizedBox(),
                                            Center(
                                              child: // with steam !
                                                  Text("with steam !",
                                                      style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                            color: const Color(
                                                                0xff959595),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 30.0),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
                                            ),
                                            verticalSizedBoxTwenty(),
                                          ],
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
                    // to avoid click on other fragrance while animations happens
                    visible: yellowAnim || blueAnim || orangeAnim || whiteAnim,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.2,
                        sigmaY: 0.2,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
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

  showNormalBackgroundColor() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        screenBackground = normalGradient;
      });
    });
  }

  navigateToDetailAnimation(String data, IOTViewModel iotViewModel) async {
    showNormalBackgroundColor();

    Future.delayed(
      Duration(seconds: 1),
      () {
        setState(() {
          yellowAnim = false;
          whiteAnim = false;
          blueAnim = false;
          orangeAnim = false;
        });
        Navigator.pushNamed(context, refreshAnimationDetailsHome,
                arguments: UsbPortModel(
                    isFromHome: widget.isFromHome == null
                        ? false
                        : widget.isFromHome.isFromHome ?? false,
                    portValue: widget.isFromHome == null
                        ? null
                        : widget.isFromHome.portValue))
            .then((value) => {});
      },
    );

    if (iotViewModel.port != null) {
      await iotViewModel.port.write(Uint8List.fromList(data.codeUnits));
    }
  }

  InkWell imageContainer(
          String image,
          ConfettiController controller,
          RefreshAnimationViewModel refreshAnimationViewModel,
          Fragnance fragnance) =>
      InkWell(
        onTap: () {
          controller.play();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 130,
            height: 130,
            child: Image.asset(image),
          ),
        ),
      );
}
