import 'dart:async';

import 'package:finland/managers/finland_route_manager.dart';
import 'package:finland/managers/place_manager.dart';
import 'package:finland/managers/premium_manager.dart';
import 'package:finland/screens/screens.dart';
import 'package:finland/services/preferences_services.dart';
import 'package:finland/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'managers/news_manager.dart';
import 'screens/onboardings/onboardings.dart';

late final PreferencesService service;
late final SharedPreferences prefs;

void main() => runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      prefs = await SharedPreferences.getInstance();
      service = PreferencesService(preferences: prefs);
      runApp(
        ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (
            BuildContext context,
            Widget? child,
          ) =>
              const MyApp(),
        ),
      );
    }, (error, stack) {
      if (kDebugMode) {
        print(error);
        print(stack);
      }
    });

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    final isFirstOpen = prefs.getBool('IS_FIRST_OPEN') ?? true;
    prefs.setBool('IS_FIRST_OPEN', false);

    final initialLocation = isFirstOpen ? '/splash' : '/routes';
    _router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: '/splash',
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const SplashScreen(),
          ),
        ),
        GoRoute(
          path: '/onboarding1',
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const Onboarding1(),
          ),
        ),
        GoRoute(
          path: '/onboarding2',
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const Onboarding2(),
          ),
        ),
        GoRoute(
          path: '/onboarding3',
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const Onboarding3(),
          ),
        ),
        ShellRoute(
          pageBuilder: (context, state, child) {
            final hasBottomBar =
                !(state.fullPath?.contains('opened_route') ?? true) &&
                    !(state.fullPath?.contains('opened_news') ?? true) &&
                    !(state.fullPath?.contains('opened_place') ?? true);

            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: hasBottomBar ? NavigationScreen(child: child) : child,
            );
          },
          routes: [
            GoRoute(
              path: '/routes',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const RoutesScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'opened_route',
                  pageBuilder: (context, state) {
                    var id = state.uri.queryParameters['id'] ?? '0';
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: OpenedRoute(
                        finlandRoute: FinlandRouteHelper.getFinlandRoute(id),
                      ),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/news',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const NewsScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'opened_news',
                  pageBuilder: (context, state) {
                    var id = state.uri.queryParameters['id'] ?? '0';
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: OpenedNews(
                        news: NewsHelper.getNews(id),
                      ),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/places',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const PlacesScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'opened_place',
                  pageBuilder: (context, state) {
                    var id = state.uri.queryParameters['id'] ?? '0';
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: OpenedPlace(place: PlacesHelper.getPlace(id)),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const SettingsScreen(),
              ),
            ),
          ],
        ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => PlaceManager(service),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              FinlandRouteManager(service: service),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NewsManager(service: service),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              PremiumManager(preferencesService: service),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
