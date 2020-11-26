import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:paradigm/WidgetItems.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  void getJsonData() async {
    var url = "http://127.0.0.1:8000/";
    var response = await http.get(url);
    Map map = json.decode(response.body);
    WidgetsItem.headLines = map["headLine"];
    WidgetsItem.imageUrls = map["imageUrl"];

    print(map["headLine"]);
    if (response.statusCode == 200) {
      setState(() {
        WidgetsItem.isDataLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    CardController controller;
    //Use this to trigger swap.
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 50),
        height: MediaQuery.of(context).size.height * 0.7,
        child: new TinderSwapCard(
            orientation: AmassOrientation.BOTTOM,
            totalNum: 10,
            stackNum: 3,
            swipeEdge: 4.0,
            swipeUp: true,
            swipeDown: true,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 1.3,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 1.27,
            cardBuilder: (context, index) => WidgetsItem.isDataLoaded
                ? Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    color: Colors.grey[300],
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 0, right: 0, bottom: 20, top: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(WidgetsItem.imageUrls[index]),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            WidgetsItem.headLines[index],
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                              "description of the news storydescription of the news storydescription of the news storydescription of the news storydescription of the news story"),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, right: 15, top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: Colors.green,
                                      size: 30,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "12K LIKES",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.message,
                                      color: Colors.green,
                                      size: 30,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "140 OPINIONS",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.y < -7) {
                WidgetsItem().displayBottomSheet(context);
                print("hello");
              } else if (align.y > 7) {
                WidgetsItem().displayWebView(context);
                print("By");
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              if (orientation.index == 1) {
                print("RIGHT");
              } else if (orientation.index == 0) {
                print("LEFT");
              }
            }));
  }
}
