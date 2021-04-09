import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:provider/provider.dart';

class MoreOptionsScreen extends StatefulWidget {
  @override
  _MoreOptionsScreenState createState() => _MoreOptionsScreenState();
}

class _MoreOptionsScreenState extends State<MoreOptionsScreen> {

  @override
  void initState() {
   Provider.of<IOTViewModel>(context, listen: false).listenPorts(context);// listen for signals from iot
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbf9f5),
        body: Column(
          children: [
            customAppBar(
                context: context,
                onBackClicked: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color(0xffffffff),
                menuOnClicked: () {
                  navigateToHome(context: context);
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(42.0, 0.0, 0.0, 0.0),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 60,
                          color: Colors.grey[200],
                          child: Image.asset("assets/images/color_options.png"),
                        ),
                      ),
                      verticalSizedBoxTwenty(),
                      optionsTitle("COLOR OPTIONS"),
                      verticalSizedBox(),
                      listOfOptionsTitle(),
                      verticalSizedBoxTwenty(),
                      verticalSizedBoxTwenty(),
                      verticalSizedBoxTwenty(),
                      optionsTitle("STYLE OPTIONS"),
                      verticalSizedBox(),
                      listOfOptionsTitle(),
                      verticalSizedBox(),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 40.0, 10.0),
                        child: Divider(color:Color(0xff555555), thickness: 1),
                      ),
                      verticalSizedBox(),
                      Text("Didn't find what you like ?",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff555555),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: 7.5),
                          ),
                          textAlign: TextAlign.left),
                      verticalSizedBox(),
                      Text("WE HAVE MORE !",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff555555),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                          ),
                          textAlign: TextAlign.left),
                      verticalSizedBox(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("EXPLORE\nTHE BRAND",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff555555),
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 40.0),
                                ),
                                textAlign: TextAlign.left),
                            // Rectangle 7
                            Container(
                                width: 83.5,
                                height: 83.5,
                              child: Icon(
                                      Icons.apps_rounded,
                                      size: 55,
                                      color: Colors.white,
                                    ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, 11),
                                          blurRadius: 24,
                                          spreadRadius: 0)
                                    ],
                                    color: const Color(0xffc64c55),),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align optionsTitle(String title) => Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ),
      );

  Container listOfOptionsTitle() => Container(
        height: 205,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 25.0, 0.0),
                child: Container(
                  width: 205,
                  height: 205,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "assets/images/sub2.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            }),
      );
}
