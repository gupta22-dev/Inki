import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive/hive.dart';
import 'package:inki/main_router_map.dart';
import 'package:inki/src/core/api_data_models/product_master_api_model.dart';
import 'package:inki/src/core/api_repository/api_base_helper.dart';
import 'package:inki/src/core/constants/common_strings.dart';
import 'package:inki/src/core/provider_view_models/all/MainScreenProductsCategoriesViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/RefreshAnimationViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/SpalshScreenViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/res/style.dart';
import 'package:inki/src/ui/splash_screen.dart';
import 'package:inki/src/utils/network_aware/connectivity_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir =
      await getApplicationDocumentsDirectory(); // local cache path

  if (Platform.isAndroid) {
    // for webview inside app
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      serviceWorkerController.serviceWorkerClient = AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      );
    }
  }
  Hive.init(appDocumentDir.path); // local cache data models
  Hive.registerAdapter(ProductMasterApiModelAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(CategoryDataAdapter());
  Hive.registerAdapter(GroupMastersAdapter());
  Hive.registerAdapter(ProductMastersAdapter());
  Hive.registerAdapter(ProductDataAdapter());
  Hive.registerAdapter(ProductFeaturesAdapter());
  Hive.registerAdapter(FeatureMasterAdapter());
  Hive.registerAdapter(ProductPropertiesAdapter());
  Hive.registerAdapter(PropertyMasterAdapter());
  Hive.registerAdapter(ProductSpecificationsAdapter());
  Hive.registerAdapter(SpecificationMasterAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // creates object for viewmodels and we can use that anywhere from the app
      providers: [
        Provider.value(
          value: ApiBaseHelper(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainScreenProductsViewModel(context),
        ),
        ChangeNotifierProvider(
          create: (context) => IOTViewModel(context: context),
        ),
        ChangeNotifierProvider(
          create: (context) => RefreshAnimationViewModel(context),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashScreenViewModel(context),
        ),
        StreamProvider<ConnectivityStatus>.value(
          // internet connectivity stream
          value: ConnectivityService(context: context)
              .connectionStatusController
              .stream,
        ),
      ],
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(
            color: Color(0xFFF5F5F5),
          ),
        ),
        title: CommonStrings.appName,
        home: SplashScreen(),
        onGenerateRoute: RouterNavigation.generateRoute,
        theme: ThemeChanger().lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
