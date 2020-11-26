import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                    elevation: 5,
                    color: Colors.grey[350],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          size: 60,
                        ),
                        title: Text(
                          "Google News is a news aggregator service developed by Google. It presents a continuous.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )),
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
