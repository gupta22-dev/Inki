import 'package:flutter/material.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:provider/provider.dart';

import '../res/colors.dart';

class LaundryMagicScreen extends StatefulWidget {
  @override
  _LaundryMagicScreenState createState() => _LaundryMagicScreenState();
}

class _LaundryMagicScreenState extends State<LaundryMagicScreen> {
  @override
  void initState() {
    Provider.of<IOTViewModel>(context, listen: false)
        .listenPorts(context); // listen for signals from iot
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, productsDetails,
            arguments: {"type": "vc"});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customAppBar(
                context: context,
                backgroundColor: scaffoldBackgroundColor,
                onBackClicked: () {
                  Navigator.pop(context);
                },
                menuOnClicked: () {
                  navigateToHome(context: context);
                }),
            verticalSizedBoxTwenty(),
            verticalSizedBoxTwenty(),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250,
                height: 30,
                child: Image.asset("assets/images/LAUNDRIMAGIC.png"),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                child: Container(
                  // width: 300,
                  // height: 400,
                  width: MediaQuery.of(context).size.width,
                  height: 450.5,
                  // width: 400,
                  // height: 500.5,
                  child: Center(
                    child: Image.asset(
                      "assets/images/silver_machine.png",
                      height: 450,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                child: Image.asset("assets/images/3in1.png"),
              ),
            ),
            // Text("3 IN 1",
            //     style: const TextStyle(
            //         color: const Color(0xff646568),
            //         fontWeight: FontWeight.w400,
            //         fontFamily: "PFAgoraSansPro",
            //         fontStyle: FontStyle.normal,
            //         fontSize: 33.5),
            //     textAlign: TextAlign.left),
            // verticalSizedBoxTwenty(),
            // Container(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "WASH",
            //         style: Theme.of(context).textTheme.headline4.copyWith(
            //               color: Colors.grey,
            //               fontSize: 25.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //       ),
            //       horizontalSizedBox(),
            //       Container(
            //         color: Colors.grey,
            //         height: 20,
            //         width: 2,
            //       ),
            //       horizontalSizedBox(),
            //       Text(
            //         "DRY",
            //         style: Theme.of(context).textTheme.headline4.copyWith(
            //               color: Colors.grey,
            //               fontSize: 25.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //       ),
            //       horizontalSizedBox(),
            //       Container(
            //         color: Colors.grey,
            //         height: 20,
            //         width: 2,
            //       ),
            //       horizontalSizedBox(),
            //       Text(
            //         "REFRESH",
            //         style: Theme.of(context).textTheme.headline4.copyWith(
            //               color: Colors.grey,
            //               fontSize: 25.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //       ),
            //     ],
            //   ),
            // ),
            // verticalSizedBox(),
          ],
        ),
      ),
    );
  }
}
