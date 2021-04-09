import 'package:flutter/material.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/SpalshScreenViewModel.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenViewModel splashScreenViewModel;

  @override
  void initState() {
    super.initState();
    initialSetup();
  }

  initialSetup() async {
    splashScreenViewModel =
        Provider.of<SplashScreenViewModel>(context, listen: false);
    await splashScreenViewModel
        .getDataFromCache(); // get cached data if already stored in cache.
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, deviceRegisterScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenViewModel>(builder:
        (BuildContext context, SplashScreenViewModel model, Widget child) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                  height: 250,
                ),
              ),
            ),
            // Visibility(
            //   visible: model.showProgress,
            //   child: Positioned(
            //     left: MediaQuery.of(context).size.width / 2.2,
            //     top: MediaQuery.of(context).size.height / 2.4,
            //     child: Container(
            //       color: Colors.transparent,
            //       child: Center(
            //           child: CircularProgressIndicator(
            //         backgroundColor: Colors.blueGrey,
            //       )),
            //       height: MediaQuery.of(context).size.height,
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
