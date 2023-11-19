import 'package:flutter/material.dart';
import './sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double widthSize = 0.0;
  double heightSize = 0.0;

  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;

  @override
  void initState() {

    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 4))..repeat(reverse: false);

    _alignAnimation = Tween<Alignment>(
        begin: Alignment.bottomCenter,
        end: Alignment.center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(const Duration(milliseconds: 5000), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    });
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: buildColumn(),
    );
  }
  Widget buildColumn() {
    return Container(
      width: widthSize,
      height: heightSize,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: AlignTransition(
        alignment: _alignAnimation,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Power of Pedal',style: TextStyle(fontSize: 20,),),
        ),
      ),
    );
  }
}

