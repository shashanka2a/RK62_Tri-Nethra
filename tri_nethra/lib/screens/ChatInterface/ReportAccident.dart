import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class RAA extends StatefulWidget {
  @override
  _RAAState createState() => _RAAState();
}

class _RAAState extends State<RAA> {
  IconData i1 = Icons.panorama_fish_eye,
      i2 = Icons.panorama_fish_eye,
      i3 = Icons.panorama_fish_eye;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
              Colors.orange[900],
              Colors.orange[300],
              Colors.orange[200]
            ])),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: AppBar().preferredSize.height / 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      print("Popping from RAA page");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: OrPop(
                popcolor: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: [
                        Text(
                          'Accident BLOCK'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.orange,
                              fontFamily: 'Quicksand',
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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