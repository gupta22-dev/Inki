import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/api_data_models/main_categories_data_model.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/all/SpalshScreenViewModel.dart';
import 'package:inki/src/core/provider_view_models/all/iot_view_model.dart';
import 'package:inki/src/ui/common_widgets/networ_catch_image.dart';
import 'package:inki/src/ui/common_widgets/rich_text_title.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  final UsbPortModel productsList;

  ProductsList({
    this.productsList,
  });

  @override
  _ProductsListState createState() => _ProductsListState(
        productsList: productsList,
      );
}

class _ProductsListState extends State<ProductsList> {
  final UsbPortModel productsList;

  _ProductsListState({this.productsList});

  @override
  void initState() {
    Provider.of<IOTViewModel>(context, listen: false)
        .listenPorts(context); // listen for signals from iot
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenViewModel>(builder:
        (BuildContext context, SplashScreenViewModel model, Widget child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 20.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.mainCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (model.mainCategories[index].subCategory == "AC Demo") {
                  Navigator.of(context).pushNamed(
                    webView,
                    //arguments: index,
                  );
                } else if (model.mainCategories[index].subCategory ==
                    "VM Demo") {
                  Navigator.pushNamed(context, refreshAnimationHome,
                      arguments: UsbPortModel(
                          portValue: productsList.portValue,
                          isFromHome: productsList.isFromHome));
                } else {
                  Navigator.of(context).pushNamed(
                    subCategories,
                    arguments: index,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                    child: Container(
                      width: 456,
                      height: 150,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.white.withOpacity(
                              0.2,
                            ),
                            offset: Offset(
                              3,
                              3,
                            ),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 7.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: model.mainCategories[index].imageMain ==
                                      null
                                  ? loaderBeforeImage(
                                      image: productsList
                                          .productsList[index].imageSrc,
                                      width: 162.5,
                                      height: 135,
                                      boxFit: BoxFit.fitHeight)
                                  : networkImage(
                                      image:
                                          model.mainCategories[index].imageMain,
                                      loaderImage: loaderBeforeImage(),
                                      width: 162.5,
                                      height: 135,
                                      boxFit: BoxFit.fitHeight),
                            ),
                            SizedBox(
                              width: 20,
                              height: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  richTextTitle(
                                      context,
                                      model.mainCategories[index].subCategory
                                          .split(" ")[0],
                                      model.mainCategories[index].subCategory
                                          .split(" ")[1],
                                      22.5),
                                  verticalSizedBoxFive(),
                                  Wrap(
                                    children: [
                                      Text(
                                        model.mainCategories[index].description,
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: const Color(0xff3c3f42),
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSizedBox(),
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: model.mainCategories[index]
                                          .groupMasters.length,
                                      itemBuilder: (context, childIndex) {
                                        return Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Text(
                                              "${model.mainCategories[index].groupMasters[childIndex].group}",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color:
                                                        const Color(0xff3c3f42),
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 6.0),
                                              ),
                                              textAlign: TextAlign.left),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

//  @override
//  Widget build(BuildContext context) {
//    return Consumer<HomeRestaurantListViewModel>(
//      builder: (BuildContext context, HomeRestaurantListViewModel model,
//          Widget child) {
//        return InkWell(
//          onTap: () {
//            Navigator.of(context).pushNamed(restaurantDetails,
//                arguments: RestaurantsArgModel(
//                  imageTag: "${restaurantInfo.imageTag}${restaurantInfo.index}",
//                  restaurantID: restaurantInfo.restaurantData.id,
//                  image: restaurantInfo.restaurantData.src,
//                  city: restaurantInfo.city,
//                ));
//          },
//          child: Padding(
//            padding: const EdgeInsets.all(7.0),
//            child: Container(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  ClipRRect(
//                    borderRadius: BorderRadius.circular(10.0),
//                    child: Hero(
//                      tag: "${restaurantInfo.imageTag}${restaurantInfo.index}",
//                      child: restaurantInfo.restaurantData.src == " "
//                          ? Image.asset(
//                              'assets/images/no_image.png',
//                              height: 80.0,
//                              width: 80.0,
//                            )
//                          : CachedNetworkImage(
//                              imageUrl: restaurantInfo.restaurantData.src,
//                              placeholder: (context, url) => imageShimmer(),
//                              errorWidget: (context, url, error) =>
//                                  Icon(Icons.error),
//                              fit: BoxFit.fill,
//                              height: 80.0,
//                              width: 80.0,
//                            ),
//                    ),
//                  ),
//                  SizedBox(
//                    width: 15,
//                    height: 10,
//                  ),
//                  Expanded(
//                    flex: 2,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Row(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Text(
//                              restaurantInfo.restaurantData.name,
//                              overflow: TextOverflow.ellipsis,
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display1
//                                  .copyWith(
//                                      fontSize: 14,
//                                      fontWeight: FontWeight.w600),
//                            ),
//                            GestureDetector(
//                              onTap: () {
//                                if (model.accessToken.isNotEmpty) {
//                                  //call api
//                                  model.updateFavoritesIndex(index);
//                                  model.wishListRequest(
//                                    restaurantId:
//                                        restaurantInfo.restaurantData.id,
//                                  );
////                                  setState(
////                                    () {
////                                      favoriteIndex = widget.index;
////                                    },
////                                  );
//
//                                } else {
//                                  // move to login
//                                  Navigator.pushNamed(context, login);
//                                }
//                              },
//                              child: Padding(
//                                padding: const EdgeInsets.only(right: 10.0),
//                                child: Icon(
//                                  Icons.favorite,
//                                  color: restaurantInfo
//                                          .restaurantData.favouriteStatus
//                                      ? Colors.red
//                                      : Colors.grey[300],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                        verticalSizedBox(),
//                        Row(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Flexible(
//                              child: Text(
//                                restaurantInfo.restaurantData.resDesc,
//                                overflow: TextOverflow.ellipsis,
//                                style: Theme.of(context)
//                                    .textTheme
//                                    .display2
//                                    .copyWith(
//                                      fontSize: 13,
//                                    ),
//                              ),
//                            ),
//                            Text(
//                              ' - ',
//                              style:
//                                  Theme.of(context).textTheme.display3.copyWith(
//                                        fontWeight: FontWeight.w600,
//                                      ),
//                            ),
//                            Container(
//                              height: 15,
//                              child: ListView.builder(
//                                  itemCount: 4,
//                                  shrinkWrap: true,
//                                  scrollDirection: Axis.horizontal,
//                                  itemBuilder: (context, index) {
//                                    return Text(
//                                      r"$",
//                                      style: Theme.of(context)
//                                          .textTheme
//                                          .display3
//                                          .copyWith(
//                                            fontSize: 11,
//                                            color: index <=
//                                                    restaurantInfo
//                                                        .restaurantData.budget
//                                                ? Colors.black
//                                                : Colors.grey,
//                                          ),
//                                    );
//                                  }),
//                            )
//                          ],
//                        ),
//                        verticalSizedBoxFive(),
//                        Row(
//                          children: <Widget>[
//                            Icon(
//                              Icons.star,
//                              color: (restaurantInfo.restaurantData.rating == 0)
//                                  ? Colors.grey[600]
//                                  : Colors.amber,
//                              size: 20.0,
//                            ),
//                            SizedBox(
//                              width: 8,
//                            ),
//                            Text(
//                              restaurantInfo.restaurantData.rating.toString(),
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display3
//                                  .copyWith(fontSize: 12),
//                            ),
//                            Text(
//                              " - ",
//                              style:
//                                  Theme.of(context).textTheme.display3.copyWith(
//                                        fontWeight: FontWeight.w500,
//                                      ),
//                            ),
//                            Text(
//                              restaurantInfo.restaurantData.distance.toString(),
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display3
//                                  .copyWith(fontSize: 12),
//                            ),
//                            SizedBox(
//                              width: 5,
//                            ),
//                            Text(
//                              "(${restaurantInfo.restaurantData.deliveryTime.toString()} mins) " ??
//                                  " ",
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .display2
//                                  .copyWith(fontSize: 12),
//                            ),
//                          ],
//                        ),
//                        verticalSizedBox(),
//                        divider(),
//                        restaurantInfo.restaurantData.promoStatus == 1
//                            ? shopOpenedWidget()
//                            : Visibility(
//                                visible:
//                                    restaurantInfo.restaurantData.mode == "open"
//                                        ? false
//                                        : true,
//                                child: Column(
//                                  children: <Widget>[
//                                    Divider(
//                                      color: Colors.black45,
//                                    ),
//                                    SizedBox(
//                                      height: 3,
//                                    ),
//                                    ShopClosedWidget()
//                                  ],
//                                ),
//                              ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        );
//      },
//    );
//  }

}
