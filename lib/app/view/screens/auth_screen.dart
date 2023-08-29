import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/widgets/title_card.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/app_icons.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.vGap20,
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          colorScheme.primary.withOpacity(0.2)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: Image.asset('assets/images/mockup.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TileCard(
                          iconData: AppIcons.school,
                          title: 'School fees',
                          subtitle: 'Pay your sessional fees',
                        ),
                        Config.vGap5,
                        TileCard(
                          iconData: AppIcons.hostel,
                          title: 'Hostel fees',
                          subtitle: 'Apply for hostel space',
                        ),
                        SizedBox(height: constraint.maxHeight / 6),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                colorScheme.primary.withOpacity(0.2),
                colorScheme.primary.withOpacity(0.5)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  hPadding: 20,
                  text: 'Log in',
                  onPressed: () => context.goNamed(Routes.login),
                ),
                Config.vGap15,
                CustomButton(
                  hPadding: 20,
                  text: 'Student sign up',
                  onPressed: () => context.goNamed(Routes.studentSignup),
                ),
                Config.vGap15,
                CustomButton(
                  hPadding: 20,
                  text: 'Admin sign up',
                  onPressed: () => context.goNamed(Routes.adminSignup),
                ),
                Config.vGap20,
                Config.vGap20,
              ],
            ),
          )
        ],
      ),
    );
  }
}
