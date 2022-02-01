import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              left: 50,
              child: FlutterLogo(size: 150,),
            ),
            Positioned(
              right: 50,
              child: Image.asset('assets/firestore.png',height: 150,width: 150,)
            )
          ],
        ),
      ),
    );
  }
}
