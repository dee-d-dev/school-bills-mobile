import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/data/models/transaction_model.dart';
import 'package:school_bills/app/view/screens/admin_signup_screen.dart';
import 'package:school_bills/app/view/screens/auth_screen.dart';
import 'package:school_bills/app/view/screens/browser_screen.dart';
import 'package:school_bills/app/view/screens/change_password_screen.dart';
import 'package:school_bills/app/view/screens/create_bill_screen.dart';
import 'package:school_bills/app/view/screens/home_screen.dart';
import 'package:school_bills/app/view/index_screen.dart';
import 'package:school_bills/app/view/screens/login_screen.dart';
import 'package:school_bills/app/view/screens/profile_screen.dart';
import 'package:school_bills/app/view/screens/reciept_screen.dart';
import 'package:school_bills/app/view/screens/article_screen.dart';
import 'package:school_bills/app/view/screens/setting_screen.dart';
import 'package:school_bills/app/view/screens/student_signup_screen.dart';
import 'package:school_bills/app/view/screens/transaction_screen.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/config.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final homeNavigatorKey = GlobalKey<NavigatorState>();
  final transactionNavigatorKey = GlobalKey<NavigatorState>();
  final articleNavigatorKey = GlobalKey<NavigatorState>();
  final settingNavigatorKey = GlobalKey<NavigatorState>();

  Page<dynamic> pushPage(Widget screen) {
    if (Config.isAndroid) {
      return MaterialPage<void>(child: screen);
    }
    return CupertinoPage(child: screen);
  }

  GoRoute route({
    required String path,
    required Widget? screen,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    List<RouteBase> routes = const <RouteBase>[],
  }) {
    return GoRoute(
      path: path,
      name: path.name,
      pageBuilder: pageBuilder ?? (_, __) => pushPage(screen!),
      routes: routes,
    );
  }

  return GoRouter(
    initialLocation: Routes.auth,
    navigatorKey: rootNavigatorKey,
    routes: [
      route(
        path: Routes.auth,
        screen: const AuthScreen(),
        routes: [
          route(path: Routes.login, screen: const LoginScreen()),
          route(
              path: Routes.studentSignup, screen: const StudentSignupScreen()),
          route(path: Routes.adminSignup, screen: const AdminSignupScreen()),
        ],
      ),
      route(
        path: Routes.browser,
        screen: null,
        pageBuilder: (context, state) {
          return pushPage(BrowserScreen(url: (state.extra ?? '') as String));
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return IndexScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              route(
                path: Routes.home,
                screen: const HomeScreen(),
                routes: [
                  route(
                    path: Routes.createBill,
                    screen: const CreateBillScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: transactionNavigatorKey,
            routes: [
              route(
                path: Routes.transaction,
                screen: const TransactionScreen(),
                routes: [
                  route(
                    path: Routes.reciept,
                    screen: null,
                    pageBuilder: (context, state) {
                      return pushPage(RecieptScreen(
                          transaction: state.extra as TransactionModel));
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: articleNavigatorKey,
            routes: [
              route(
                path: Routes.article,
                screen: const ArticleScreen(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingNavigatorKey,
            routes: [
              route(
                path: Routes.settings,
                screen: const SettingScreen(),
                routes: [
                  route(
                    path: Routes.profile,
                    screen: const ProfileScreen(),
                  ),
                  route(
                    path: Routes.changePassword,
                    screen: const ChangePasswordScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
