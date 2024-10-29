import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techquest/view/home/initial_home.dart';

class SplashService{
  void isUserLoggedIn(BuildContext context){
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const InitialHome()),
      );
    });

  }
}