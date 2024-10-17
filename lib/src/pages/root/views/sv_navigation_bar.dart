import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:save_video_social_network/src/generated/assets.gen.dart';
import 'package:save_video_social_network/src/pages/root/notifiers/change_navbar_notifiers.dart';

final navigationPanelHeight = StateProvider<double>((ref) => 50);

class SvNavigationBar extends ConsumerStatefulWidget {
  const SvNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SvNavigationBarState();
}

class _SvNavigationBarState extends ConsumerState<SvNavigationBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  final duration = const Duration(milliseconds: 700);
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: duration, reverseDuration: duration);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navbarIndexState = ref.watch(bottomNavControllerProvider);

    final panelHeight = ref.watch(navigationPanelHeight);
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: 50,
      child: ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: CurvedNavigationBar(
                height: panelHeight,
                backgroundColor:
                    theme.colorScheme.secondaryContainer.withOpacity(0.72),
                color: theme.colorScheme.surface,
                animationDuration: const Duration(milliseconds: 350),
                index: navbarIndexState.currentIndex,
                onTap: (value) => ref
                    .read(bottomNavControllerProvider.notifier)
                    .selectTab(value, _animationController),
                items: [
                  Assets.lottie.home.lottie(
                      controller: _animationController,
                      onLoaded: (composition) => _animationController
                        ..duration = composition.duration),
                  Assets.lottie.bookmarkTag.lottie(
                      controller: _animationController,
                      onLoaded: (composition) => _animationController
                        ..duration = composition.duration),
                  Assets.lottie.account.lottie(
                      controller: _animationController,
                      onLoaded: (composition) => _animationController
                        ..duration = composition.duration),
                ])),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
