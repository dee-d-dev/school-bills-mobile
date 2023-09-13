import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/data/models/bill_model.dart';
import 'package:school_bills/app/data/models/user_model.dart';
import 'package:school_bills/app/view/provider/bills_provider.dart';
import 'package:school_bills/app/view/provider/bills_state.dart';
import 'package:school_bills/app/view/widgets/reciept_info.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/platform_specific/platform_progress_indicator.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

class BillModal extends StatelessWidget {
  final UserModel user;
  final BillModel bill;
  const BillModal({super.key, required this.bill, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Config.contentPaddingLTRB(20, 0, 20, 10),
      padding: Config.contentPadding(h: 15, v: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.center,
              child:
                  Text(bill.amount.price, style: Config.textTheme.titleLarge)),
          Config.vGap30,
          RecieptInfo(
            leading: 'Student bill',
            trailing: bill.title.capSentence,
          ),
          Config.vGap30,
          RecieptInfo(
            leading: 'Amount',
            trailing: bill.amount.price,
          ),
          if ((user.department ?? '').isNotEmpty) ...[
            Config.vGap30,
            RecieptInfo(
                leading: 'Department',
                trailing: '${user.department}'.capSentence),
          ],
          if ((user.faculty ?? '').isNotEmpty) ...[
            Config.vGap30,
            RecieptInfo(
                leading: 'Faculty', trailing: '${user.faculty}'.capSentence),
          ],
          Config.vGap30,
          Image.asset('assets/images/paystack.png'),
          Consumer(
            builder: (context, ref, child) {
              return switch (ref.watch(billsProvider).state) {
                BillsLoadingState.payinBill =>
                  const PlatformProgressIndicator(),
                _ => CustomButton(
                    text: 'Confirm',
                    onPressed: () async {
                      ref
                          .read(billsProvider.notifier)
                          .payBill(bill.id)
                          .then((url) async {
                        if (url == null) return;
                        await context
                            .push(Routes.browser, extra: url)
                            .then((_) {
                          context.pop();
                        });
                        ref.read(billsProvider.notifier).getMyBills();
                      });
                    },
                  ),
              };
            },
          ),
        ],
      ),
    );
  }
}
