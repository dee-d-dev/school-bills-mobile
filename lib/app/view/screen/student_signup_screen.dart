import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Config.contentPadding(h: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Student sign up', style: Config.h1),
              Config.vGap20,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Name',
              ),
              Config.vGap14,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Department',
              ),
              Config.vGap14,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Faculty',
              ),
              Config.vGap14,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Matriculation Number',
              ),
              Config.vGap14,
              CustomTextField(
                onChanged: (val) {},
                hint: 'Email',
              ),
              Config.vGap14,
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
          Config.vGap14,
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
