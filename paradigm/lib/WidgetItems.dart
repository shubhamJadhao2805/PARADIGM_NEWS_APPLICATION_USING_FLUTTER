import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WidgetsItem {
  static List<dynamic> headLines;
  static List<dynamic> imageUrls;
//  static List<dynamic> headLines = [
//    '10 favourite stocks of mutual funds',
//    "ESO's virtual tour: Travel to outer space from the comfort of your home",
//    'Bharat Sikka on ‘The Sapper’ and his search for his father',
//    'Opinion I Carrying The Weight of The Band',
//    'Opinion | Why there’s no creativity in this column',
//    'At current pace, India likely to reach 1.5 million cases in 11 days',
//    'Your morning ritual now travels with you!',
//    'India tells US that digital tax on Google, Amazon isn’t biased',
//    'How growth reshaped India’s destiny, and why we need an encore',
//    'Income tax department changes Form 26AS from this assessment year',
//    'Lockdown impacts real estate market dynamics in NCR, average deal size shrinks',
//    'Day’s most important news delivered to your inbox with our newsletters',
//    'Total lockdown in Kerala coastal areas to flatten community spread curve',
//    'Coronavirus update: India records nearly 35,000 cases in a day',
//    'Jio Glass faces an uphill ride as virtual/mixed realty products remain niche',
//    'For first time, world records 1 million coronavirus cases in 100 hours',
//    "When Ratan Tata first visited the ‘legacy city' of the Tata Family",
//    'Hyderabad airport gets complete contactless parking using FASTags',
//    'Most of world to face coronavirus without Covid-19 vaccine, says expert',
//    'The face mask of the future',
//    'Over 700 universities inform UGC about status of exams',
//  ];

//  static var imageUrls = [
//    'https://images.livemint.com/img/2020/07/18/600x338/hdfc3-kDUD--621x414@LiveMint_1595059414695.JPG',
//    'https://images.livemint.com/img/2020/07/18/600x338/PTI9_20_2019_000072A_1571367193658_1595058381970.jpg',
//    'https://images.livemint.com/img/2020/07/18/600x338/07194d42-c82d-11ea-9ddf-03e7e83efe44_1595053442444_1595053482497.jpg',
//    'https://images.livemint.com/img/2020/07/18/600x338/2020-07-01T133844Z_1_LYNXMPEG603NX_RTROPTP_3_EUROPE-TECH-GOOGLE-ANTITRUST_1595050256388_1595050272889.JPG',
//    'https://images.livemint.com/img/2020/07/18/600x338/Growth_1595035958835_1595035963084.png',
//    'https://images.livemint.com/img/2020/07/18/600x338/income_tax-kTmG--621x414@LiveMint_1595059715117.jpg',
//    'https://images.livemint.com/img/2020/07/18/600x338/realestate-k0jG--621x414@LiveMint_1595053514767.jpg',
//    'https://images.livemint.com/img/2020/07/18/600x338/fef98630-7a5d-11ea-8fc6-66b54046f67d_1588519703508_1595059801151.jpg',
//    'https://images.livemint.com/img/2020/07/18/600x338/AFP_1V824F_1594884364583_1595041322543.jpg',
//  ];

  static var isChecked = [true, false, true, false, false, false, true, true];

  static var count = 0;
  static var isDataLoaded = false;

//display ope section
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.grey[700],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50))),
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            margin: EdgeInsets.only(top: 0, left: 0, right: 0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Opinions",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomScrollView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    slivers: <Widget>[
                      SliverFixedExtentList(
                          itemExtent: 220,
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 20, right: 20),
                                alignment: Alignment.center,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.account_circle,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "USERNAME",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: 1,
                                          ),
                                        ),
                                        Text(
                                          "5 hours ago",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Card(
                                        margin: EdgeInsets.only(top: 20),
                                        color: Colors.grey[400],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(top: 30),
                                          child: Column(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  " ",
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 8,
                                                    bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.thumb_up,
                                                        size: 30,
                                                        color: Colors.green,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                    Text(
                                                      "312",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: 1,
                                                      ),
                                                    ),
                                                    FlatButton(
                                                      child: Text(
                                                        "REPLY",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      onPressed: () {},
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 15,
                                      ),
                                      height: 2,
                                      color: Colors.grey[500],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }, childCount: 7))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

//gesture for WebView
  final Set<Factory> gestureRecognizers = [
    Factory(() => EagerGestureRecognizer()),
  ].toSet();

  // To display webView
  void displayWebView(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.black38,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        context: context,
        builder: (ctx) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(45), topLeft: Radius.circular(45)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: WebView(
                gestureNavigationEnabled: true,
                gestureRecognizers: gestureRecognizers,
                initialUrl:
                    "https://www.bbc.com/news/world-asia-india-53485039",
                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (String url) {
                  Navigator.pop(context);
                },
                onPageFinished: (String url) {},
                onWebViewCreated: (url) {
                  AlertDialog alert = AlertDialog(
                    content: new Row(
                      children: [
                        CircularProgressIndicator(),
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("Loading")),
                      ],
                    ),
                  );
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                onWebResourceError: (url) {
                  Navigator.pop(context);
                  final snackBar = SnackBar(content: Text("Failed!"));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          );
        });
  }
}
