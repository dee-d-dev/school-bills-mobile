import 'package:flutter/material.dart';
import 'package:school_bills/app/view/widgets/reciept_info.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

class RecieptScreen extends StatelessWidget {
  const RecieptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: Config.contentPadding(h: 20),
        children: [
          Text('SCHOOL FEES', style: Config.b2, textAlign: TextAlign.center),
          Text(110000.00.price, style: Config.h1, textAlign: TextAlign.center),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Date & Time',
            trailing: '08/14/23, 07:48:19',
          ),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Student bill',
            trailing: 'School fee',
          ),
          Config.vGap30,
          RecieptInfo(
            leading: 'Amount',
            trailing: 110000.00.price,
          ),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Level',
            trailing: '300',
          ),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Department',
            trailing: 'Life Sciences',
          ),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Faculty',
            trailing: 'Biochemistry',
          ),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Payment channel',
            trailing: 'Paystack',
          ),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Status',
            trailing: 'Successful',
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
