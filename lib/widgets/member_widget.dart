import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberWidget extends StatefulWidget {
  final String image;
  final String name;
  final String job;
  const MemberWidget({this.image, this.name, this.job});
  @override
  _MemberWidgetState createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget>
    with TickerProviderStateMixin {
  AnimationController _textAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _textAnimation = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 100,
      upperBound: 500,
    );
    super.initState();
  }

  double _containerHeight = 720;
  double __containerWidth = 360;

  @override
  void dispose() {
    // TODO: implement dispose
    _textAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _textAnimation.forward();
        });
      },
      child: Container(
        height: _containerHeight,
        width: __containerWidth,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0x551a122a),
                        Color(0xbb1a122a),
                        Color(0xcc1a122a),
                        Color(0xFF1a122a),
                      ]),
                ),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  height: 720,
                  width: 320,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _textAnimation.view,
              builder: (context, child) {
                return Positioned(
                  left: 0,
                  bottom: _textAnimation.value,
                  child: child,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.lora(
                      fontSize: 48,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  Text(
                    widget.job,
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      color: Color(0xFFff407d),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
