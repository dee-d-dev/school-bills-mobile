import 'package:flutter/material.dart';
import 'package:school_bills/app/view/widgets/reciept_info.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

class BillModal extends StatelessWidget {
  const BillModal({
    super.key,
  });

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
              child: Text(110000.00.price, style: Config.textTheme.titleLarge)),
          Config.vGap30,
          const RecieptInfo(
            leading: 'Student bill',
            trailing: 'School fees',
          ),
          Config.vGap30,
          RecieptInfo(
            leading: 'Amount',
            trailing: 110000.00.price,
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
          Image.asset('assets/images/paystack.png'),
          CustomButton(
            text: 'Confirm',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
