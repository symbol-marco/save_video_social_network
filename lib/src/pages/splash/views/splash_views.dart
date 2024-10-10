import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:save_video_social_network/src/pages/getting_started/views/getting_started.dart';
import 'package:save_video_social_network/src/pages/home/views/home_views.dart';

class SplashViews extends StatefulWidget {
  static const name = 'splash-views';
  const SplashViews({super.key});

  @override
  State<SplashViews> createState() => _SplashViewsState();
}

class _SplashViewsState extends State<SplashViews> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3),
          () => context.goNamed(GettingStartedViews.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        gradient:
            LinearGradient(colors: [Color(0xff00c6ff), Color(0xff0072ff)]),
      ),
      child: const Center(
        child: AnimatedOpacity(opacity: 0.2, duration: Duration(seconds: 3)),
      ),
    ));
  }
}
