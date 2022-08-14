import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late Animation<double> logoAnimation;
  late AnimationController logoController;
  late AnimationStatus current;

  @override
  void dispose() {
    logoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    startTimer();

    logoController = AnimationController(
      duration: Duration(milliseconds: 1250),
      vsync: this,
    );

    logoAnimation = Tween(begin: 0.35, end: 0.5).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.elasticOut,
      ),
    );

    logoController.repeat(reverse: true);
  }

  void startTimer() async {
    await Future.delayed(Duration(milliseconds: 2500));
    Navigator.of(context).pushReplacementNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: logoAnimation,
          builder: (context, child) {
            return Image.asset(
              "assets/logo.png",
              width: MediaQuery.of(context).size.width * logoAnimation.value,
            );
          },
        ),
      ),
    );
  }
}
