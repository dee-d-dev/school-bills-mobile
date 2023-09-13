import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/view/provider/transactions_provider.dart';
import 'package:school_bills/app/view/widgets/reciept_info.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

class RecieptScreen extends ConsumerStatefulWidget {
  final String id;
  const RecieptScreen({super.key, required this.id});

  @override
  ConsumerState<RecieptScreen> createState() => _RecieptScreenState();
}

class _RecieptScreenState extends ConsumerState<RecieptScreen> {
  final _screenshotKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.read(transactionProvider).whenOrNull(
        loaded: (transactions) {
          final transaction = transactions.firstWhere((e) => e.id == widget.id);
          return RepaintBoundary(
            key: _screenshotKey,
            child: Material(
              child: ListView(
                padding: Config.contentPadding(h: 20, v: 20),
                children: [
                  Text(transaction.title.toUpperCase(),
                      textAlign: TextAlign.center),
                  Text(transaction.amount.toDouble().price,
                      style: Config.textTheme.titleLarge,
                      textAlign: TextAlign.center),
                  Config.vGap30,
                  RecieptInfo(
                    leading: 'Date & Time',
                    trailing:
                        '${transaction.paidAt.formatStroke}, ${transaction.paidAt.formatTime}',
                  ),
                  Config.vGap30,
                  RecieptInfo(
                    leading: 'Student bill',
                    trailing: transaction.title.capSentence,
                  ),
                  Config.vGap30,
                  RecieptInfo(
                    leading: 'Amount',
                    trailing: transaction.amount.toDouble().price,
                  ),
                  if (transaction.department.isNotEmpty) ...[
                    Config.vGap30,
                    RecieptInfo(
                      leading: 'Department',
                      trailing: transaction.department.capSentence,
                    ),
                  ],
                  if (transaction.faculty.isNotEmpty) ...[
                    Config.vGap30,
                    RecieptInfo(
                      leading: 'Faculty',
                      trailing: transaction.faculty.capSentence,
                    ),
                  ],
                  Config.vGap30,
                  const RecieptInfo(
                    leading: 'Payment channel',
                    trailing: 'Paystack',
                  ),
                  Config.vGap30,
                  RecieptInfo(
                    leading: 'Status',
                    trailing: transaction.status.capSentence,
                  ),
                  Config.vGap30,
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.vGap15,
          CustomButton(
            hPadding: 20,
            text: 'Share receipt',
            onPressed: () => ref
                .read(transactionProvider.notifier)
                .shareTransaction(_screenshotKey),
          ),
          Config.vGap20,
        ],
      ),
    );
  }
}
