import 'dart:async';

import 'package:flutter/material.dart';

class FragnanceRipple extends StatefulWidget {
  var color;
  var fun;
  FragnanceRipple({this.color = Colors.black, this.fun});
  @override
  _FragnanceRippleState createState() => _FragnanceRippleState();
}

class _FragnanceRippleState extends State<FragnanceRipple>
    with TickerProviderStateMixin {
  AnimationController rippleController;
  AnimationController scaleController;

  Animation<double> rippleAnimation;
  Animation<double> scaleAnimation;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    rippleController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    scaleController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    rippleAnimation =
        Tween<double>(begin: 80.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 90.0).animate(scaleController);
    rippleController.forward();
  }

  @override
  void dispose() {
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      widget.fun();
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: rippleAnimation,
          builder: (context, child) => Container(
            width: rippleAnimation.value * 0.6,
            height: rippleAnimation.value * 0.6,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: widget.color.withOpacity(0.4)),
              child: InkWell(
                onTap: () {
                  scaleController.forward();
                },
                child: AnimatedBuilder(
                    animation: scaleAnimation,
                    builder: (context, child) => Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.color.withOpacity(1.0))),
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
