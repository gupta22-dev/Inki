import 'package:flutter/material.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/ui/routes/device_register.dart';
import 'package:inki/src/ui/routes/in_app_web.dart';
import 'package:inki/src/ui/routes/laundrymagic_screen.dart';
import 'package:inki/src/ui/routes/main_products_list.dart';
import 'package:inki/src/ui/routes/more_options_screen.dart';
import 'package:inki/src/ui/routes/product_details.dart';
import 'package:inki/src/ui/routes/refresh_animation_home.dart';
import 'package:inki/src/ui/routes/refresh_details_screen.dart';
import 'package:inki/src/ui/routes/sub_cat_products_list.dart';
import 'package:inki/src/ui/routes/sub_categories_screen.dart';

class RouterNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {// routes of app
      case webView:
        return MaterialPageRoute(
          builder: (_) => InAppWebViewExampleScreen(),
        );
      case deviceRegisterScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: deviceRegisterScreen),
          builder: (_) => DeviceRegisterScreen(),
        );
      case mainHome:
        return MaterialPageRoute(
          settings: RouteSettings(name: mainHome),
          builder: (_) => MainProductsCategoriesListScreen(),
        );
      case moreOptionsScreen:
        return MaterialPageRoute(
          builder: (_) => MoreOptionsScreen(),
        );
      case refreshAnimationDetailsHome:
        return MaterialPageRoute(
          builder: (_) => RefreshDetailsScreen(
            isFromHome: settings.arguments,
          ),
        );
      case refreshAnimationHome:
        return MaterialPageRoute(
          builder: (_) => RefreshAnimationHome(isFromHome: settings.arguments),
        );
      case laundryMagicScreen:
        return MaterialPageRoute(
          builder: (_) => LaundryMagicScreen(),
        );
      case productsDetails:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ProductDetail(groupId: settings.arguments);
        });
      case mainCategoriesScreen:
        return MaterialPageRoute(
          builder: (_) => MainProductsCategoriesListScreen(),
        );
      case subCategoriesProducts:
        return MaterialPageRoute(
          builder: (_) => SubCategoriesProductListScreen(
            mapValue: settings.arguments,
          ),
        );
      case subCategories:
        return MaterialPageRoute(
          builder: (_) => SubCategoriesListScreen(
            indexValue: settings.arguments,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route found for the name $settings.name',
              ),
            ),
          ),
        );
    }
  }
}
