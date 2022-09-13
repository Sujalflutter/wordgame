import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';


class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  int? rr;
  String imagepath = "", spelling = "";
  List someimage = [], bottomlist = [], anslist = [], toplist = [];
  Map map = {};

  bool sk = false;

  FlutterTts flutterTts = FlutterTts();

  final Player = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // playmusic();
    // Add the observer.
    _initImages();
  }


  // playmusic()
  // async {
  //   await Player.play();
  // }

  Future _initImages() async {


    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('image/'))
        .where((String key) => key.contains('.webp'))
        .toList();

    setState(() {
      // AssetsAudioPlayer.newPlayer().open(
      //   Audio("audio/BoxCat-Games-Battle-Boss.mp3"),
      //   showNotification: true,
      // );

      // @override
      // void didChangeAppLifecycleState(AppLifecycleState state) {
      //   print("==All  --->  $state");
      //   // These are the callbacks
      //   setState(() {
      //     switch (state) {
      //       case AppLifecycleState.resumed:
      //       // widget is resumed
      //         playmusic();
      //         print("==resumed");
      //         break;
      //       case AppLifecycleState.inactive:
      //       // widget is inactive
      //
      //         print("==inactive");
      //         break;
      //       case AppLifecycleState.paused:
      //       // widget is paused
      //         print("==paused");
      //         break;
      //       case AppLifecycleState.detached:
      //       // widget is detached
      //         print("==detached");
      //         break;
      //     }
      //   });
      // }

      someimage = imagePaths;
      print(someimage);

      int rr = Random().nextInt(someimage.length);
      print(rr);

      imagepath = someimage[rr]; //image/sky.webp
      print(imagepath);

      spelling = imagepath.split("/")[1].split("\.")[0]; //sky
      print(spelling);

      anslist = spelling.split(""); //[s,k,y]
      print(anslist);

      toplist = List.filled(anslist.length, ""); //[,,]
      print(toplist);

      String alphabet = "abcdefghijklmnopqrstuvwxyz";
      List alpha = alphabet.split("");
      print(alpha);
      alpha.shuffle();
      print(alpha);

      bottomlist = alpha.getRange(0, 10 - anslist.length).toList();
      print(bottomlist);
      bottomlist.addAll(anslist);
      print(bottomlist);
      bottomlist.shuffle();
      print(bottomlist);

      sk = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;
    double st = MediaQuery.of(context).padding.top;
    double nt = MediaQuery.of(context).padding.bottom;
    double tbody = th - st - nt;
    return sk
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: Container(
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.settings_applications)),
              ),
              title: Center(child: Text("1")),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: th * 0.018,
                            width: tw,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("image/game_top.png"),
                            )),
                          ),
                          Container(
                            height: th * 0.18,
                            width: tw * 0.35,
                            margin: EdgeInsets.only(
                                top: th * 0.010, bottom: th * 0.060),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(imagepath))),
                          ),
                          Container(
                            height: th * 0.060,
                            alignment: Alignment.center,
                            child: GridView.builder(
                                itemCount: toplist.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (toplist != "") {
                                          if (bottomlist[map[index]] == "") {
                                            AssetsAudioPlayer.newPlayer().open(
                                              Audio("audio/edt.wav"),
                                              showNotification: true,
                                            );
                                            bottomlist[map[index]] =
                                                toplist[index];
                                            toplist[index] = "";
                                          }
                                        }
                                        win(th);
                                      });
                                    },
                                    child: Container(
                                      height: th * 0.05,
                                      width: th * 0.05,
                                      margin: EdgeInsets.all(th * 0.0010),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: anscolors,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.white, width: 1)),
                                      child: Text(
                                        "${toplist[index].toString().toUpperCase()}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: th * 0.025),
                                      ),
                                    ),
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1)),
                          )
                        ],
                      ),
                      height: th * 0.40,
                      width: tw,
                      color: Colors.black,
                    )
                  ],
                ),
                Container(
                  height: th * 0.10,
                  alignment: Alignment.center,
                ),
                Container(
                  height: th * 0.13,
                  margin: EdgeInsets.only(top: th * 0.12),
                  alignment: Alignment.center,
                  child: GridView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 10) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      actions: [
                                        Container(
                                          height: 280,
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                color: Colors.red,
                                                child: Text("HINT"),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  flutterTts.speak("$spelling");
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "image/wordspeach.png"))),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  flutterTts.speak("$anslist");
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "image/letterspeach.png"))),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                width: 50,
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "image/writeletter.png"))),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 70,
                                                alignment: Alignment.center,
                                                color: Colors.red,
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("CANCEL")),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  context: context);
                            },
                            child: Container(
                              height: th * 0.05,
                              width: tw * 0.1,
                              color: Colors.green,
                              margin: EdgeInsets.all(th * 0.0040),
                              child: Icon(Icons.lightbulb),
                            ),
                          );
                        } else if (index == 11) {
                          return Container(
                            height: th * 0.05,
                            width: tw * 0.1,
                            color: Colors.red,
                            margin: EdgeInsets.all(th * 0.0040),
                            child: Icon(Icons.cancel),
                          );
                        } else {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (bottomlist[index] != "") {
                                  for (int i = 0; i < toplist.length; i++) {
                                    if (toplist[i] == "") {
                                      AssetsAudioPlayer.newPlayer().open(
                                        Audio("audio/popup.wav"),
                                        showNotification: true,
                                      );

                                      toplist[i] = bottomlist[index];
                                      print("12345676432345434543$toplist");
                                      bottomlist[index] = "";
                                      map[i] = index;
                                      break;
                                    }
                                  }
                                }
                                win(th);
                              });
                            },
                            child: Container(
                              // height: th * 0.05,
                              // width: th * 0.05,
                              // margin: EdgeInsets.only(top: th * 0.010),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: Text(
                                  bottomlist[index].toString().toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: th * 0.025)),
                            ),
                          );
                        }
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2)),
                ),
              ],
            ),
          )
        : CircularProgressIndicator();
  }

  Color anscolors = Colors.orangeAccent;
  String ans = "";

  void win(double th) {
    setState(() {
      ans = toplist.join();

      if (ans == anslist.join()) {
        anscolors = Colors.green;
        showDialog(
            builder: (context) {
              return Dialog(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    height: 350,
                    width: 50,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage("image/score_text.png"),
                                  )),
                                  child: Center(child: Text("EXCELLENT")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 200,
                              margin: EdgeInsets.only(bottom: th * 0.040),
                              child: Center(
                                  child: Lottie.asset(
                                      "loding/74659-confetti-day.json")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("image/score_star.png"),
                              )),
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return second();
                                    },
                                  ));
                                },
                                child: Container(
                                  height: 50,
                                  color: Colors.orange,
                                  alignment: Alignment.center,
                                  child: Text("CONTINUE"),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
            },
            context: context);
      } else if (ans != anslist.join() && ans.length == anslist.length) {
        anscolors = Colors.red;
        AssetsAudioPlayer.newPlayer().open(
          Audio("audio/wro.mp3"),
          showNotification: true,
        );
      } else {
        anscolors = Colors.orangeAccent;
      }
    });
  }
}
