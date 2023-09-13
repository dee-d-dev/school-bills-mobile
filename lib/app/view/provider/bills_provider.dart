import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/domain/bills_repository.dart';
import 'package:school_bills/app/view/provider/bills_state.dart';
import 'package:school_bills/core/di/service_locator.dart';
import 'package:school_bills/core/services/dialog_service/dialog_service.dart';

final billsProvider = NotifierProvider<BillsProvider, BillsState>(
  () => sl<BillsProvider>(),
);

final class BillsProvider extends Notifier<BillsState> {
  final BillsRepository billsRepository;
  final DialogService dialogService;
  BillsProvider({required this.billsRepository, required this.dialogService});

  @override
  BillsState build() => const BillsState();

  Future<bool> getAllBills() async {
    state = state.copyWith(state: BillsLoadingState.getingAllBills);
    final res = await billsRepository.getAllBills();
    state = state.copyWith(state: BillsLoadingState.idle);
    return res.when(
      success: (bills) {
        state = state.copyWith(allBills: bills);
        return true;
      },
      error: (error) {
        dialogService.displayMessage(error.message);
        return false;
      },
    );
  }

  Future<bool> getMyBills() async {
    state = state.copyWith(state: BillsLoadingState.getingAllBills);
    final res = await billsRepository.getMyBills();
    state = state.copyWith(state: BillsLoadingState.idle);
    return res.when(
      success: (bills) {
        state = state.copyWith(allBills: bills);
        return true;
      },
      error: (error) {
        dialogService.displayMessage(error.message);
        return false;
      },
    );
  }

  Future<bool> createBill({
    required String title,
    required double amount,
    required String department,
    required String faculty,
    required String bankName,
    required String accountNo,
  }) async {
    state = state.copyWith(state: BillsLoadingState.payinBill);
    final res = await billsRepository.createBill(
      title: title,
      amount: amount,
      department: department,
      faculty: faculty,
      bankName: bankName,
      accountNo: accountNo,
    );
    state = state.copyWith(state: BillsLoadingState.idle);
    return res.when(
      success: (success) => success,
      error: (error) {
        dialogService.displayMessage(error.message);
        return false;
      },
    );
  }

  Future<String?> payBill(String id) async {
    state = state.copyWith(state: BillsLoadingState.payinBill);
    final res = await billsRepository.payBill(id);
    state = state.copyWith(state: BillsLoadingState.idle);
    return res.when(
      success: (reference) => reference.authorizationUrl,
      error: (error) {
        dialogService.displayMessage(error.message);
        return null;
      },
    );
  }

  // Future<bool> getPaidBills() async {
  //   state = state.copyWith(state: BillsLoadingState.getingAllBills);
  //   final res = await billsRepository.getPaidBills();
  //   state = state.copyWith(state: BillsLoadingState.idle);
  //   return res.when(
  //     success: (bills) {
  //       state = state.copyWith(allBills: bills);
  //       return true;
  //     },
  //     error: (error) {
  //       dialogService.displayMessage(error.message);
  //       return false;
  //     },
  //   );
  // }

  // Future<bool> getUnpaidBills() async {
  //   state = state.copyWith(state: BillsLoadingState.getingAllBills);
  //   final res = await billsRepository.getUnpaidBills();
  //   state = state.copyWith(state: BillsLoadingState.idle);
  //   return res.when(
  //     success: (bills) {
  //       state = state.copyWith(allBills: bills);
  //       return true;
  //     },
  //     error: (error) {
  //       dialogService.displayMessage(error.message);
  //       return false;
  //     },
  //   );
  // }
}
