import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => MyApp()),
                (route)=> false));
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0x2A197CFF),Color(0xFF172165)]
            ),
          ),
          child: Center(
            child: Image.asset("assets/ob_havo.png", width: 220, ),
          ),
        )
    );
  }
}
