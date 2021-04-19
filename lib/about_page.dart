import 'package:animated_background/animated_background.dart';
import 'package:cyferscript/widgets/member_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  var pointer = PointerHoverEvent().position;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a122a),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Colors.white,
            spawnMaxSpeed: 150,
            spawnMinSpeed: 50,
            spawnMaxRadius: 3,
          ),
        ),
        child: MouseRegion(
          onHover: (eve) {
            setState(() {
              pointer = eve.position;
            });
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   alignment: Alignment.center,
                    //   margin: EdgeInsets.only(top: 50),
                    //   child: Text(
                    //     "Our The Team",
                    //     style: GoogleFonts.josefinSans(
                    //       color: Color(0xFFCECECE),
                    //       fontSize: 32,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                    Center(
                      child: Wrap(
                        children: [
                          MemberWidget(
                            image: "assets/images/ceo.jpg",
                            name: "Rishi",
                            job: "CEO",
                          ),
                          MemberWidget(
                            image: "assets/images/prateek.jpg",
                            name: "Prateek",
                            job: "Technical Head",
                          ),
                          MemberWidget(
                            image: "assets/images/prateek2.jpg",
                            name: "Akshay",
                            job: "Designer",
                          ),
                        ],
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
