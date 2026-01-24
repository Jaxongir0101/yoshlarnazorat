import 'package:go_router/go_router.dart';
import 'package:yoshlar/main.dart';
import 'package:yoshlar/presentation/auth/auth_page.dart';
import 'package:yoshlar/presentation/main/main_screen.dart';
import 'package:yoshlar/presentation/splash/splash_page.dart';

class AppRouter {
  GoRouter router() => GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: LoginPage.routeName,
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: SplashPage.routeName,
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        name: MainScreen.routeName,
        path: '/main',
        builder: (context, state) => MainScreen(),
      ),
    ],
  );
}
