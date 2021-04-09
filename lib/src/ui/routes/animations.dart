import 'package:flutter/material.dart';
import 'package:inki/src/ui/common_widgets/sizedbox.dart';
import 'package:inki/src/ui/res/colors.dart';

/// This is the stateful widget that the main application instantiates.
class RefreshAnimations extends StatefulWidget {
  RefreshAnimations({Key key}) : super(key: key);

  @override
  _RefreshAnimationsState createState() => _RefreshAnimationsState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RefreshAnimationsState extends State<RefreshAnimations>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  AnimationController _scaleAnim;
  Animation<double> _animation;
  var anim = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );

    _scaleAnim = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _scaleAnim,
      curve: Curves.elasticInOut,
    );
    // _scaleAnim.forward();
    // _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scaleAnim.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightGrey,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          anim = 1;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.yellow,
                        child: Center(
                            child: Text(
                          "Slide",
                          style: Theme.of(context).textTheme.headline3,
                        )),
                      )),
                  horizontalSizedBox(),
                  InkWell(
                      onTap: () {
                        setState(() {
                          anim = 2;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.yellow,
                        child: Center(
                            child: Text("Scale",
                                style: Theme.of(context).textTheme.headline3)),
                      )),
                ],
              ),
            ),
            verticalSizedBoxTwenty(),
            Container(
              height: 500,
              color: lightGreyOne,
              child: anim == 1
                  ? Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: slideTransitionAnim(),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: slideTransitionAnim(),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: sliderAnim(),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: sliderAnim(),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Container fragranceContainer() => Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/flower.jpg'),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.circle,
        ),
      );

  ScaleTransition sliderAnim() => ScaleTransition(
        scale: _animation,
        child: fragranceContainer(),
      );

  SlideTransition slideTransitionAnim() => SlideTransition(
        position: _offsetAnimation,
        child: fragranceContainer(),
      );
}
