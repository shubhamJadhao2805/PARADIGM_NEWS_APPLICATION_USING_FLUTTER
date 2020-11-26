import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:paradigm/WidgetItems.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'dart:ui' as ui;

import 'package:webview_flutter/webview_flutter.dart';

class ExplorePage extends StatefulWidget {
  @override
  _StaggerState createState() => _StaggerState();
}

class _StaggerState extends State<ExplorePage> {
//  GlobalKey _globalKey = new GlobalKey();
//  bool inside = false;
//  Uint8List imageInMemory;

  @override
  Widget build(BuildContext context) {
    int numItems = 9;
    Random random = new Random();
    var array = [];
    int i = 0;
    for (i = 0; i < numItems; i++) {
      array.add(random.nextInt(3) + 2);
    }

    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(20),
      crossAxisCount: 4,
      itemCount: numItems,
      itemBuilder: (BuildContext context, int index) => new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Container(
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(30.0)),
                        image: new DecorationImage(
                          image: new NetworkImage(WidgetsItem.imageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.white30))),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return TiderCardUI();
                    },
                  );
                  print("Dialog");
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              WidgetsItem.headLines[index],
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, array[index]),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }

  //Mathod Declarations

}

class TiderCardUI extends StatefulWidget {
  @override
  _TiderCardUIState createState() => _TiderCardUIState();
}

class _TiderCardUIState extends State<TiderCardUI> {
  bool isShare = false;
  GlobalKey _globalKey = new GlobalKey();
  bool inside = false;
  Uint8List imageInMemory;

  CardController controller;

  @override
  Widget build(BuildContext context) {
    return TinderSwapCard(
        orientation: AmassOrientation.BOTTOM,
        totalNum: 1,
        stackNum: 2,
        swipeEdge: 4.0,
        swipeUp: true,
        swipeDown: true,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.width * 1.3,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.width * 1.27,
        cardBuilder: (context, index) => RepaintBoundary(
              key: _globalKey,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.white, width: 3),
                ),
                color: Colors.grey[300],
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 0, right: 0, bottom: 20, top: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.livemint.com/img/2020/07/18/600x338/hdfc3-kDUD--621x414@LiveMint_1595059414695.JPG'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "My name is shubham",
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
                              isShare
                                  ? Container(
                                      child: Text(
                                        "Paradigm",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    )
                                  : Column(
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
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                              isShare
                                  ? Container(
                                      child: Text(
                                        "Shubham's Feed",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    )
                                  : Column(
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
                                              color: Colors.black87,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                    isShare
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: FloatingActionButton(
                                child: Icon(Icons.share),
                                onPressed: () {
                                  setState(() {
                                    isShare = true;
                                    _capturePng();
                                  });
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
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
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          if (orientation.index == 1) {
            print("RIGHT");
          } else if (orientation.index == 0) {
            print("LEFT");
          }
        });
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      inside = true;
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();

      if (boundary.debugNeedsPaint) {
        Timer(Duration(seconds: 1), () => _capturePng());
        return null;
      }

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

//      String bs64 = base64Encode(pngBytes);
//      print(pngBytes);
//      print(bs64);
      await WcFlutterShare.share(
          sharePopupTitle: "Share News",
          fileName: 'share.png',
          mimeType: 'image/png',
          bytesOfFile: pngBytes);

      print('png done');
      setState(() {
        imageInMemory = pngBytes;
        inside = false;
//        showDialog(
//            context: context,
//            builder: (context) {
//              return Container(
//                child: Image.memory(imageInMemory),
//              );
//            });
      });
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }
}
