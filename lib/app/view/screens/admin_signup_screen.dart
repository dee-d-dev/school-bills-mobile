import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';
import 'package:school_bills/core/widgets/custom_text_field.dart';

class AdminSignupScreen extends StatefulWidget {
  const AdminSignupScreen({super.key});

  @override
  State<AdminSignupScreen> createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State<AdminSignupScreen> {
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
              Text('Admin sign up', style: Config.textTheme.titleSmall),
              Config.vGap20,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Name',
              ),
              Config.vGap15,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Department',
              ),
              Config.vGap15,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Faculty',
              ),
              Config.vGap15,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Email',
              ),
              Config.vGap15,
              CustomTextField(
                onChanged: (val) {},
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
