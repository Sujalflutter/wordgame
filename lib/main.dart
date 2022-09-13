import 'package:flutter/material.dart';
import 'package:wordgame/levelpage.dart';
import 'package:wordgame/lodingpage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: one(),
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "1 PIC 1 WORD",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.lock)),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.calendar_month))
        ],
      ),
      body: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return second();
                  },));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("image/croup_1.png"),
                    )
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("image/croup_2.png"),
                      opacity: 150
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("image/croup_3.png"),
                        opacity: 150
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("image/croup_4.png"),
                        opacity: 150
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("image/croup_5.png"),
                        opacity: 150
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("image/croup_6.png"),
                        opacity: 150
                    )
                ),
              ),
            )
          ]
      ),
    );
  }
}
