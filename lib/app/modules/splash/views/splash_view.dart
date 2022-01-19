import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FlutterLogo(),
          Positioned(
            left: 100,
            child: Center(child: Image.asset('assets/firestore.png',height: IconTheme.of(context).size,width: IconTheme.of(context).size,))
          )
        ],
      ),
    );
  }
}
