import 'package:flutter/material.dart';
import 'package:school_bills/app/data/models/transaction_model.dart';
import 'package:school_bills/app/view/widgets/reciept_info.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

class RecieptScreen extends StatelessWidget {
  final TransactionModel transaction;
  const RecieptScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: Config.contentPadding(h: 20),
        children: [
          Text(transaction.title.toUpperCase(), textAlign: TextAlign.center),
          Text(transaction.amount.toDouble().price,
              style: Config.textTheme.titleLarge, textAlign: TextAlign.center),
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
          Config.vGap30,
          RecieptInfo(
            leading: 'Department',
            trailing: transaction.department.capSentence,
          ),
          Config.vGap30,
          RecieptInfo(
            leading: 'Faculty',
            trailing: transaction.faculty.capSentence,
          ),
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.vGap15,
          CustomButton(
            hPadding: 20,
            text: 'Download receipt',
            onPressed: () {},
          ),
          Config.vGap20,
        ],
      ),
    );
  }
}
