import 'package:flutter/material.dart';
import 'package:inki/src/core/provider_view_models/all/SpalshScreenViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/utils/network_aware/connectivity_service.dart';
import 'package:provider/provider.dart';

class DeviceRegisterScreen extends StatefulWidget {
  @override
  _DeviceRegisterScreenState createState() => _DeviceRegisterScreenState();
}

class _DeviceRegisterScreenState extends State<DeviceRegisterScreen> {
  SplashScreenViewModel splashScreenViewModel;
  ConnectivityStatus network;

  @override
  void initState() {
    super.initState();
    initialSetup();
  }

  initialSetup() async {
    splashScreenViewModel =
        Provider.of<SplashScreenViewModel>(context, listen: false);
    await splashScreenViewModel
        .getDataFromCache(); // if data already cached load from cache or call api

    await splashScreenViewModel.getDataFromApiAndCache(
        mContext: context, initial: true);
    Provider.of<IOTViewModel>(context, listen: false)
        .listenPorts(context); // listen for signals from iot
  }

  @override
  Widget build(BuildContext context) {
    network = Provider.of<ConnectivityStatus>(context);
    return Consumer<SplashScreenViewModel>(builder:
        (BuildContext context, SplashScreenViewModel model, Widget child) {
      return SafeArea(
        child: Scaffold(
          body: network == ConnectivityStatus.Offline
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/no_internet.png',
                            height: 120,
                            width: 120,
                          ),
                          Text(
                            'No Internet connection ${network}--${model.showProgress}',
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Visibility(
                  visible: model.showProgress,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blueGrey,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
