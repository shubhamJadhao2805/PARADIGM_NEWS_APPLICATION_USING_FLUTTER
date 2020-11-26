import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:paradigm/main.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreenBody();
  }
}

class LoginScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  //RectangleTop(),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SemiCircle(),
                      Image.asset(
                        "assets/images/paradigmlogoo.png",
                        height: 100,
                        width: 100,
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.all(8),
                    padding: EdgeInsets.fromLTRB(78, 8, 78, 8),
                    //width: 275,
                    child: TextField(
                      //style: TextStyle(fontFamily: "Montserrat"),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                        labelText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(48.0),
                          ),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(48.0),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 187, 103),
                              width: 2),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.all(8),
                    padding: EdgeInsets.fromLTRB(78, 8, 78, 8),
                    //width: 275,
                    child: TextField(
                      //style: TextStyle(fontFamily: "Montserrat"),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                        labelText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(48.0),
                          ),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(48.0),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 187, 103),
                              width: 2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "         CONTINUE         ",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      elevation: 0.0,
                      color: Color.fromARGB(255, 0, 187, 103),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Color.fromARGB(255, 0, 187, 103),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(78, 16, 78, 16),
                    child: Line(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Login using",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 187, 103),
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/images/fb.svg",
                          width: 36,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/images/linkedin.svg",
                          width: 36,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/images/google.svg",
                          width: 36,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(""), // just for spacing
              Text(""), // just for spacing
              Text(""), // just for spacing
              Text(""), // just for spacing
            ],
          ),
        ),
      ),
    );
  }
}

class RectangleTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return CustomPaint(
      painter: RectanglePainter(),
      size: Size(width, 100),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(shapeBounds, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return CustomPaint(
      painter: LinePainter(),
      size: Size(width, 1),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.grey;
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(shapeBounds, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SemiCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double diameter = MediaQuery.of(context).size.width;
    return CustomPaint(
      painter: SemiCirclePainter(),
      size: Size(diameter, diameter / 2),
    );
  }
}

// This is the Painter class
class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, 0),
        radius: size.height,
      ),
      -math.pi,
      -math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
