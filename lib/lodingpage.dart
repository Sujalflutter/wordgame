import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wordgame/main.dart';

class one extends StatefulWidget {
  const one({Key? key}) : super(key: key);

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("loding/99680-3-dots-loading.json")),
    );
  }

  @override
  void initState() {
    super.initState();

    lod();
  }

  void lod() {
    
    Future.delayed(Duration(seconds: 5)).then((value) {
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return first();
      },));
    });
  }
}
