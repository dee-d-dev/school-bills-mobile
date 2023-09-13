import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/app/view/provider/bills_provider.dart';
import 'package:school_bills/app/view/provider/bills_state.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/platform_specific/platform_progress_indicator.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';
import 'package:school_bills/core/widgets/custom_text_field.dart';

class CreateBillScreen extends StatefulWidget {
  const CreateBillScreen({super.key});

  @override
  State<CreateBillScreen> createState() => _CreateBillScreenState();
}

class _CreateBillScreenState extends State<CreateBillScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final _departmentCtrl = TextEditingController();
  final _facultyCtrl = TextEditingController();
  final _bankNameCtrl = TextEditingController();
  final _accountNoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.read(authProvider).user!;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: Config.contentPadding(h: 20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Text('Create bill', style: Config.textTheme.titleSmall),
                  Config.vGap20,
                  CustomTextField(
                    controller: _nameCtrl,
                    hint: 'Name of bill',
                  ),
                  Config.vGap15,
                  CustomTextField(
                    controller: _amountCtrl,
                    hint: 'Amount',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyInputFormatter(maxDigits: 9),
                    ],
                  ),
                  Config.vGap15,
                  if ((user.faculty ?? '').isNotEmpty)
                    CustomTextField(
                      controller: _facultyCtrl,
                      hint: 'Faculty',
                    )
                  else
                    CustomTextField(
                      controller: _departmentCtrl,
                      hint: 'Department',
                    ),
                  Config.vGap15,
                  CustomTextField(
                    controller: _accountNoCtrl,
                    keyboardType: TextInputType.number,
                    hint: 'Account number',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  Config.vGap15,
                  CustomTextField(
                    controller: _bankNameCtrl,
                    hint: 'Bank name',
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Config.vGap15,
              switch (ref.watch(billsProvider).state) {
                BillsLoadingState.creatingBill =>
                  const PlatformProgressIndicator(),
                _ => CustomButton(
                    text: 'Continue',
                    onPressed: () async {
                      final isValid =
                          _formKey.currentState?.validate() ?? false;
                      if (!isValid) return;
                      await ref
                          .read(billsProvider.notifier)
                          .createBill(
                            title: _nameCtrl.text,
                            amount: double.parse(_amountCtrl.text),
                            department: _departmentCtrl.text,
                            faculty: _facultyCtrl.text,
                            bankName: _bankNameCtrl.text,
                            accountNo: _accountNoCtrl.text,
                          )
                          .then((success) async {
                        if (success) {
                          ref.read(billsProvider.notifier).getAllBills();
                          context.pop();
                        }
                      });
                    },
                  )
              },
              Config.vGap20,
            ],
          ),
        );
      },
    );
  }
}
