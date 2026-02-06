import 'package:go_router/go_router.dart';
import 'package:yoshlar/main.dart';
import 'package:yoshlar/presentation/auth/auth_page.dart';
import 'package:yoshlar/presentation/nazorat/masullar/widgets/add_masul.dart';
import 'package:yoshlar/presentation/nazorat/masullar/widgets/attacht_yoshlar.dart';
import 'package:yoshlar/presentation/nazorat/masullar/widgets/masul_yoshlar.dart';
import 'package:yoshlar/presentation/nazorat/nazorat_screen.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar_item/add_yoshlar.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar_item/history_into_page.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar_item/nazorat_yoshlar_history.dart';
import 'package:yoshlar/presentation/splash/splash_page.dart';
import 'package:yoshlar/presentation/yoshlar/main/add_activity/add_activity.dart';
import 'package:yoshlar/presentation/yoshlar/main/main_item_screen.dart/history_screen.dart';
import 'package:yoshlar/presentation/yoshlar/main/main_screen.dart';

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
        name: DashboardPage.routeName,
        path: '/nazorat_dashboard',
        routes: [
          GoRoute(
            name: NazoratYoshlarHistory.routeName,
            path: 'nazorat_history',

            builder: (context, state) => NazoratYoshlarHistory(),
          ),
          GoRoute(
            name: AddYouthScreen.routeName,
            path: 'add_youth',
            builder: (context, state) => AddYouthScreen(),
          ),
          GoRoute(
            name: AddOfficerScreen.routeName,
            path: 'add_masul',
            builder: (context, state) => AddOfficerScreen(),
          ),
          GoRoute(
            name: AttachYouthScreen.routeName,
            path: 'attacht_yoshlar',
            builder: (context, state) => AttachYouthScreen(),
          ),
          GoRoute(
            name: NazoratHistoryIntoPage.routeName,
            path: 'history_into_page',
            builder: (context, state) => NazoratHistoryIntoPage(),
          ),

          GoRoute(
            name: MasulYoshlarScreen.routeName,
            path: 'masul_yoshlar',

            builder: (context, state) => MasulYoshlarScreen(),
          ),
        ],
        builder: (context, state) => DashboardPage(),
      ),
      GoRoute(
        name: MainScreen.routeName,
        path: '/main',
        routes: [
          GoRoute(
            name: HistoryPage.routeName,
            path: 'history',
            routes: [
              GoRoute(
                name: AddActivityPage.routeName,
                path: 'add_activity',
                builder: (context, state) => AddActivityPage(),
              ),
            ],
            builder: (context, state) => HistoryPage(),
          ),
        ],
        builder: (context, state) => MainScreen(),
      ),
    ],
  );
}
