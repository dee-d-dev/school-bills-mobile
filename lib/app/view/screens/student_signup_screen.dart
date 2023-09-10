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

class StudentSignupScreen extends StatefulWidget {
  const StudentSignupScreen({super.key});

  @override
  State<StudentSignupScreen> createState() => _StudentSignupScreenState();
}

class _StudentSignupScreenState extends State<StudentSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _departmentCtrl = TextEditingController();
  final _matricNoCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
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
              Text('Student sign up', style: Config.h3),
              Config.vGap20,
              CustomTextField(
                controller: _firstNameCtrl,
                hint: 'First Name',
              ),
              Config.vGap15,
              CustomTextField(
                controller: _lastNameCtrl,
                hint: 'Last Name',
              ),
              Config.vGap15,
              CustomTextField(
                controller: _departmentCtrl,
                hint: 'Department',
              ),
              Config.vGap15,
              CustomTextField(
                controller: _matricNoCtrl,
                hint: 'Matriculation Number',
              ),
              Config.vGap15,
              CustomTextField(
                controller: _emailCtrl,
                hint: 'Email',
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
              AuthLoadingState.signingUp => const PlatformProgressIndicator(),
              AuthLoadingState.signingIn => const PlatformProgressIndicator(),
              _ => CustomButton(
                  hPadding: 20,
                  text: 'Continue',
                  onPressed: () async {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (!isValid) return;
                    await ref
                        .watch(authProvider.notifier)
                        .signUp(
                          firstName: _firstNameCtrl.text,
                          lastName: _lastNameCtrl.text,
                          department: _departmentCtrl.text,
                          email: _emailCtrl.text,
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
