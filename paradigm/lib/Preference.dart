import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paradigm/WidgetItems.dart';

class CategorialPage extends StatefulWidget {
  @override
  _CategorialPageState createState() => _CategorialPageState();
}

class _CategorialPageState extends State<CategorialPage> {
  int getChidCunt() {
    int i = 0;
    int count = 0;
    for (i = 0; i < WidgetsItem.isChecked.length; i++) {
      if (WidgetsItem.isChecked[i]) {
        count = count + 1;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("PREFERENCES"),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          child: GridView.builder(
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 3)),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (WidgetsItem.isChecked[index]) {
                                WidgetsItem.isChecked[index] = false;
                              } else {
                                WidgetsItem.isChecked[index] = true;
                              }
                              WidgetsItem.count = getChidCunt();
                            });
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 10),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        WidgetsItem.imageUrls[index])),
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'SPORT',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  WidgetsItem.isChecked[index]
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              )),
                        )
                      : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
