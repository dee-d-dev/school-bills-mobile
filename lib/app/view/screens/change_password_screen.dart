import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/core/routes/routes.dart';
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
              Text('Change password', style: Config.h3),
              Config.vGap20,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Current password',
              ),
              Config.vGap15,
              CustomTextField(
                onChanged: (val) {},
                hint: 'New password',
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
          CustomButton(
            hPadding: 20,
            text: 'Continue',
            onPressed: () => context.go(Routes.home),
          ),
          Config.vGap20,
        ],
      ),
    );
  }
}
