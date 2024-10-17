import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:save_video_social_network/src/pages/home/views/home_views.dart';
import 'package:save_video_social_network/src/pages/root/views/sv_navigation_bar.dart';

class RootViews extends StatefulWidget {
  const RootViews({super.key, required this.child});

  final Widget child;

  @override
  State<RootViews> createState() => _RootViewsState();
}

class _RootViewsState extends State<RootViews> {
  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          final routerState = GoRouterState.of(context);
          if (routerState.matchedLocation != "/") {
            context.goNamed(HomeViews.name);
          }
        },
        child: Scaffold(
          extendBody: true,
          drawerScrimColor: Colors.transparent,
          body: widget.child,
          bottomNavigationBar: const SvNavigationBar(),
        ));
  }
}
