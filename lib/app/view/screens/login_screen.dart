import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/app/view/provider/auth_state.dart';
import 'package:school_bills/core/platform_specific/platform_progress_indicator.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';
import 'package:school_bills/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrMatNoCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Config.contentPadding(h: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Log in', style: Config.h3),
              Config.vGap20,
              CustomTextField(
                controller: _emailOrMatNoCtrl,
                hint: 'Email or Matric Number',
              ),
              Config.vGap15,
              CustomTextField(
                controller: _passwordCtrl,
                hint: 'Password',
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.vGap15,
          Consumer(builder: (context, ref, child) {
            return switch (ref.watch(authProvider).state) {
              AuthLoadingState.signingIn => const PlatformProgressIndicator(),
              _ => CustomButton(
                  hPadding: 20,
                  text: 'Continue',
                  onPressed: () async {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (!isValid) return;
                    await ref
                        .watch(authProvider.notifier)
                        .signIn(
                          emailOrMatNo: _emailOrMatNoCtrl.text,
                          password: _passwordCtrl.text,
                        )
                        .then((success) {
                      if (success) {
                        context.go(Routes.home);
                      }
                    });
                  },
                )
            };
          }),
          Config.vGap20,
        ],
      ),
    );
  }
}
