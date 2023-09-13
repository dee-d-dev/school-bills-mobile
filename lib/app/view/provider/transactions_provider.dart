import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/domain/transactions_repository.dart';
import 'package:school_bills/app/view/provider/transactions_state.dart';
import 'package:school_bills/app/view/screens/transaction_screen.dart';
import 'package:school_bills/core/di/service_locator.dart';

final transactionProvider =
    NotifierProvider<TransactionsProvider, TransactionsState>(
  () => sl<TransactionsProvider>(),
);

final class TransactionsProvider extends Notifier<TransactionsState> {
  final TransactionsRepository transactionsRepository;
  TransactionsProvider({required this.transactionsRepository});

  @override
  TransactionsState build() => const TransactionsState.idle();

  Future<bool> getTransactions(
      [TransactionFilter filter = TransactionFilter.all]) async {
    state = const TransactionsState.loading();
    final res = await switch (filter) {
      TransactionFilter.all => transactionsRepository.getMyTransactions(),
      TransactionFilter.department =>
        transactionsRepository.getDepartmentTransactions(),
      TransactionFilter.faculty =>
        transactionsRepository.getFacultyTransactions(),
    };
    return res.when(
      success: (transactions) {
        state = transactions.isEmpty
            ? const TransactionsState.empty()
            : TransactionsState.loaded(transactions);
        return true;
      },
      error: (error) {
        state = TransactionsState.error(error.message);
        return false;
      },
    );
  }

  Future<bool> getAllAdminTransactions() async {
    state = const TransactionsState.loading();
    final res = await transactionsRepository.getAllAdminTransactions();
    return res.when(
      success: (transactions) {
        state = transactions.isEmpty
            ? const TransactionsState.empty()
            : TransactionsState.loaded(transactions);
        return true;
      },
      error: (error) {
        state = TransactionsState.error(error.message);
        return false;
      },
    );
  }
}
