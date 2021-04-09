import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


Container customAppBar(
        {BuildContext context,
        Function menuOnClicked,
        Function onBackClicked,
        double elevation = 0.0,
        Color backgroundColor,
        bool isMain = false}) =>
    Container(
      height: 75,
      color: backgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children: [
              Visibility(
                visible: !isMain,
                child: InkWell(
                  onTap: () {
                    onBackClicked();
                  },
                  child: Center(
                    // child: Container(
                    //   height: 30,
                    //   width: 30,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       border: Border.all(
                    //         width: 2,
                    //         color: Colors.white,
                    //       ),
                    //       boxShadow: ,
                    //       borderRadius: BorderRadius.circular(5.0)),
                    //   child: Icon(
                    //     Icons.arrow_back,
                    //     color: Colors.black,
                    //     size: 15,
                    //   ),
                    // ),
                    child: Container(
                      width: 41,
                      height: 41,
                      child:
                          Icon(Icons.arrow_back, color: Colors.black, size: 22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 11),
                              blurRadius: 24,
                              spreadRadius: 0)
                        ],
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Visibility(
                visible: !isMain,
                child: InkWell(
                  onTap: () {
                    menuOnClicked();
                    // Navigator.pushNamed(context, refreshAnimationHome);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      // child: Container(
                      //   height: 30,
                      //   width: 30,
                      //   decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(5.0),
                      //   ),
                      //   child: Icon(
                      //     Icons.home_outlined,
                      //     color: Colors.white,
                      //     size: 20,
                      //   ),
                      // ),
                      child: // Rectangle 7
                          Container(
                        width: 41,
                        height: 41,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 11),
                                blurRadius: 24,
                                spreadRadius: 0)
                          ],
                          color: const Color(0xff777777),
                        ),
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                width: 82.5,
                height: 42,
                child: Image.asset("assets/images/logo.png"),
              ),
            ],
          ),
        ),
      ),
    );
