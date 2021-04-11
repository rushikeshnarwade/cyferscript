import 'package:cyferscript/about_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey key;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    key = GlobalKey();
    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    // TODO: implement initState
    // _controller.addListener(() {
    //   setState(() {
    //     setState(() {
    //       _opacity = _controller.value;
    //     });
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  static double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double ceoImgWidth = width * 0.64;
    print(width);
    return Scaffold(
      backgroundColor: Color(0xFF141414),
      body: Center(
        child: ListView(
          scrollDirection: width < 650? Axis.vertical : Axis.horizontal,
          key: key,
          children: [
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                if (!_controller.isCompleted) {
                  _controller.forward();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
                } else {
                  _controller.reverse();
                }
              },
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  // print(_controller.value);
                  return Transform.scale(
                    alignment: Alignment(0.05, -0.5),
                    scale: _controller.value < 0.1 ? 1 : _controller.value * 10,
                    child: child,
                  );
                },
                child: Image.asset("assets/ceo.png", width: ceoImgWidth),
              ),
            ),
            Opacity(
              opacity: 1 - _opacity,
              child: Container(
                width: width * 0.36,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 150,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "FILMING | BRANDING",
                      style: GoogleFonts.josefinSans(
                        color: Color(0xFFCECECE),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
