import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/api_data_models/main_categories_data_model.dart';
import 'package:inki/src/core/constants/sharedpreference_keys.dart';
import 'package:inki/src/core/provider_view_models/all/MainScreenProductsCategoriesViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/common_widgets/common_appbar.dart';
import 'package:inki/src/ui/common_widgets/common_navigation.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:inki/src/ui/res/colors.dart';
import 'package:inki/src/ui/routes/catagories_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProductsCategoriesListScreen extends StatefulWidget {
  @override
  _MainProductsCategoriesListScreenState createState() =>
      _MainProductsCategoriesListScreenState();
}

class _MainProductsCategoriesListScreenState
    extends State<MainProductsCategoriesListScreen> {
  ScrollController productsCategoriesScrollListener = ScrollController();
  double offset = 0.0;
  double top = 0.0;
  double scale = 1.0;
  bool showIcon = false;
  SharedPreferences prefs;
  bool connectionStatus = false;
  double heightOfContainer = 2.5;

  // UsbPort port;
  // String status = "Idle";
  // List<Widget> ports = [];
  // List<Widget> serialData = [];
  // StreamSubscription<String> subscription;
  // Transaction<String> transaction;
  //
  // int deviceId;
  // TextEditingController textController = TextEditingController();
  //
  // Future<bool> _connectTo(device, mContext) async {
  //   serialData.clear();
  //
  //   if (subscription != null) {
  //     subscription.cancel();
  //     subscription = null;
  //   }
  //
  //   if (transaction != null) {
  //     transaction.dispose();
  //     transaction = null;
  //   }
  //
  //   if (port != null) {
  //     port.close();
  //     port = null;
  //   }
  //
  //   if (device == null) {
  //     deviceId = null;
  //     setState(() async {
  //       await initPref();
  //       prefs.setBool(SharedPreferenceKeys.portConnection, false);
  //       status = "Disconnected";
  //     });
  //     return true;
  //   }
  //
  //   port = await device.create();
  //   if (!await port.open()) {
  //     Fluttertoast.showToast(
  //         msg: "Step2 open port",
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     setState(() {
  //       status = "Failed to open port";
  //     });
  //     return false;
  //   }
  //
  //   deviceId = device.deviceId;
  //   await port.setDTR(true);
  //   await port.setRTS(true);
  //   await port.setPortParameters(
  //       115200, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);
  //
  //   transaction = Transaction.stringTerminated(
  //       port.inputStream, Uint8List.fromList([13, 10]));
  //
  //   subscription = transaction.stream.listen((String line) {
  //     if (line == "z" || line == "Z") {
  //       Navigator.pushNamed(mContext, refreshAnimationHome,
  //           arguments: UsbPortModel(isFromHome: true, portValue: port));
  //     } else {}
  //
  //     setState(() {
  //       serialData.add(Text(line));
  //       if (serialData.length > 20) {
  //         serialData.removeAt(0);
  //       }
  //     });
  //   });
  //
  //   setState(() async {
  //     status = "Connected";
  //     await initPref();
  //
  //     prefs.setBool(SharedPreferenceKeys.portConnection, true);
  //     await getConnectionStatus();
  //     heightOfContainer = 4.2;
  //   });
  //   return true;
  // }
  //
  // initPref() async {
  //   if (prefs == null) prefs = await SharedPreferences.getInstance();
  // }
  //
  // void _getPorts(BuildContext mContext) async {
  //   ports = [];
  //   List<UsbDevice> devices = await UsbSerial.listDevices();
  //
  //   print(devices);
  //
  //   devices.forEach((device) {
  //     ports.add(
  //       ListTile(
  //         leading: Icon(Icons.usb),
  //         title: Text(device.productName),
  //         subtitle: Text(device.manufacturerName),
  //         trailing: TextButton(
  //           child: Text(deviceId == device.deviceId ? "Disconnect" : "Connect"),
  //           onPressed: () async {
  //             await initPref();
  //
  //             _connectTo(deviceId == device.deviceId ? null : device, mContext)
  //                 .then((res) {
  //               _getPorts(mContext);
  //               // Fluttertoast.showToast(
  //               //     msg: "Step4 _devicesListPorts ${devices}",
  //               //     toastLength: Toast.LENGTH_LONG,
  //               //     gravity: ToastGravity.CENTER,
  //               //     timeInSecForIosWeb: 1,
  //               //     backgroundColor: Colors.red,
  //               //     textColor: Colors.white,
  //               //     fontSize: 16.0);
  //               print(devices);
  //             });
  //           },
  //         ),
  //       ),
  //     );
  //
  //     // _connectTo(deviceId == device.deviceId ? null : device, mContext)
  //     //     .then((res) {
  //     //   _getPorts(mContext);
  //     //   // Fluttertoast.showToast(
  //     //   //     msg: "Step4 _devicesListPorts ${device}",
  //     //   //     toastLength: Toast.LENGTH_LONG,
  //     //   //     gravity: ToastGravity.CENTER,
  //     //   //     timeInSecForIosWeb: 1,
  //     //   //     backgroundColor: Colors.red,
  //     //   //     textColor: Colors.white,
  //     //   //     fontSize: 16.0);
  //     //   print(devices);
  //     // });
  //   });
  //
  //   setState(() {
  //     print(ports);
  //     /* Fluttertoast.showToast(
  //         msg: "Step5 __ports ${_ports}",
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   });*/
  //   });
  // }

  initPref() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    productsCategoriesScrollListener = ScrollController()..addListener(() {});
    Provider.of<IOTViewModel>(context, listen: false).listenPorts(context);// listen for signals from iot
    super.initState();
    // UsbSerial.usbEventStream.listen((UsbEvent event) {
    //   _getPorts(context);
    //
    // });
    //
    // _getPorts(context);
    // getConnectionStatus();
  }

  getConnectionStatus() async {
    await initPref();
    setState(() {
      connectionStatus =
          prefs.getBool(SharedPreferenceKeys.portConnection) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _getPorts(context);
    // if (port != null) {
    //   port.write(Uint8List.fromList("no".codeUnits));
    // }

    return Consumer2<MainScreenProductsViewModel, IOTViewModel>(
      // model: MainScreenProductsViewModel(context),
      //onModelReady: (model) => model.buildMapLocation(context),
      builder: (BuildContext context, MainScreenProductsViewModel model,
          IOTViewModel iotViewModel, Widget child) {
        return SafeArea(
          child: WillPopScope(
            onWillPop: onWillPop,
            child: Scaffold(
              backgroundColor: scaffoldBackgroundColor,
              // appBar: commonAppBar(
              //     context: context,
              //     onBackClicked: () {
              //       Navigator.pop(context);
              //     },
              //     backgroundColor: bannerBackgroundColor,
              //     menuOnClicked: () {
              //       navigateToHome(context: context);
              //       // Navigator.pushNamed(context, refreshAnimationHome);
              //     }),
              body: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
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
                                backgroundColor: bannerBackgroundColor,
                                menuOnClicked: () {
                                  navigateToHome(context: context);
                                  // Navigator.pushNamed(context, refreshAnimationHome);
                                },
                                isMain: true),
                            Center(
                              child: Container(
                                color: bannerBackgroundColor,
                                height: MediaQuery.of(context).size.height /
                                    heightOfContainer,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: iotViewModel.status !=
                                          "Connected", //!connectionStatus,
                                      child: Center(
                                          child: Column(children: <Widget>[
                                        verticalSizedBox(),
                                        Text(
                                            iotViewModel.ports.length > 0
                                                ? "Available Serial Ports"
                                                : "No serial devices available",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        ...iotViewModel.ports,
                                        Text(
                                            'Status: ${iotViewModel.status}\n'),
                                        ListTile(
                                          title: TextField(
                                            controller:
                                                iotViewModel.textController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Text To Send',
                                            ),
                                          ),
                                          trailing: TextButton(
                                            child: Text("Send"),
                                            onPressed: iotViewModel.port == null
                                                ? null
                                                : () async {
                                                    if (iotViewModel.port ==
                                                        null) {
                                                      return;
                                                    }
                                                    String data = iotViewModel
                                                            .textController
                                                            .text +
                                                        "\r\n";
                                                    await iotViewModel.port
                                                        .write(Uint8List
                                                            .fromList(data
                                                                .codeUnits));
                                                    iotViewModel.textController
                                                        .text = "";
                                                  },
                                          ),
                                        ),
                                        Text("Result Data",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        ...iotViewModel.serialData,
                                      ])),
                                    ),
                                    verticalSizedBoxTwenty(),
                                    // Hello!
                                    Text(
                                      "Hello!",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: const Color(0xff3c3f42),
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 50.0),
                                      ),
                                    ),
                                    verticalSizedBox(),
                                    Center(
                                      child: // What would you like  to check out today ?
                                          Text(
                                        "What would you like \n to check out today ? ",
                                        style: const TextStyle(
                                            color: const Color(0xff3c3f42),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Lato",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 21.0),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    // Container(
                                    //   width: 456,
                                    //   height: 0,
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //         color: const Color(0xff707070),
                                    //         width: 1),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ProductsList(
                                productsList: UsbPortModel(
                                    portValue: iotViewModel.port,
                                    productsList: model.listOfMainCategories,
                                    isFromHome: true),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              // body: NestedScrollView(
              //   controller: productsCategoriesScrollListener,
              //   headerSliverBuilder:
              //       (BuildContext context, bool innerBoxIsScrolled) {
              //     return <Widget>[
              //       SliverAppBar(
              //         elevation: 0.0,
              //         backgroundColor: scaffoldBackgroundColor,
              //         expandedHeight: 250.0,
              //         floating: true,
              //         pinned: false,
              //         // title: Visibility(
              //         //   visible: model.showIcon,
              //         //   child: Text(
              //         //     "Hello!!  What would you like to check out today!",
              //         //     style: Theme.of(context).textTheme.headline4.copyWith(fontSize: ),
              //         //   ),
              //         // ),
              //         flexibleSpace: FlexibleSpaceBar(
              //           background: Center(
              //             child: Container(
              //               color: backgroundColor,
              //               width: MediaQuery.of(context).size.width,
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   verticalSizedBoxTwenty(),
              //                   // Hello!
              //                   Text(
              //                     "Hello!",
              //                     style: GoogleFonts.lato(
              //                       textStyle: TextStyle(
              //                           color: const Color(0xff3c3f42),
              //                           fontWeight: FontWeight.w900,
              //                           fontStyle: FontStyle.normal,
              //                           fontSize: 50.0),
              //                     ),
              //                   ),
              //                   verticalSizedBox(),
              //                   Padding(
              //                     padding: const EdgeInsets.symmetric(
              //                         horizontal: 20.0, vertical: 5.0),
              //                     child: Center(
              //                       child: // What would you like  to check out today ?
              //                           Text(
              //                         "What would you like \n to check out today ? ",
              //                         style: const TextStyle(
              //                             color: const Color(0xff3c3f42),
              //                             fontWeight: FontWeight.w500,
              //                             fontFamily: "Lato",
              //                             fontStyle: FontStyle.normal,
              //                             fontSize: 21.0),
              //                         textAlign: TextAlign.center,
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: 40,
              //                   ),
              //                 ],
              //               ),
              //             ),
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
              //                 Center(
              //                   child: Container(
              //                     color: backgroundColor,
              //                     width: MediaQuery.of(context).size.width,
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [
              //                         verticalSizedBoxTwenty(),
              //                         // Hello!
              //                         Text(
              //                           "Hello!",
              //                           style: GoogleFonts.lato(
              //                             textStyle: TextStyle(
              //                                 color: const Color(0xff3c3f42),
              //                                 fontWeight: FontWeight.w900,
              //                                 fontStyle: FontStyle.normal,
              //                                 fontSize: 50.0),
              //                           ),
              //                         ),
              //                         verticalSizedBox(),
              //                         Padding(
              //                           padding: const EdgeInsets.symmetric(
              //                               horizontal: 20.0, vertical: 5.0),
              //                           child: Center(
              //                             child: // What would you like  to check out today ?
              //                             Text(
              //                               "What would you like \n to check out today ? ",
              //                               style: const TextStyle(
              //                                   color: const Color(0xff3c3f42),
              //                                   fontWeight: FontWeight.w500,
              //                                   fontFamily: "Lato",
              //                                   fontStyle: FontStyle.normal,
              //                                   fontSize: 21.0),
              //                               textAlign: TextAlign.center,
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 40,
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //                 verticalSizedBox(),
              //                 Expanded(
              //                   child: SingleChildScrollView(
              //                     child: Container(
              //                       child: Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: <Widget>[
              //                           // ListView.builder(
              //                           //   shrinkWrap: true,
              //                           //   itemCount:
              //                           //       model.listOfMainCategories.length,
              //                           //   itemBuilder: (context, index) {
              //                           //     return Container(
              //                           //       child: Text(
              //                           //         "sfsdfdf",
              //                           //         style:
              //                           //             ThemeData().textTheme.headline2,
              //                           //       ),
              //                           //     );
              //                           //   },
              //                           // ),
              //                           Padding(
              //                             padding: const EdgeInsets.symmetric(
              //                               horizontal: 30.0,
              //                             ),
              //                             child: Container(
              //                               width: 456,
              //                               height: 0,
              //                               decoration: BoxDecoration(
              //                                 border: Border.all(
              //                                     color: const Color(0xff707070),
              //                                     width: 2),
              //                               ),
              //                             ),
              //                           ),
              //                           SizedBox(
              //                             height: 25,
              //                           ),
              //                           ProductsList(
              //                             productsList: model.listOfMainCategories,
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
          ),
        );
      },
    );
  }

  updateView(bool value) {
    setState(() {
      showIcon = value;
    });
  }

  Future<bool> onWillPop() async {
    await initPref();
    getConnectionStatus();
    AlertDialog alert = AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      title: Text(
        connectionStatus
            ? 'Are you sure you want to exit the app and disconnect the port?'
            : 'Are you sure you want to exit the app?',
        style: Theme.of(context).textTheme.headline3,
      ),
      actions: [
        new TextButton(
          onPressed: () async {
            await initPref();
            prefs.setBool(SharedPreferenceKeys.portConnection, false);
            // socket.disconnect();
            Navigator.of(context).pop(true);

            //   model.removeLocationData();
            //  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          child: new Text(
            'Yes',
            style: new TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
        new TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          //  Navigator.pop(context), // this line dismisses the dialog
          child: new Text(
            'No',
            style: new TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        )
      ],
    );

    return showDialog(
          context: context,
          builder: (context) => alert,
        ) ??
        false;
  }

  @override
  void dispose() {
    productsCategoriesScrollListener.dispose();
    super.dispose();
  }
}
