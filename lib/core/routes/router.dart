import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/screen/admin_signup_screen.dart';
import 'package:school_bills/app/view/screen/auth_screen.dart';
import 'package:school_bills/app/view/screen/change_password_screen.dart';
import 'package:school_bills/app/view/screen/home_screen.dart';
import 'package:school_bills/app/view/screen/index_screen.dart';
import 'package:school_bills/app/view/screen/login_screen.dart';
import 'package:school_bills/app/view/screen/profile_screen.dart';
import 'package:school_bills/app/view/screen/reciept_screen.dart';
import 'package:school_bills/app/view/screen/article_screen.dart';
import 'package:school_bills/app/view/screen/setting_screen.dart';
import 'package:school_bills/app/view/screen/student_signup_screen.dart';
import 'package:school_bills/app/view/screen/transaction_screen.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/config.dart';

abstract class AppRoute {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _homeNavigatorKey = GlobalKey<NavigatorState>();
  static final _transactionNavigatorKey = GlobalKey<NavigatorState>();
  static final _articleNavigatorKey = GlobalKey<NavigatorState>();
  static final _settingNavigatorKey = GlobalKey<NavigatorState>();

  static Page<dynamic> pushPage(Widget screen) {
    if (Config.isAndroid) {
      return MaterialPage<void>(child: screen);
    }
    return CupertinoPage(child: screen);
  }

  static final router = GoRouter(
    initialLocation: Routes.auth,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.auth,
        name: Routes.auth.routeName,
        pageBuilder: (context, state) => pushPage(const AuthScreen()),
        routes: [
          GoRoute(
            path: Routes.login,
            name: Routes.login.routeName,
            pageBuilder: (context, state) => pushPage(const LoginScreen()),
          ),
          GoRoute(
            path: Routes.studentSignup,
            name: Routes.studentSignup.routeName,
            pageBuilder: (context, state) =>
                pushPage(const StudentSignupScreen()),
          ),
          GoRoute(
            path: Routes.adminSignup,
            name: Routes.adminSignup.routeName,
            pageBuilder: (context, state) =>
                pushPage(const AdminSignupScreen()),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return IndexScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.home,
                name: Routes.home.routeName,
                pageBuilder: (context, state) => pushPage(const HomeScreen()),
                routes: const [
                  // child route
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _transactionNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.transaction,
                name: Routes.transaction.routeName,
                pageBuilder: (context, state) =>
                    pushPage(const TransactionScreen()),
                routes: [
                  GoRoute(
                    path: Routes.reciept,
                    name: Routes.reciept.routeName,
                    pageBuilder: (context, state) =>
                        pushPage(const RecieptScreen()),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _articleNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.article,
                name: Routes.article.routeName,
                pageBuilder: (context, state) =>
                    pushPage(const ArticleScreen()),
                routes: const [
                  // child route
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.settings,
                name: Routes.settings.routeName,
                pageBuilder: (context, state) =>
                    pushPage(const SettingScreen()),
                routes: [
                  GoRoute(
                    path: Routes.profile,
                    name: Routes.profile.routeName,
                    pageBuilder: (context, state) =>
                        pushPage(const ProfileScreen()),
                  ),
                  GoRoute(
                    path: Routes.changePassword,
                    name: Routes.changePassword.routeName,
                    pageBuilder: (context, state) =>
                        pushPage(const ChangePasswordScreen()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
