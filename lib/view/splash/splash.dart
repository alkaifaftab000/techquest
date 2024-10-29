import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/view/splash/splash_service.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final service = SplashService();
  @override
  void initState() {
    super.initState();
    service.isUserLoggedIn(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage('lib/constant/images/splash.gif')),
              const SizedBox(height: 30),
              LoadingAnimationWidget.inkDrop(
                color: Colors.grey.shade700,
                size: 35,
              ),
              const SizedBox(height: 100),
            Text('TechQuest',style: AppText.appTextStyleBody(35,FontWeight.bold)),
            const SizedBox(height: 30),
            Text('🚀Conquer the Future 🌟 Quiz Your Way to Tech Mastery! 🧠',style: AppText.appTextStyleBody(20,FontWeight.bold),textAlign: TextAlign.center,), const SizedBox(height: 50),
          ],),
        ),
      ),
    );
  }
}
