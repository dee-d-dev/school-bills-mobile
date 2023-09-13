import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/app/view/provider/auth_state.dart';
import 'package:school_bills/core/platform_specific/platform_progress_indicator.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';
import 'package:school_bills/core/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

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
              Text('Change password', style: Config.textTheme.titleSmall),
              Config.vGap20,
              CustomTextField(
                controller: _passwordCtrl,
                hint: 'New password',
              ),
              Config.vGap15,
              CustomTextField(
                controller: _confirmPasswordCtrl,
                hint: 'Confirm password',
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
              AuthLoadingState.changingPassword =>
                const PlatformProgressIndicator(),
              _ => CustomButton(
                  hPadding: 20,
                  text: 'Continue',
                  onPressed: () async {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (!isValid) return;
                    await ref
                        .watch(authProvider.notifier)
                        .changePassword(
                          password: _passwordCtrl.text,
                          confirmPassword: _confirmPasswordCtrl.text,
                        )
                        .then((success) {
                      if (success) {
                        setState(() {
                          _passwordCtrl.clear();
                          _confirmPasswordCtrl.clear();
                        });
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
