import 'package:flutter/material.dart';
import 'package:school_bills/app/view/widgets/avatar_widget.dart';
import 'package:school_bills/app/view/widgets/bill_banner.dart';
import 'package:school_bills/app/view/widgets/bill_modal.dart';
import 'package:school_bills/core/utils/app_icons.dart';
import 'package:school_bills/core/utils/config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: Config.contentPadding(
            h: 20, v: MediaQuery.viewPaddingOf(context).top + 20),
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: AvatarWidget(),
          ),
          Config.vGap20,
          const BillBanner(),
          Config.vGap20,
          Text('Student Bills', style: Config.b1b),
          Config.vGap20,
          ListTile(
            selected: true,
            selectedTileColor: theme.colorScheme.primary.withOpacity(0.1),
            leading: Icon(AppIcons.school),
            title: const Text('School fees'),
            subtitle: const Text('Pay your sessional fees'),
            onTap: () async {
              await showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return const BillModal();
                  });
            },
          ),
          Config.vGap20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: Config.contentPadding(h: 20, v: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.colorScheme.primary,
                  ),
                  child: Row(
                    children: [
                      Icon(AppIcons.addOl, color: Colors.white),
                      Config.hGap10,
                      Text('Add bill',
                          style: Config.b1.copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
