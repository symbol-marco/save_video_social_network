import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:save_video_social_network/src/services/logger/logger.dart';
import 'package:save_video_social_network/src/services/sv_store/encrypted_sv_store.dart';
import 'package:save_video_social_network/src/services/sv_store/sv_store.dart';

import 'src/generated/l10n.dart';
import 'src/routes/routes.dart';

Future<void> main() async {
  await SVStoreService.initialize();
  await EncryptedSVStoreService.initialize();
  runApp(const ProviderScope(
      observers: [AppLoggerProviderObserver()], child: Application()));
}

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child ?? const SizedBox.shrink());
      },
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [S.delegate],
      shortcuts: {
        ...WidgetsApp.defaultShortcuts.map((key, value) {
          return MapEntry(
              LogicalKeySet.fromSet(key.triggers?.toSet() ?? {}), value);
        })
      },
    );
  }
}
