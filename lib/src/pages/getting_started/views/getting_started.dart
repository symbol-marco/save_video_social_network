import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:save_video_social_network/src/generated/assets.gen.dart';
import 'package:save_video_social_network/src/generated/l10n.dart';
import 'package:save_video_social_network/src/pages/home/views/home_views.dart';

class GettingStartedViews extends StatefulWidget {
  static const name = 'getting_started';
  const GettingStartedViews({super.key});

  @override
  State<GettingStartedViews> createState() => _GettingStartedViewsState();
}

class _GettingStartedViewsState extends State<GettingStartedViews> {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      animationDuration: 500,
      next: const SizedBox(),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      pages: _introPages,
      curve: Curves.fastLinearToSlowEaseIn,
      dotsContainerDecorator: const BoxDecoration(color: Color(0xff0072ff)),
    );
  }

  List<PageViewModel> get _introPages => [
        PageViewModel(
            title: S.current.title_intro_started,
            body: S.current.intro_started,
            image: Assets.lottie.pandaIntroStarted.lottie(),
            decoration: pageDecoration),
        PageViewModel(
            title: S.current.title_intro_second,
            body: S.current.intro_second,
            image: Assets.lottie.pandaIntroStarted.lottie(),
            decoration: pageDecoration),
        PageViewModel(
            title: S.current.title_intro_ended,
            body: S.current.intro_ended,
            image: Assets.lottie.pandaIntroStarted.lottie(),
            decoration: pageDecoration),
      ];
  static const bodyStyle = TextStyle(fontSize: 18.0, color: Colors.white);

  static const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      bodyFlex: 1,
      titlePadding: EdgeInsets.only(top: 275),
      bodyPadding: EdgeInsets.only(top: 20),
      boxDecoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Color(0xff00c6ff), Color(0xff0072ff)]),
      ),
      imagePadding: EdgeInsets.only(top: 150));
  void _onIntroEnd(BuildContext context) => context.goNamed(HomeViews.name);
}
