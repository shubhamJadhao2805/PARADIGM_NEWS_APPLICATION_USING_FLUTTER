import 'package:paradigm/LogInPage.dart';
import 'package:paradigm/ProfilePage.dart';
import 'package:paradigm/WidgetItems.dart';

import 'ActivityPage.dart';
import 'ExploreSection.dart';
import 'package:flutter/material.dart';
import 'HomePageSection.dart';
import 'Preference.dart';
import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "App",
    home: LoginScreen(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [HomePage(), ExplorePage(), Activity(), UserProfile()];

  List<Color> colors = [
    Colors.white,
    Colors.black87,
    Colors.white,
    Colors.white
  ];
  static int pageSelected = 0;
  bool homePageSelected = true;
  bool isHomePage = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: colors[pageSelected],
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.black87,
            title: Text("The Paradigm "),
            centerTitle: true,
            actions: <Widget>[
              Padding(
                child: IconButton(
                  icon: Icon(Icons.list),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategorialPage()));
                  },
                ),
                padding: EdgeInsets.only(right: 30),
              ),
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                pages[pageSelected],
                bottomAppBar(),
              ],
            ),
          )),
    );
  }

  Widget bottomAppBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: BottomNavigationBar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 80),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              new BottomNavigationBarItem(
                icon: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset(
                    homePageSelected
                        ? "assets/images/paradigmgreenlogo.png"
                        : "assets/images/paradigmlogo.png",
                  ),
                ),
                title: Text('Calls'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  size: 35,
                ),
                title: Text('Messages'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                    size: 35,
                  ),
                  title: Text('Profile')),
              new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: 35,
                  ),
                  title: Text('Profile'))
            ],
            onTap: (index) {
              setState(() {
                pageSelected = index;
                if (pageSelected == 0) {
                  homePageSelected = true;
                } else {
                  homePageSelected = false;
                }
              });
            },
            unselectedItemColor: Colors.grey,
            currentIndex: pageSelected,
            selectedItemColor: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
//Categorial Page
