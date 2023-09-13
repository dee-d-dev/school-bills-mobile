import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/app/view/provider/bills_provider.dart';
import 'package:school_bills/app/view/provider/bills_state.dart';
import 'package:school_bills/app/view/widgets/admin_bill_banner.dart';
import 'package:school_bills/app/view/widgets/avatar_widget.dart';
import 'package:school_bills/app/view/widgets/bill_banner.dart';
import 'package:school_bills/app/view/widgets/bill_modal.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/platform_specific/platform_progress_indicator.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/app_icons.dart';
import 'package:school_bills/core/utils/config.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = ref.read(authProvider).user!;
      if (user.isStudent) {
        ref.read(billsProvider.notifier).getMyBills();
      } else {
        ref.read(billsProvider.notifier).getAllBills();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = ref.read(authProvider).user!;
    final bills = ref.watch(billsProvider).allBills;
    final paidBills = bills.where((e) => e.hasPaid).toList();
    final unpaidBills = bills.where((e) => !e.hasPaid).toList();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          if (user.isStudent) {
            return ref.read(billsProvider.notifier).getMyBills();
          } else {
            return ref.read(billsProvider.notifier).getAllBills();
          }
        },
        child: switch (ref.read(billsProvider).state) {
          BillsLoadingState.getingAllBills =>
            const Center(child: PlatformProgressIndicator()),
          _ => ListView(
              padding: Config.contentPadding(
                  v: MediaQuery.viewPaddingOf(context).top + 20),
              children: [
                Padding(
                  padding: Config.contentPadding(h: 20),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: AvatarWidget(),
                  ),
                ),
                Config.vGap20,
                if (user.isStudent)
                  BillBanner(paidBills: paidBills)
                else
                  AdminBillBanner(user: user),
                Config.vGap20,
                Padding(
                  padding: Config.contentPadding(h: 20),
                  child: Text('Student Bills',
                      style: Config.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600)),
                ),
                Config.vGap20,
                ...unpaidBills.map(
                  (e) {
                    return Padding(
                      padding: Config.contentPadding(h: 20),
                      child: Column(
                        children: [
                          ListTile(
                            selected: true,
                            selectedTileColor:
                                theme.colorScheme.primary.withOpacity(0.1),
                            leading: Icon(AppIcons.school),
                            title: Text(e.title.capSentence),
                            subtitle: Text(e.amount.price),
                            onTap: user.isStudent
                                ? () async {
                                    await showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return BillModal(bill: e, user: user);
                                        });
                                  }
                                : null,
                          ),
                          const Divider(height: 0, thickness: 2),
                        ],
                      ),
                    );
                  },
                ),
                Config.vGap20,
                ref.read(authProvider).user?.isStudent == true
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => context.goNamed(Routes.createBill),
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
                                      style: Config.textTheme.bodyMedium
                                          ?.copyWith(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
              ],
            )
        },
      ),
    );
  }
}
