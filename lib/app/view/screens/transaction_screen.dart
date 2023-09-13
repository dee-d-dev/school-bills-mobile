import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/app/view/provider/transactions_provider.dart';
import 'package:school_bills/app/view/widgets/empty_widget.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/platform_specific/platform_progress_indicator.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/app_icons.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

enum TransactionFilter { all, department, faculty }

class TransactionScreen extends ConsumerStatefulWidget {
  const TransactionScreen({super.key});

  @override
  ConsumerState<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen> {
  TransactionFilter _filter = TransactionFilter.all;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = ref.read(authProvider).user!;
      if (user.isStudent) {
        ref.read(transactionProvider.notifier).getTransactions();
      } else {
        ref.read(transactionProvider.notifier).getAllAdminTransactions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionProvider);
    final user = ref.read(authProvider).user!;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Transactions', style: Config.textTheme.titleSmall),
        actions: [
          if (user.isStudent)
            PopupMenuButton<TransactionFilter>(
              padding: Config.contentPadding(h: 20),
              initialValue: _filter,
              icon: Container(
                padding: Config.contentPadding(h: 8, v: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: theme.colorScheme.primary.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Icon(AppIcons.filter),
                    Config.hGap10,
                    Text(_filter.name.capSentence)
                  ],
                ),
              ),
              elevation: 1,
              onSelected: (value) {
                if (value == _filter) return;
                _filter = value;
                ref.read(transactionProvider.notifier).getTransactions(_filter);
              },
              itemBuilder: (context) => TransactionFilter.values
                  .map<PopupMenuItem<TransactionFilter>>((value) {
                return PopupMenuItem<TransactionFilter>(
                  value: value,
                  child: Text(value.name.capSentence),
                );
              }).toList(),
            ),
        ],
      ),
      body: Container(
        margin: Config.contentPadding(h: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.primary.withOpacity(0.1),
        ),
        child: state.when(
          idle: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: PlatformProgressIndicator(),
          ),
          loaded: (transactions) {
            return RefreshIndicator(
              onRefresh: () {
                if (user.isStudent) {
                  return ref
                      .read(transactionProvider.notifier)
                      .getTransactions();
                } else {
                  return ref
                      .read(transactionProvider.notifier)
                      .getAllAdminTransactions();
                }
              },
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return ListTile(
                    leading: Icon(AppIcons.school),
                    title: Text(transaction.title.capSentence),
                    subtitle:
                        Text('Paystack • ${transaction.paidAt.formatdmy}'),
                    trailing: Text(transaction.amount.toDouble().price,
                        style: Config.textTheme.bodySmall),
                    onTap: () => context.goNamed(Routes.reciept,
                        pathParameters: {'id': transaction.id}),
                  );
                },
              ),
            );
          },
          empty: () => const EmptyWidget(
            title: 'No transactions found',
            subtitle: 'Your transactions would appear here',
          ),
          error: (message) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, textAlign: TextAlign.center),
              Config.vGap15,
              CustomButton(
                hPadding: 20,
                text: 'Retry',
                onPressed: () => ref
                    .read(transactionProvider.notifier)
                    .getTransactions(_filter),
              )
            ],
          ),
        ),
      ),
    );
  }
}
