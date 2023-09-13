import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_bills/app/data/models/transaction_model.dart';

part 'generated/transactions_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.idle() = _Idle;
  const factory TransactionsState.loading() = _Loading;
  const factory TransactionsState.empty() = _Empty;
  const factory TransactionsState.loaded(List<TransactionModel> transactions) =
      _Loaded;
  const factory TransactionsState.error(String message) = _Error;
}
