// ignore_for_file: deprecated_member_use, must_be_immutable


import 'package:fanchat_admin/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  Widget? widget;

  SplashScreen({super.key, this.widget});
  void selectScreen(context) {

    widget = const LoginScreen();

  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController controller;
  @override
  void initState() {
    widget.selectScreen(context);
    controller = VideoPlayerController.asset("assets/images/fanVideo.mp4")
      ..initialize().then((value) {
        setState(() {
          controller.play();
        });
      });
    Future.delayed(const Duration(seconds: 3), () {
      widget.selectScreen(context);

      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return widget.widget!;
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          toolbarHeight: 0.0,
          elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0Xff000f2c),
              statusBarIconBrightness: Brightness.light)),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,

        width: MediaQuery.of(context).size.width,
        child: controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        )
            : Container(),
      ),
    );
  }
}
