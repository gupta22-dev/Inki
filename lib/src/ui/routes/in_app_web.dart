import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';

class InAppWebViewExampleScreen extends StatefulWidget {
  @override
  _InAppWebViewExampleScreenState createState() =>
      new _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  // late PullToRefreshController pullToRefreshController;
  // late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //
    // contextMenu = ContextMenu(
    //     menuItems: [
    //       ContextMenuItem(
    //           androidId: 1,
    //           iosId: "1",
    //           title: "Special",
    //           action: () async {
    //             print("Menu item Special clicked!");
    //             print(await webViewController?.getSelectedText());
    //             await webViewController?.clearFocus();
    //           })
    //     ],
    //     options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
    //     onCreateContextMenu: (hitTestResult) async {
    //       print("onCreateContextMenu");
    //       print(hitTestResult.extra);
    //       print(await webViewController?.getSelectedText());
    //     },
    //     onHideContextMenu: () {
    //       print("onHideContextMenu");
    //     },
    //     onContextMenuActionItemClicked: (contextMenuItemClicked) async {
    //       var id = (Platform.isAndroid)
    //           ? contextMenuItemClicked.androidId
    //           : contextMenuItemClicked.iosId;
    //       print("onContextMenuActionItemClicked: " +
    //           id.toString() +
    //           " " +
    //           contextMenuItemClicked.title);
    //     });
    //
    // pullToRefreshController = PullToRefreshController(
    //   options: PullToRefreshOptions(
    //     color: Colors.blue,
    //   ),
    //   onRefresh: () async {
    //     if (Platform.isAndroid) {
    //       webViewController?.reload();
    //     } else if (Platform.isIOS) {
    //       webViewController?.loadUrl(
    //           urlRequest: URLRequest(url: await webViewController?.getUrl()));
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    // contextMenu: contextMenu,
                    initialUrlRequest: URLRequest(
                        url: Uri.parse("https://www.ifbappliances.com/ac-3d/")),
                    // initialFile: "assets/index.html",
                    //initialUserScripts: UnmodifiableListView<UserScript>([]),
                    initialOptions: options,
                    // pullToRefreshController: pullToRefreshController,
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },
                    androidOnPermissionRequest:
                        (controller, origin, resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      //       var uri = navigationAction.request.url;

                      // if (![
                      //   "http",
                      //   "https",
                      //   "file",
                      //   "chrome",
                      //   "data",
                      //   "javascript",
                      //   "about"
                      // ].contains(uri.scheme)) {
                      //   if (await canLaunch(url)) {
                      //     // Launch the App
                      //     await launch(
                      //       url,
                      //     );
                      //     // and cancel the request
                      //     return NavigationActionPolicy.CANCEL;
                      //   }
                      // }

                      return NavigationActionPolicy.ALLOW;
                    },
                    onLoadStop: (controller, url) async {
                      //pullToRefreshController.endRefreshing();
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },
                    onLoadError: (controller, url, code, message) {
                      // pullToRefreshController.endRefreshing();
                    },
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        // pullToRefreshController.endRefreshing();
                      }
                      setState(() {
                        this.progress = progress / 100;
                        urlController.text = this.url;
                      });
                    },
                    onUpdateVisitedHistory: (controller, url, androidIsReload) {
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },
                    onConsoleMessage: (controller, consoleMessage) {
                      print(consoleMessage);
                    },
                  ),
                  progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container(),
                ],
              ),
            ),
            // ButtonBar(
            //   alignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     ElevatedButton(
            //       child: Icon(Icons.arrow_back),
            //       onPressed: () {
            //         webViewController?.goBack();
            //       },
            //     ),
            //     ElevatedButton(
            //       child: Icon(Icons.arrow_forward),
            //       onPressed: () {
            //         webViewController?.goForward();
            //       },
            //     ),
            //     ElevatedButton(
            //       child: Icon(Icons.refresh),
            //       onPressed: () {
            //         webViewController?.reload();
            //       },
            //     ),
            //   ],
            // ),
            verticalSizedBox(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, productsDetails,
                    arguments: {"type": "ac"});
                // navigateToHome(context: context);
              },
              child: Padding(
                padding: const EdgeInsets.all(42.0),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffc64c55),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: // KNOW MORE
                        Text("KNOW MORE",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0),
                            ),
                            textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
