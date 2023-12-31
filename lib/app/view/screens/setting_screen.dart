import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/app/view/widgets/avatar_widget.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/app_icons.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_list_tile.dart';
import 'package:school_bills/core/widgets/dialog_loader.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authProvider).user;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: ListView(
        padding: Config.contentPadding(
            h: 20, v: MediaQuery.viewPaddingOf(context).top + 20),
        children: [
          const AvatarWidget(),
          Text(
            '${user?.fullName}'.capSentence,
            style: Config.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          Text('${user?.id}'.toUpperCase(), textAlign: TextAlign.center),
          Config.vGap20,
          Container(
            padding: Config.contentPadding(h: 15, v: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                CustomListTile(
                  iconData: AppIcons.user,
                  title: 'Your Profile',
                  onPressed: () => context.goNamed(Routes.profile),
                ),
                CustomListTile(
                  iconData: AppIcons.privacy,
                  title: 'Change Password',
                  onPressed: () => context.goNamed(Routes.changePassword),
                ),
                Consumer(builder: (context, ref, child) {
                  return CustomListTile(
                    iconData: AppIcons.logout,
                    highlightColor: Theme.of(context).colorScheme.error,
                    title: 'Logout',
                    hasTrailing: false,
                    onPressed: () async {
                      DialogLoader.request(
                          context: context,
                          request: ref.watch(authProvider.notifier).logout(),
                          onDone: (success) {
                            if (success) {
                              context.go(Routes.auth);
                            } else {
                              context.pop();
                            }
                          });
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
