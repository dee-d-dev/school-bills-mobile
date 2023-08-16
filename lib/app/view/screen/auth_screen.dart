import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.vGap14,
          CustomButton(
            hPadding: 20,
            text: 'Log in',
            onPressed: () => context.goNamed(Routes.login),
          ),
          Config.vGap14,
          CustomButton(
            hPadding: 20,
            text: 'Student sign up',
            onPressed: () => context.goNamed(Routes.studentSignup),
          ),
          Config.vGap14,
          CustomButton(
            hPadding: 20,
            text: 'Admin sign up',
            onPressed: () => context.goNamed(Routes.adminSignup),
          ),
          Config.vGap20,
        ],
      ),
    );
  }
}
