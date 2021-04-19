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

class _MemberWidgetState extends State<MemberWidget> {
  double _mainContainerHeight = 720;
  double _textContainerHeight = 0;
  double _textPosition = 50;
  LinearGradient _linearGradient = LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Color(0x551a122a),
        Color(0xbb1a122a),
        Color(0xcc1a122a),
        Color(0xFF1a122a),
      ]);

  void startAnimation() {
    setState(() {
      if (_textPosition == 50) {
        _textPosition = 400;
        _linearGradient = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xee1a122a),
              Color(0xee1a122a),
              Color(0xee1a122a),
              Color(0xFF1a122a),
            ]);
        _textContainerHeight = 200;
      } else {
        _textPosition = 50;
        _linearGradient = LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color(0x551a122a),
              Color(0xbb1a122a),
              Color(0xcc1a122a),
              Color(0xFF1a122a),
            ]);
        _textContainerHeight = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _mainContainerHeight,
      width: 360,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: MouseRegion(
        onEnter: (p) {
          if (_deviceWidth > 600) startAnimation();
        },
        onExit: (p) {
          if (_deviceWidth > 600) startAnimation();
        },
        child: GestureDetector(
          onTap: () {
            startAnimation();
          },
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    gradient: _linearGradient,
                  ),
                  height: 720,
                  width: 320,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut,
                left: 0,
                bottom: _textPosition,
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
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 500,
                      ),
                      height: _textContainerHeight,
                      width: 320,
                      decoration: BoxDecoration(),
                      margin: EdgeInsets.only(bottom: 20),
                      curve: Curves.linearToEaseOut,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 0),
                        opacity: _textContainerHeight / 200,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pulvinar finibus magna hendrerit lobortis. Phasellus ultrices velit turpis, ac venenatis arcu bibendum eget. Praesent commodo ornare magna vel finibus. Aliquam gravida dolor augue, eget ullamcorper urna pellentesque ac. Nullam magna metus, laoreet sit amet dolor sit amet, fringilla accumsan mi. Aenean mollis imperdiet magna eget aliquet. Pellentesque venenatis pellentesque massa, et accumsan metus faucibus id. Vestibulum nunc risus, ultrices eget quam scelerisque, laoreet auctor nibh. Nulla ac semper lorem. Aliquam et purus malesuada, porttitor leo non, sodales lacus.",
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lora(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
