import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:save_video_social_network/src/pages/choose_language/views/choose_language_views.dart';
import 'package:save_video_social_network/src/pages/getting_started/views/getting_started.dart';
import 'package:save_video_social_network/src/pages/home/views/home_views.dart';
import 'package:save_video_social_network/src/pages/option_download/option_download_views.dart';
import 'package:save_video_social_network/src/pages/payment/views/payment_views.dart';
import 'package:save_video_social_network/src/pages/root/views/root_views.dart';
import 'package:save_video_social_network/src/pages/splash/views/splash_views.dart';
import 'package:save_video_social_network/src/pages/storage_videos/views/storage_videos_views.dart';

import '../common/views/snap_panda_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRouteNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider((ref) {
  return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: "/splash",
      routes: [
        GoRoute(
          path: "/splash",
          name: SplashViews.name,
          pageBuilder: (context, state) =>
              const SnapPandaPage(child: SplashViews()),
        ),
        ShellRoute(
            navigatorKey: shellRouteNavigatorKey,
            builder: (context, state, child) => RootViews(child: child),
            routes: [
              GoRoute(
                path: "/",
                name: HomeViews.name,
                pageBuilder: (context, state) =>
                    const SnapPandaPage(child: HomeViews()),
              ),
              GoRoute(
                path: "/payments",
                name: PaymentViews.name,
                pageBuilder: (context, state) =>
                    const SnapPandaPage(child: PaymentViews()),
              ),
              GoRoute(
                path: "/getting-started",
                name: GettingStartedViews.name,
                pageBuilder: (context, state) =>
                    const SnapPandaPage(child: GettingStartedViews()),
              ),
              GoRoute(
                path: "/choose-language",
                name: ChooseLanguageViews.name,
                pageBuilder: (context, state) =>
                    const SnapPandaPage(child: ChooseLanguageViews()),
              ),
              GoRoute(
                path: "/storage-videos",
                name: StorageVideosViews.name,
                pageBuilder: (context, state) =>
                    const SnapPandaPage(child: StorageVideosViews()),
              ),
              GoRoute(
                path: "/option-download",
                name: OptionDownloadViews.name,
                pageBuilder: (context, state) =>
                    const SnapPandaPage(child: OptionDownloadViews()),
              ),
            ])
      ]);
});
