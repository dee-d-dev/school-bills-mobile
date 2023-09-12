import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_bills/app/data/models/bill_model.dart';

part 'generated/bills_state.freezed.dart';

enum BillsLoadingState {
  idle,
  getingAllBills,
  getingMyBills,
  getingPaidBills,
  getingUnpaidBills
}

@freezed
class BillsState with _$BillsState {
  const factory BillsState({
    @Default(BillsLoadingState.idle) BillsLoadingState state,
    @Default([]) List<BillModel> allBills,
  }) = _BillsState;
}
