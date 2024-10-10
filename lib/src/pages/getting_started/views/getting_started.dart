import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:save_video_social_network/src/generated/l10n.dart';
import 'package:save_video_social_network/src/pages/home/views/home_views.dart';
import 'package:save_video_social_network/src/pages/splash/views/splash_views.dart';

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
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      onDone: () => _onIntroEnd,
      onSkip: () => _onIntroEnd,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 16, right: 16),
        ),
      ),
      pages: _introPages,
    );
  }

  List<PageViewModel> get _introPages => [PageViewModel(body: S.current.setting)];

  void _onIntroEnd(BuildContext context) => context.goNamed(HomeViews.name);
}
