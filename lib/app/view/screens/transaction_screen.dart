import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/app_icons.dart';
import 'package:school_bills/core/utils/config.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions', style: Config.textTheme.titleSmall),
      ),
      body: Container(
        margin: Config.contentPadding(h: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.primary.withOpacity(0.1),
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(AppIcons.school),
              title: const Text('School fees'),
              subtitle: const Text('Paystack • Aug 15, 2023'),
              trailing:
                  Text(110000.00.price, style: Config.textTheme.bodySmall),
              onTap: () => context.goNamed(Routes.reciept),
            );
          },
        ),
      ),
    );
  }
}
